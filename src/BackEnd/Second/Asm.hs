{-# LANGUAGE LambdaCase #-}

module BackEnd.Second.Asm where

import Base

import           Data.Vector (Vector, (!))
import qualified Data.Vector as V
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Graph
import           Data.Maybe (fromJust)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data AProg = AProg [AFunDef]
            deriving (Show,Eq,Ord)

data AFunDef = AFunDef {
    aname  :: Label
  , aargs  :: [Id]
  , afargs :: [Id]
  , abody  :: [ABlock]
  , aret   :: Type
  } deriving (Show,Eq,Ord)

data ABlock
  = ABlock {
    ablockName     :: Label
  , ablockContents :: [(InstId, Named AInst)]
  } deriving (Show,Eq,Ord)

data AInst -- 多相的な命令には型を加える
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
  -- swap
  | ASwap Id Id
  | AFSwap Id Id
  -- call
  | ACallDir Type Label [Id] [Id]

  -- 分岐
  | ASelect Type Id IdOrImm IdOrImm

  -- 仮想命令
  | APtr  Id    [IdOrImm]
  | APtrG Label [IdOrImm]
  | APhi  [(Label,PhiVal)]
  | APhiV [(Label,[(Id,PhiVal)])] -- ベクトル化
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
  deriving (Show,Eq,Ord)

data IdOrImm
  = V Id
  | C Integer
  deriving (Show,Eq,Ord)

type Register = String
type InstId = Int

data PhiVal = PVInt   Integer
            | PVVar   (Id,Type)
            | PVFloat Label
            deriving (Show,Eq,Ord)

type CFG = (Graph, Vertex -> (ABlock, Label, [Label]), Label -> Maybe Vertex)

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

-- contentsが空だと死ぬよ♡
nextBlockNames :: ABlock -> [Label]
nextBlockNames (ABlock _ contents) = f $ toinst $ last contents
  where
    toinst (_,Do i) = i
    toinst (_,_:=i) = i
    f = \case
      ARet{} -> []
      ABr l  -> [l]
      ACBr _ l1 l2 -> [l1,l2]
      ASwitch _ l ils -> l : map snd ils
      i -> error $ "nextBlockNames: non-terminator: " ++ show i

firstInst :: ABlock -> (Int, Named AInst)
firstInst = head . ablockContents

isEmptyFun :: AFunDef -> Bool
isEmptyFun (AFunDef _ _ _ [] _) = True
isEmptyFun _ = False

entryBlock :: AFunDef -> ABlock
entryBlock (AFunDef _ _ _ blocks _) = head blocks

entryBlockName :: AFunDef -> Label
entryBlockName = ablockName . entryBlock

blockMap :: AFunDef -> Map Label ABlock
blockMap (AFunDef _ _ _ blocks _) =
  M.fromList [ (l,b) | b@(ABlock l _) <- blocks]

mkCFG :: AFunDef -> CFG
mkCFG (AFunDef _ _ _ blocks _) = graphFromEdges $ map f blocks
  where f b@(ABlock l _) = (b, l, nextBlockNames b)

nextBlockNames' :: CFG -> Label -> [Label]
nextBlockNames' (_,f1,f2) l =
  let Just v = f2 l
      (_,_,ls) = f1 v
  in  ls

nextBlocks' :: CFG -> Label -> [ABlock]
nextBlocks' cfg@(_,f1,f2) l =
  let ls = nextBlockNames' cfg l
      is = map (fromJust.f2) ls
      fst' (x,_,_) = x
  in  map (fst'.f1) is

-------------------------------------------------------------------------------
-- Register
-------------------------------------------------------------------------------

allRegs :: [Register]
allRegs = concat [
    [ "$v"++show i | i <- [0..1] :: [Int]] -- return value (2-3)
  , [ "$a"++show i | i <- [0..3] :: [Int]] -- arguments    (4-7)
  , [ "$t"++show i | i <- [0..7] :: [Int]] -- temporary    (8-15)
  , [ "$s"++show i | i <- [0..7] :: [Int]] -- saved        (16-23)
  , [ "$t"++show i | i <- [8..8] :: [Int]] -- temporary    (24-24)
--, [ "$t9" ]
  , [ "$k"++show i | i <- [0..1] :: [Int]] -- reserved by kernel
--, [ "$gp" ]                              -- global pointer (base of global data)
--, [ "$sp" ]                              -- stack pointer
  , [ "$fp" ]                              -- frame pointer
--, [ "$ra" ]                              -- return address
  , [ "$zero", "$at" ]
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

-- address for ld, st instruction
regAd :: Register
regAd = "$t9"

-- stack pointer
regSp :: Register
regSp = "$sp"

-- heap pointer
regHp :: Register
regHp = "$gp"

-- return address 使われてない
regRa :: Register
regRa = "$ra"

isReg :: String -> Bool
isReg ~(c:_) = c=='$'

