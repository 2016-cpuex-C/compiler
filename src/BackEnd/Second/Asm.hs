{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Asm where

import Base

import           Text.Regex.TDFA
import           Data.Vector (Vector, (!))
import qualified Data.Vector as V
import qualified Data.Map as M
import           Data.List (partition)
import           Control.Lens ((<+=),(<&>))

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

data AExpr
  = ANop
  | ASet   Integer
  | ASetF  Label
  | ASetL  Label
  | AMove  Id
  | ANeg   Id
  | AAdd   Id IdOrImm
  | ASub   Id IdOrImm
  | AMul   Id IdOrImm
  | ADiv   Id IdOrImm
  | ASll   Id IdOrImm
  | ASrl   Id IdOrImm
  | ALd    Id IdOrImm
  | ASt    Id Id IdOrImm
  | ALdi   Integer
  | ASti   Id Integer

  | AFMov  Id
  | AFNeg  Id
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

  -- SSA Deconstruction
  | ASwap Id Id
  | AFSwap Id Id

  -- call
  | ACall Type Label [Id] [Id]

  | ASelect Type Id Id Id

  -- 仮想命令
    -- Virtual.hsで消す
  | APtr  Id    [IdOrImm]
  | APtrG Label [IdOrImm]
  | APhi  [(Label,PhiVal)]

  | APhiV     [(Label,[(Id,PhiVal)])] -- APhiのベクトル化
  | APhiS     [(Id,PhiVal)]           -- APhiVの一行版 coalescing用

  | ASave     Id Id
  | AFSave    Id Id
    -- ^第一引数はregister上での名前
    -- ^第二引数はstack上での名前(こっちがオリジナル)
  | ARestore  Id
  | AFRestore Id
    -- heap
  | AGetHP
  | AStHP  Id IdOrImm
  | AFStHP Id IdOrImm
  | AIncHP IdOrImm

  -- other primitives
  | APrim Label Type [IdOrImm] [Id]

  -- terminator
  | ATailCall Type Label [Id] [Id]
  | ARet      Type (Maybe IdOrImm)
  | ABr       Label
  | ACBr      Id Label Label
  | ASwitch   Id Label [(Integer,Label)]
  | ACmpBr    Predicate Id IdOrImm Label Label
  | AFCmpBr   Predicate Id Id      Label Label
  | AExit
  deriving (Show,Eq,Ord)

data IdOrImm
  = V Id
  | C Integer
  deriving (Show,Eq,Ord)

data PhiVal
  = PVInt   Integer
  | PVVar   Id Type Bool
    -- Bool...stack上にあるかどうか
  | PVFloat Label
  deriving (Show,Eq,Ord)

type Register = Id

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

----------
-- Prog --
----------

popMain :: AProg -> (AFunDef,[AFunDef])
popMain (AProg fs) =
  case partition (\f -> aFunName f == Label "__main__") fs of
    ([main],others) -> (main,others)
    _ -> error "popMain"

------------
-- FunDef --
------------

isEmptyFun :: AFunDef -> Bool
isEmptyFun = null . aBody

entryBlock :: AFunDef -> ABlock
entryBlock (AFunDef _ _ _ [block] _) = block
entryBlock (AFunDef l _ _ blocks _) =
  case partition isEntryBlock blocks of
    ([eb],_) -> eb
    x -> errorShow "entryBlock: " (l,x)

entryBlockName :: AFunDef -> Label
entryBlockName = aBlockName . entryBlock

blockMap :: AFunDef -> Map Label ABlock
blockMap (AFunDef _ _ _ blocks _) =
  M.fromList [ (l,b) | b@(ABlock l _) <- blocks ]

-----------
-- Block --
-----------

-- entry.12.32 のような形をしている
-- もっといい方法ないかなあ
isEntryBlock :: ABlock -> Bool
isEntryBlock (ABlock (Label x) _) = x =~ "^entry\\.[0-9]+\\.[0-9]+$"

firstStmt :: ABlock -> Statement
firstStmt = head . aStatements

lastStmt :: ABlock -> Statement
lastStmt  = last . aStatements

----------
-- Inst --
----------

freshInstId :: Caml Int
freshInstId = instCount <+= 1

assignInstId :: Inst -> Caml Statement
assignInstId i = freshInstId <&> (,i)

-------------------------------------------------------------------------------
-- Register
-------------------------------------------------------------------------------

allRegs :: [Register]
allRegs = concat [
    [ "$v"++show i | i <- [0..1] :: [Int]]
  , [ "$a"++show i | i <- [0..3] :: [Int]]
  , [ "$t"++show i | i <- [0..7] :: [Int]]
  , [ "$s"++show i | i <- [0..7] :: [Int]]
  , [ "$t"++show i | i <- [8..9] :: [Int]]
  , [ "$k"++show i | i <- [0..1] :: [Int]]
--, [ "$gp" ]                              -- global pointer
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

