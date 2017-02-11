{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- 大きなIntegerを分割

module BackEnd.Second.BigInteger where

import Base
import BackEnd.Decode
import BackEnd.Second.Asm
import Control.Monad.Extra (concatMapM)

--import Control.Monad.Extra (concatMapM)

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
  x := ASet i           | not (whithin16 i) -> hoge (\v -> x := AMove v) i
  x := AAdd y (C i)     | not (whithin16 i) -> hoge (\v -> x := AAdd y (V v)) i
  x := ASub y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASub y (V v)) i
  x := AMul y (C i)     | not (whithin16 i) -> hoge (\v -> x := AMul y (V v)) i
  x := ADiv y (C i)     | not (whithin16 i) -> hoge (\v -> x := ADiv y (V v)) i
  x := ASll y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASll y (V v)) i
  x := ASrl y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := ASrl y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AAnd y (C i)     | not (whithin16 i) -> hoge (\v -> x := AAnd y (V v)) i
  x := AOr  y (C i)     | not (whithin16 i) -> hoge (\v -> x := AOr  y (V v)) i
  x := AXor y (C i)     | not (whithin16 i) -> hoge (\v -> x := AXor y (V v)) i
  x := ALd  y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AFLd y (C i)     | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := ASt    y z (C i) | not (whithin16 i) -> hoge (\v -> x := ASt  y z (V v)) i
  x := AStHP  y   (C i) | not (whithin16 i) -> hoge (\v -> x := AStHP  y (V v)) i
  x := AFStHP y   (C i) | not (whithin16 i) -> hoge (\v -> x := AFStHP y (V v)) i

  x := ACmp   p y (C i)       | not (whithin5 i) -> hoge (\v -> x := ACmp p y (V v)) i
  Do (ACmpBr p y (C i) lt lf) | not (whithin5 i) -> hoge (\v -> Do (ACmpBr p y (V v) lt lf)) i

  Do (ARet t (Just (C i))) | not (whithin16 i) -> hoge (\v -> Do (ARet t (Just (V v)))) i
  _ -> return [s]

  where
    hoge f i = do
      (ss,v) <- setBigInt i
      s' <- assignInstId $ f v
      return (ss++[s'])

    --hoge16 f i = do
    --  (ss,v) <- setBigInt i
    --  s' <- assignInstId $ f v
    --  return (ss++[s'])
    --hoge5 f i
    --  | not (whithin16 i) = hoge16 f i
    --  | otherwise = do
    --      {-v  <- genId "bigger5"-}
    --      v <- return regTmp --genId "bigInt"
    --      sv <- assignInstId $ v := ASet i
    --      s' <- assignInstId $ f v
    --      return [sv,s']

setBigInt :: Integer -> Caml ([Statement],Id)
setBigInt i = do
  v <- return regTmp--genId "bigInt"
  s <- assignInstId $ v := ASet i
  return ([s],v)

  --l <- bigIntLabel i
  --v <- genId "bigInt"
  --s <- assignInstId $ v := ASetBI l
  --return ([s],v)
  --let (hi,lo) = both fromIntegral $ devideInteger i
  --v1 <- genId "bigInt1"
  --v2 <- genId "bigInt2"
  --v3 <- genId "bigInt3"
  --s1 <- assignInstId $ v1 := ASet hi
  --s2 <- assignInstId $ v2 := ASll v1 (C 16)
  --s3 <- assignInstId $ v3 := AAdd v2 (C lo)
  --return ([s1,s2,s3],v3)

