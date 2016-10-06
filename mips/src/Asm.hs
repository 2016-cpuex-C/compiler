{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE LambdaCase #-}

module Asm where

import Id
import AllTypes

import Data.Set (Set)
import qualified Data.Set as S
import Data.Vector (Vector, (!))
import qualified Data.Vector as V

type Register = String

stackDir :: Int
stackDir = 1

fLetD :: (Id, AExpr, Asm) -> Asm
fLetD (x,e1,a2) = AsmLet (x,TFloat) e1 a2

seq' :: (AExpr, Asm) -> Caml Asm
seq' (e1,a2) = do
  x <- genTmp TUnit
  return $ AsmLet (x,TUnit) e1 a2


allRegs :: [Register]
allRegs = concat [
--  [ "$zero" ]                            -- assigned to 0
--  [ "$at" ]                              -- reserved by something
    [ "$v"++show i | i <- [0..1] :: [Int]] -- return value (2-3)
  , [ "$a"++show i | i <- [0..3] :: [Int]] -- arguments    (4-7)
  , [ "$t"++show i | i <- [0..7] :: [Int]] -- temporary    (8-15)
  , [ "$s"++show i | i <- [0..7] :: [Int]] -- saved        (16-23)
  , [ "$t"++show i | i <- [8..8] :: [Int]] -- temporary    (24-24)
--, [ "$k"++show i | i <- [0..1] :: [Int]] -- reserved by kernel
--, [ "$gp" ]                              -- global pointer (base of global data)
--, [ "$sp" ]                              -- stack pointer
--, [ "$fp" ]                              -- frame pointer
--, [ "$ra" ]                              -- return address
  ]

allFRegs :: [Register]
allFRegs = [ "$f"++show (i*2) | i <- [0..15] :: [Int]]

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
  ASetL{}    -> []
  AComment{} -> []
  ARestore{} -> []

  AMov x    -> [x]
  ANeg x    -> [x]
  AFMovD x  -> [x]
  AFNegD x  -> [x]
  ASave x _ -> [x]
  ASll x _  -> [x]

  AAdd x y'    -> x : fvOfIdOrImm y'
  ASub x y'    -> x : fvOfIdOrImm y'
  AMul x y'    -> x : fvOfIdOrImm y'
  ADiv x y'    -> x : fvOfIdOrImm y'
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
align :: Int -> Int
align = id

