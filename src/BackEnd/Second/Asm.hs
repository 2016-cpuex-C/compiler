{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Asm where

import Base

import           Data.Vector (Vector, (!))
import qualified Data.Vector as V
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Data.List (find, isPrefixOf, partition)
import           Control.Lens ((<+=),(<&>))
import Data.List.Extra (groupSort)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data AProg = AProg [AFunDef]
           deriving (Show,Eq,Ord)

data AFunDef = AFunDef {
    aFunName :: Label
  , aArgs    :: [Id]
  , aFArgs   :: [Id]
  , aBody    :: [ABlock]
  , aRet     :: Type
  } deriving (Show,Eq,Ord)

data ABlock
  = ABlock {
    aBlockName  :: Label
  , aStatements :: [Statement]
  } deriving (Show,Eq,Ord)

type Statement = (InstId, Inst)

type InstId = Int

type Inst = Named AExpr

data AExpr -- 多相的な命令には型を加える
  = ANop
  | ASet   Integer
  | ASetF  Label
  | ASetL  Label -- closure
  | AMove  Id
  | AAdd   Id IdOrImm
  | ASub   Id IdOrImm
  | AMul   Id IdOrImm
  | ADiv   Id IdOrImm
  | ASll   Id IdOrImm
  | ASrl   Id IdOrImm
  | ALd    Id IdOrImm -- Idの方は使わなさそう
  | ASt    Id Id IdOrImm
  | ALdi   Integer
  | ASti   Id Integer

  | AFMov  Id
  | AFAdd  Id Id
  | AFSub  Id Id
  | AFMul  Id Id
  | AFDiv  Id Id
  | AFLd   Id IdOrImm
  | AFSt   Id Id IdOrImm
  | AFLdi  Integer
  | AFSti  Id Integer

  -- boolean
  | AAnd    Id IdOrImm
  | AOr     Id IdOrImm
  | AXor    Id IdOrImm

  -- compare
  | ACmp  Predicate Id IdOrImm
  | AFCmp Predicate Id Id

  -- swap -- SSA Deconstruction 以降出現
  | ASwap Id Id
  | AFSwap Id Id

  -- call
  | ACallDir Type Label [Id] [Id]

  -- select TODO Floatはダメ(なのでTypeも不要)
  | ASelect Type Id IdOrImm IdOrImm

  -- 仮想命令
  | APtr  Id    [IdOrImm]         -- Virtual.hsで消す
  | APtrG Label [IdOrImm]         -- Virtual.hsで消す
  | APhi  [(Label,PhiVal)]        -- Virtual.hsで消す
  | APhiV [(Label,[(Id,PhiVal)])] -- Virtual.hsで出現 ベクトル化
  | ASave     Id                  -- Virtual.hsで出現
  | AFSave    Id                  -- Virtual.hsで出現
  | ARestore  Id                  -- Virtual.hsで出現
  | AFRestore Id                  -- Virtual.hsで出現
    -- heap
  | AGetHP
  | AStHP  Id IdOrImm
  | AFStHP Id IdOrImm
  | AIncHP IdOrImm

  -- terminator
  | ARet    Type (Maybe IdOrImm)
  | ABr     Label
  | ACBr    Id Label Label
  | ASwitch Id Label [(Integer,Label)]
  | AExit
  deriving (Show,Eq,Ord)

data IdOrImm
  = V Id
  | C Integer
  deriving (Show,Eq,Ord)

data PhiVal
  = PVInt   Integer
  | PVVar   (Id,Type)
  | PVFloat Label
  deriving (Show,Eq,Ord)

type Register = Id

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

----------
-- Prog --
----------

mainAndOthers :: AProg -> (AFunDef,[AFunDef])
mainAndOthers (AProg fs) =
  let ([main],others) = partition (\f -> aFunName f == Label "main") fs
  in (main,others)

------------
-- FunDef --
------------

isEmptyFun :: AFunDef -> Bool
isEmptyFun = null.aBody

entryBlock :: AFunDef -> ABlock
entryBlock (AFunDef _ _ _ blocks _) =
  let name b = let Label l = aBlockName b in l
      Just eb = find (\b -> "entry." `isPrefixOf` (name b)) blocks
  in  eb

entryBlockName :: AFunDef -> Label
entryBlockName = aBlockName . entryBlock

blockMap :: AFunDef -> Map Label ABlock
blockMap (AFunDef _ _ _ blocks _) =
  M.fromList [ (l,b) | b@(ABlock l _) <- blocks]

-- TODO なるべくbr命令が潰せるように並び替える
sortBlock :: AFunDef -> [ABlock]
sortBlock (AFunDef _ _ _ blocks _) =
  let name = unLabel . aBlockName
      ([entry],others) = partition (\b -> "entry." `isPrefixOf` (name b)) blocks
  in entry:others

defSiteMap :: AFunDef -> Map Id Statement
defSiteMap (AFunDef _ _ _ blocks _) = M.unions $ map defSiteMapB blocks

useSiteMap :: AFunDef -> Map Id [Statement]
useSiteMap (AFunDef _ _ _ blocks _) = M.unions $ map useSiteMapB blocks

-----------
-- Block --
-----------

nextBlockNames :: ABlock -> [Label]
nextBlockNames (ABlock _ contents) = f $ toExpr $ last contents
  where
    toExpr (_,Do i) = i
    toExpr (_,_:=i) = i
    f = \case
      ARet{} -> []
      ABr l  -> [l]
      ACBr _ l1 l2 -> [l1,l2]
      ASwitch _ l ils -> l : map snd ils
      i -> error $
        "BackEnd.Second.Asm: nextBlockNames: non-terminator: " ++ show i

firstStmt :: ABlock -> Statement
firstStmt = head . aStatements

lastStmt :: ABlock -> (InstId, Inst)
lastStmt  = last . aStatements

defSiteMapB :: ABlock -> Map Id Statement
defSiteMapB (ABlock _ stmts) = M.fromList $ concat $
  [ zip (xs++ys) (repeat s) | s <- stmts, let (xs,ys) = toList2 $ defInst (snd s) ]

useSiteMapB :: ABlock -> Map Id [Statement]
useSiteMapB (ABlock _ stmts) = M.fromList $ groupSort $ concat
  [ zip (xs++ys) (repeat s) | s <- stmts, let (xs,ys) = toList2 $ useInst (snd s) ]

----------
-- Inst --
----------

freshInstId :: Caml Int
freshInstId = instCount<+=1

assignInstId :: Inst -> Caml Statement
assignInstId i = freshInstId <&> (,i)

defInst :: Inst -> (Set Id, Set Id)
defInst (Do (APhiV ps)) =
    (S.fromList [ x | (x,v) <- concatMap snd ps, not (isFloat v)]
    ,S.fromList [ x | (x,v) <- concatMap snd ps, isFloat v])
  where
    isFloat PVFloat{}          = True
    isFloat (PVVar (_,TFloat)) = True
    isFloat _                  = False
defInst Do{} = (S.empty, S.empty)
defInst (x:=i) | float i   = (S.empty, S.singleton x)
               | otherwise = (S.singleton x, S.empty)
  where
    float = \case-- {{{
      ASetF {} -> True
      AFMov {} -> True
      AFAdd {} -> True
      AFSub {} -> True
      AFMul {} -> True
      AFDiv {} -> True
      AFLd  {} -> True
      AFLdi {} -> True
      ACallDir TFloat _ _ _ -> True
      ASelect  TFloat _ _ _ -> True
      _ -> False
-- }}}

useInst :: Inst -> (Set Id, Set Id)
useInst = \case
    (Do i) -> fromList2 $ g i
    (_:=i) -> fromList2 $ g i
  where
    h C{} = [] -- {{{
    h (V x) = [x]
    g :: AExpr -> ([Id],[Id])
    g i = case i of
      ANop             -> ([],[])
      ASet{}           -> ([],[])
      ASetF{}          -> ([],[])
      ASetL{}          -> ([],[])
      ALdi{}           -> ([],[])
      AFLdi{}          -> ([],[])
      ABr{}            -> ([],[])
      ASti x _         -> ([x],[])
      AFSti x _        -> ([],[x])
      AMove x          -> ([x],[])
      ACBr x _ _       -> ([x],[])
      ASwitch x _ _    -> ([x],[])
      AFMov x          -> ([],[x])
      AFAdd x y        -> ([],[x,y])
      AFSub x y        -> ([],[x,y])
      AFMul x y        -> ([],[x,y])
      AFDiv x y        -> ([],[x,y])
      AFCmp _ x y      -> ([],[x,y])

      AAdd x y'        -> (x : h y', [])
      ASub x y'        -> (x : h y', [])
      AMul x y'        -> (x : h y', [])
      ADiv x y'        -> (x : h y', [])
      ACmp  _ x y'     -> (x : h y', [])
      ASll    x y'     -> (x : h y', [])
      ASrl    x y'     -> (x : h y', [])
      AAnd    x y'     -> (x : h y', [])
      AOr     x y'     -> (x : h y', [])
      AXor    x y'     -> (x : h y', [])
      ALd   x y'       -> (x : h y', [])
      AFLd  x y'       -> (x : h y', [])
      ASt   x y z'     -> (x : y : h z', [])
      AFSt  x y z'     -> (y : h z', [x])

      ASwap  x y       -> ([x,y],[])
      AFSwap x y       -> ([],[x,y])

      APtr x y'        -> (x : concatMap h y', [])
      APtrG _ y'       -> (concatMap h y', [])

      AGetHP      -> ([],[])
      AStHP x y'  -> (x : h y',[])
      AFStHP x y' -> (h y', [x])
      AIncHP x'   -> (h x',[])

      ACallDir _ _ xs ys -> (xs,ys)

      ASelect TFloat x y' z' -> ([x], h y' ++ h z')
      ASelect _      x y' z' -> (x : h y' ++ h z', [])
      ARet _ Nothing         -> ([],[])
      ARet TFloat (Just x')  -> ([],h x')
      ARet _      (Just x')  -> (h x',[])

      APhi lvs -> ([ y | (_, PVVar (y, t)) <- lvs, t/=TFloat ]
                  ,[ y | (_, PVVar (y, t)) <- lvs, t==TFloat ])
      APhiV ps -> ([ y | (_, PVVar (y, t)) <- concatMap snd ps, t/=TFloat ]
                  ,[ y | (_, PVVar (y, t)) <- concatMap snd ps, t==TFloat ])

      -- TODO
      ASave x     -> ([x],[])
      AFSave x    -> ([],[x])
      ARestore{}  -> ([],[])
      AFRestore{} -> ([],[])
      AExit       -> ([],[])
      --}}}

-------------------------------------------------------------------------------
-- Register
-------------------------------------------------------------------------------

allRegs :: [Register]
allRegs = concat [
    [ "$v"++show i | i <- [0..1] :: [Int]]
  , [ "$a"++show i | i <- [0..3] :: [Int]]
  , [ "$t"++show i | i <- [0..7] :: [Int]]
  , [ "$s"++show i | i <- [0..7] :: [Int]]
  , [ "$t"++show i | i <- [8..8] :: [Int]]
  , [ "$t9" ]
  , [ "$k"++show i | i <- [0..1] :: [Int]]
--, [ "$gp" ]                              -- global pointer (base of global data)
--, [ "$sp" ]                              -- stack pointer
  , [ "$fp" ]
--, [ "$ra" ]                              -- return address
--, [ "$zero" ]                            -- zero register
  , [ "$at" ]
  ]

allFRegs :: [Register]
allFRegs = [ "$f"++show i | i <- [0..31] :: [Int]]

regs :: Vector Register
regs = V.fromList allRegs

fregs :: Vector Register
fregs = V.fromList allFRegs

-- closure address
regCl :: Register
regCl = regs ! (V.length regs-1)

-- for swapping
regSw :: Register
regSw = regs ! (V.length regs-2)
regFSw :: Register
regFSw = fregs ! (V.length fregs-1)

-- stack pointer
regSp :: Register
regSp = "$sp"

-- zero register
regZero :: Register
regZero = "$zero"

-- heap pointer
regHp :: Register
regHp = "$gp"

-- return address
regRa :: Register
regRa = "$ra"

isReg :: Id -> Bool
isReg = ('$'==) . head

