{-# LANGUAGE LambdaCase #-}

module BackEnd.Second.Asm where

import Base

import           Data.Vector (Vector, (!))
import qualified Data.Vector as V

-----------------
-- Asm.t = Asm --
-----------------

data AProg = AProg [AFunDef]
            deriving (Show,Eq)

data AFunDef = AFunDef {
    aname  :: Label
  , aargs  :: [Id]
  , afargs :: [Id]
  , abody  :: [ABlock]
  , aret   :: Type
  } deriving (Show,Eq)

data ABlock = ABlock Id [Named AInst] ATerminator
            deriving (Show,Eq)

data AInst
  = ANop
  | ASet   Integer
  | ASetF  Label
  | ASetL  Label -- closure

  | AMove  Id
  | ANeg   Id -- いらなそう
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

  -- boolean
  | AAnd    Id IdOrImm
  | AOr     Id IdOrImm
  | AXor    Id IdOrImm
  | ASelect Id IdOrImm IdOrImm

  -- compare
  | ACmp  Predicate Id IdOrImm
  | AFCmp Predicate Id Id

  -- call
  | ACallDir Label [Id] [Id]

  -- 仮想命令
  | APtr  Id IdOrImm
  | APtrG Id IdOrImm
  | APhi [(Id,Label)]
  deriving (Show, Eq)

data ATerminator
  = ARet    (Maybe IdOrImm)
  | ACBr    Id Label Label
  | ACJ     Predicate Id IdOrImm Label
  | AFCJ    Predicate Id IdOrImm Label
  | ABr     Label
  | ASwitch Id Label [(IdOrImm,Label)]
  deriving (Show, Eq)

data IdOrImm
  = V Id
  | C Integer
  deriving (Show, Eq)

type Register = String

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

