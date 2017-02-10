{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

-- 大きなIntegerを分割

module BackEnd.Second.SplitInt where

import Base
import BackEnd.Decode
import BackEnd.Second.Asm
import Control.Monad.Extra (concatMapM)

splitInt :: AProg -> Caml AProg
splitInt (AProg fs) = AProg <$> mapM splitIntF fs

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
  x := ASet i | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := AMove v
    return (ss++[s'])

  x := AAdd y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := AAdd y (V v)
    return (ss++[s'])
  x := ASub y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := ASub y (V v)
    return (ss++[s'])
  x := AMul y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := AMul y (V v)
    return (ss++[s'])
  x := ADiv y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := ADiv y (V v)
    return (ss++[s'])
  x := ASll y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := ASll y (V v)
    return (ss++[s'])
  x := ASrl y (C i) | not (whithin16 i) -> do
    (ss,v) <- setBigInt i
    s' <- assignInstId $ x := ASrl y (V v)
    return (ss++[s'])

  _ -> return [s]

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

