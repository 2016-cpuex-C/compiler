{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE LambdaCase #-}

module BackEnd.First.Asm where

import Base

import qualified Data.Set as S
import           Data.Vector (Vector, (!))
import qualified Data.Vector as V

-----------------
-- Asm.t = Asm --
-----------------
type Immediate = Integer
data IdOrImm = V Id
             | C Immediate
             deriving (Show, Eq)

 -- 命令の列
data Asm = AsmAns AExpr
         | AsmLet (Id, Type) AExpr Asm
         deriving Show

data AExpr = ANop
           | ASet Integer
           | ASetF Label
           | ASetL Label
           | AMov Id
           | ANeg Id
           | AF2I Id
           | AI2F Id
           | AAdd Id IdOrImm
           | ASub Id IdOrImm
           | AMul Id IdOrImm
           | ADiv Id IdOrImm
           | AAnd Id IdOrImm
           | AOr  Id IdOrImm
           | AXor Id IdOrImm
           | ASrl Id IdOrImm
           | ASll Id IdOrImm
           | ALd Id IdOrImm
           | ASt Id Id IdOrImm
           | AFMovD Id
           | AFNegD Id
           | AFAddD Id Id
           | AFSubD Id Id
           | AFMulD Id Id
           | AFDivD Id Id
           | ALdDF Id IdOrImm
           | AStDF Id Id IdOrImm
           | AComment String
           | AIfEq Id IdOrImm Asm Asm
           | AIfLe Id IdOrImm Asm Asm
           | AIfGe Id IdOrImm Asm Asm
           | AIfFEq Id Id Asm Asm
           | AIfFLe Id Id Asm Asm
           | ACallCls Id    [Id] [Id]
           | ACallDir Label [Id] [Id]
           | ASave Id Id
           | ARestore Id
           deriving Show

data AFunDef = AFunDef { _aname  :: Label
                       , _aargs  :: [Id]
                       , _afargs :: [Id]
                       , _abody  :: Asm
                       , _aret   :: Type }
             deriving Show
makeLenses ''AFunDef

data AProg = AProg [(Label, Float)] [AFunDef] Asm
           deriving Show

type Register = String

fLetD :: (Id, AExpr, Asm) -> Asm
fLetD (x,e1,a2) = AsmLet (x,TFloat) e1 a2

seq' :: (AExpr, Asm) -> Caml Asm
seq' (e1,a2) = do
  x <- genTmp TUnit
  return $ AsmLet (x,TUnit) e1 a2


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

coFReg :: Register -> Register
coFReg = undefined

-- super-tenuki? らしい どこが?
removeAndUniq :: Set String -> [String] -> [String]
removeAndUniq xs = \case
  [] -> []
  y:ys | S.member y xs -> removeAndUniq xs ys
       | otherwise     -> y : removeAndUniq (S.insert y xs) ys

fv :: Asm -> [String]
fv e = removeAndUniq S.empty (fv' e)

fv' :: Asm -> [String]
fv' (AsmAns a) = fvAExpr a
fv' (AsmLet (x,_t) e a) = fvAExpr e ++ removeAndUniq (S.singleton x) (fv a)

fvOfIdOrImm :: IdOrImm -> [String]
fvOfIdOrImm (V x) = [x]
fvOfIdOrImm (C _) = []

fvAExpr :: AExpr -> [String]
fvAExpr = \case
  ANop       -> []
  ASet{}     -> []
  ASetF{}    -> []
  ASetL{}    -> []
  AComment{} -> []
  ARestore{} -> []

  AMov x    -> [x]
  ANeg x    -> [x]
  AF2I x    -> [x]
  AI2F x    -> [x]
  AFMovD x  -> [x]
  AFNegD x  -> [x]
  ASave x _ -> [x]

  AAdd x y'    -> x : fvOfIdOrImm y'
  ASub x y'    -> x : fvOfIdOrImm y'
  AMul x y'    -> x : fvOfIdOrImm y'
  ADiv x y'    -> x : fvOfIdOrImm y'
  AAnd x y'    -> x : fvOfIdOrImm y'
  AOr  x y'    -> x : fvOfIdOrImm y'
  AXor x y'    -> x : fvOfIdOrImm y'
  ASrl x y'    -> x : fvOfIdOrImm y'
  ASll x y'    -> x : fvOfIdOrImm y'
  ALd x y'     -> x : fvOfIdOrImm y'
  ALdDF x y'   -> x : fvOfIdOrImm y'

  ASt x y z'     -> x : y : fvOfIdOrImm z'
  AStDF x y z'   -> x : y : fvOfIdOrImm z'

  AFAddD x y -> [x,y]
  AFSubD x y -> [x,y]
  AFMulD x y -> [x,y]
  AFDivD x y -> [x,y]

  AIfEq x y' e1 e2 -> x : fvOfIdOrImm y' ++ removeAndUniq S.empty (fv' e1 ++ fv' e2)
  AIfLe x y' e1 e2 -> x : fvOfIdOrImm y' ++ removeAndUniq S.empty (fv' e1 ++ fv' e2)
  AIfGe x y' e1 e2 -> x : fvOfIdOrImm y' ++ removeAndUniq S.empty (fv' e1 ++ fv' e2)

  AIfFEq x y e1 e2 -> x : y : removeAndUniq S.empty (fv' e1 ++ fv' e2)
  AIfFLe x y e1 e2 -> x : y : removeAndUniq S.empty (fv' e1 ++ fv' e2)

  ACallCls x ys zs -> x : ys ++ zs
  ACallDir _ ys zs -> ys ++ zs

-- 最後にinsertLetみたいなもんを挟む
concat' :: Asm -> (Id,Type) -> Asm -> Asm
concat' a1 xt a2 = case a1 of
  AsmAns e -> AsmLet xt e a2
  AsmLet yt e a1' -> AsmLet yt e (concat' a1' xt a2)

-- double から single に変わったので不要
align :: Integer -> Integer
align = id

