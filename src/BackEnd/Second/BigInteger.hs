{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- 大きなIntegerをASetに

module BackEnd.Second.BigInteger where

import Base
import BackEnd.Decode
import BackEnd.Second.Asm
import Control.Monad.Extra (concatMapM)

bigIntImm :: AFunDef -> Caml AFunDef
bigIntImm f = do
  blocks' <- mapM bigIntImmB (aBody f)
  return f { aBody = blocks' }

bigIntImmB :: ABlock -> Caml ABlock
bigIntImmB b = do
  stmts' <- concatMapM bigIntImmStmt (aStatements b)
  return b { aStatements = stmts' }

bigIntImmStmt :: Statement -> Caml [Statement]
bigIntImmStmt s@(_,inst) = case inst of
  x := ASet i           | not (within16 i) -> hoge (\v -> x := AMove v) i
  x := AAdd y (C i)     | not (within16 i) -> hoge (\v -> x := AAdd y (V v)) i
  x := ASub y (C i)     | not (within16 i) -> hoge (\v -> x := ASub y (V v)) i
  x := AMul y (C i)     | not (within16 i) -> hoge (\v -> x := AMul y (V v)) i
  x := ADiv y (C i)     | not (within16 i) -> hoge (\v -> x := ADiv y (V v)) i
  x := ASll y (C i)     | not (within16 i) -> hoge (\v -> x := ASll y (V v)) i
  x := ASrl y (C i)     | not (within16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := ASrl y (C i)     | not (within16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AAnd y (C i)     | not (within16 i) -> hoge (\v -> x := AAnd y (V v)) i
  x := AOr  y (C i)     | not (within16 i) -> hoge (\v -> x := AOr  y (V v)) i
  x := AXor y (C i)     | not (within16 i) -> hoge (\v -> x := AXor y (V v)) i
  x := ALd  y (C i)     | not (within16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AFLd y (C i)     | not (within16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := ASt    y z (C i) | not (within16 i) -> hoge (\v -> x := ASt  y z (V v)) i
  x := AStHP  y   (C i) | not (within16 i) -> hoge (\v -> x := AStHP  y (V v)) i
  x := AFStHP y   (C i) | not (within16 i) -> hoge (\v -> x := AFStHP y (V v)) i


  x := ACmp   p y (C i)       | not (within5 i) -> hoge (\v -> x := ACmp p y (V v)) i
  Do (ACmpBr p y (C i) lt lf) | not (within5 i) -> hoge (\v -> Do (ACmpBr p y (V v) lt lf)) i

  Do (ARet t (Just (C i))) | not (within16 i) -> hoge (\v -> Do (ARet t (Just (V v)))) i
  _ -> return [s]

  where
    hoge f i = do
      (ss,v) <- setBigInt i
      s' <- assignInstId $ f v
      return (ss++[s'])

setBigInt :: Integer -> Caml ([Statement],Id)
setBigInt i = do
  v <- return regTmp
  s <- assignInstId $ v := ASet i
  return ([s],v)

