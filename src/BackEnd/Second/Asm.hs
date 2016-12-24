{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Asm where

import Base

import           Data.Vector (Vector, (!))
import qualified Data.Vector as V
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.List (find, isPrefixOf)
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
  | ACall Type Label [Id] [Id]

  | ASelect Type Id Id Id

  -- 仮想命令
    -- Virtual.hsで消す
  | APtr  Id    [IdOrImm]
  | APtrG Label [IdOrImm]
  | APhi  [(Label,PhiVal)]

    -- Virtual.hsで出現
  | APhiV [(Label,[(Id,PhiVal)])]
  | ASave     Id
  | AFSave    Id
  | ARestore  Id
  | AFRestore Id
    -- heap
  | AGetHP
  | AStHP  Id IdOrImm
  | AFStHP Id IdOrImm
  | AIncHP IdOrImm

  -- terminator
  | ATailCall Type Label [Id] [Id]
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
  | PVVar   Id Type Bool -- onMemory :: Bool
  | PVFloat Label
  deriving (Show,Eq,Ord)

type Register = Id

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

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

-----------
-- Block --
-----------

firstStmt :: ABlock -> Statement
firstStmt = head . aStatements

lastStmt :: ABlock -> (InstId, Inst)
lastStmt  = last . aStatements

----------
-- Inst --
----------

freshInstId :: Caml Int
freshInstId = instCount<+=1

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

