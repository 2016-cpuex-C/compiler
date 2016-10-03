{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Simm where

import Prelude hiding (exp)

import Asm
import AllTypes

import Data.Map (Map)
import Data.Bits (shift)
import qualified Data.Map as M
import Data.Maybe (fromJust)

g :: Map Id Int -> Asm -> Asm
g env = \case
  AsmAns exp -> AsmAns (g' env exp)
  AsmLet (x,t) (ASet i) e -> -- TODO iの幅を制限
    let e' = g (M.insert x i env) e
    in if | x `elem` fv e' -> AsmLet (x,t) (ASet i) e'
          | otherwise        -> e'
  AsmLet xt (ASll y i) e
    | M.member y env ->
        let e1 = ASet $ fromJust (M.lookup y env) `shift` i
        in  g env (AsmLet xt e1 e)
  AsmLet xt exp e -> AsmLet xt (g' env exp) (g env e)

g' :: Map Id Int -> AExpr -> AExpr
g' env = let get var = C (lookupJust var env) in \case
  AAdd x (V y)
    | M.member y env -> AAdd x (get y)
    | M.member x env -> AAdd y (get x)
  ASub x (V y)
    | M.member y env -> AAdd x (case get y of C i -> C (-i))
  --AMul x (V y) not implemented
  --  | M.member y env -> AMul x (get y)
  --  | M.member x env -> AMul y (get x)

  ALd x (V y)
    | M.member y env -> ALd x (get y)
  ASt x y (V z)
    | M.member z env -> ASt x y (get z)
  ALdDF x (V y)
    | M.member y env -> ALdDF x (get y)
  AStDF x y (V z)
    | M.member z env -> AStDF x y (get z)
  --AIfEq x (V y) e1 e2
  --  | M.member y env -> AIfEq x (get y) (g env e1) (g env e2)
  --  | M.member x env -> AIfEq y (get x) (g env e1) (g env e2)
  --AIfLe x (V y) e1 e2
  --  | M.member y env -> AIfLe x (get y) (g env e1) (g env e2)
  --  | M.member x env -> AIfGe y (get x) (g env e1) (g env e2)
  --AIfGe x (V y) e1 e2
  --  | M.member y env -> AIfGe x (get y) (g env e1) (g env e2)
  --  | M.member x env -> AIfLe y (get x) (g env e1) (g env e2)
  AIfEq x y' e1 e2 -> AIfEq x y' (g env e1) (g env e2)
  AIfLe x y' e1 e2 -> AIfLe x y' (g env e1) (g env e2)
  AIfGe x y' e1 e2 -> AIfGe x y' (g env e1) (g env e2)
  AIfFEq x y e1 e2 -> AIfFEq x y (g env e1) (g env e2)
  AIfFLe x y e1 e2 -> AIfFLe x y (g env e1) (g env e2)
  e -> e

h :: AFunDef -> AFunDef
h (AFunDef l xs ys e t) = AFunDef l xs ys (g M.empty e) t

simm :: AProg -> Caml AProg
simm (AProg fdata fundefs e) = return $ AProg fdata (map h fundefs) (g M.empty e)

----------
-- Util --
----------
lookupJust :: Ord k => k -> Map k a -> a
lookupJust x env = fromJust $ M.lookup x env

bindM2 :: Monad m => (a -> b -> m c) -> m a -> m b -> m c
bindM2 f ma mb = do {a <- ma; b <- mb; f a b}


