{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- 大きなIntegerを分割

module BackEnd.Second.SplitInt where

import Base
import BackEnd.Decode
import BackEnd.Second.Asm
import Control.Monad.Extra (concatMapM)

splitInt :: AProg -> Caml AProg
splitInt p@(AProg fs) = do
  $logDebug $ "splitInt: before" <> show' p
  p' <- AProg <$> mapM splitIntF fs
  $logDebug $ "splitInt: after" <> show' p'
  return p'

splitIntF :: AFunDef -> Caml AFunDef
splitIntF f = do
  blocks' <- mapM splitIntB (aBody f)
  return f { aBody = blocks' }

splitIntB :: ABlock -> Caml ABlock
splitIntB b = do
  stmts' <- concatMapM splitIntStmt (aStatements b)
  return b { aStatements = stmts' }

splitIntStmt :: Statement -> Caml [Statement]
splitIntStmt s@(_,inst) = case inst of
  x := ASet i | not (whithin16 i) -> hoge (\v -> x := AMove v) i

    --hoge f i x y v = do
  x := AAdd y (C i) | not (whithin16 i) -> hoge (\v -> x := AAdd y (V v)) i
  x := ASub y (C i) | not (whithin16 i) -> hoge (\v -> x := ASub y (V v)) i
  x := AMul y (C i) | not (whithin16 i) -> hoge (\v -> x := AMul y (V v)) i
  x := ADiv y (C i) | not (whithin16 i) -> hoge (\v -> x := ADiv y (V v)) i
  x := ASll y (C i) | not (whithin16 i) -> hoge (\v -> x := ASll y (V v)) i
  x := ASrl y (C i) | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := ASrl y (C i) | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AAnd y (C i) | not (whithin16 i) -> hoge (\v -> x := AAnd y (V v)) i
  x := AOr  y (C i) | not (whithin16 i) -> hoge (\v -> x := AOr  y (V v)) i
  x := AXor y (C i) | not (whithin16 i) -> hoge (\v -> x := AXor y (V v)) i
  x := ALd  y (C i) | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i
  x := AFLd y (C i) | not (whithin16 i) -> hoge (\v -> x := ASrl y (V v)) i

  x := ASt    y z (C i) | not (whithin16 i) -> hoge (\v -> x := ASt  y z (V v)) i
  x := AStHP  y   (C i) | not (whithin16 i) -> hoge (\v -> x := AStHP  y (V v)) i
  x := AFStHP y   (C i) | not (whithin16 i) -> hoge (\v -> x := AFStHP y (V v)) i

  x := ACmp   p y (C i)       | not (whithin5 i) -> fuga (\v -> x := ACmp p y (V v)) i
  Do (ACmpBr p y (C i) lt lf) | not (whithin5 i) -> fuga (\v -> Do (ACmpBr p y (V v) lt lf)) i

  _ -> return [s]

  where
    hoge f i = do
      (ss,v) <- setBigInt i
      s' <- assignInstId $ f v
      return (ss++[s'])
    fuga f i
      | not (whithin16 i) = hoge f i
      | otherwise = do
          v  <- genId "bigger5"
          sv <- assignInstId $ v := ASet i
          s' <- assignInstId $ f v
          return [sv,s']

setBigInt :: Integer -> Caml ([Statement],Id)
setBigInt i = do
    let (hi,lo) = both fromIntegral $ devideInteger i
    v1 <- genId "bigInt1"
    v2 <- genId "bigInt2"
    v3 <- genId "bigInt3"
    s1 <- assignInstId $ v1 := ASet hi
    s2 <- assignInstId $ v2 := ASll v1 (C 16)
    s3 <- assignInstId $ v3 := AAdd v2 (C lo)
    return ([s1,s2,s3],v3)

