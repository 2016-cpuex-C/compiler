{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Prelude

import Base
import BackEnd.Second.Asm

import qualified Data.Map as M
import           Control.Monad.Extra (concatMapM)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = do
  ($logInfo) "virtual"
  AProg <$> mapM virtualFunDef fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef f@(AFunDef _ _ _ blocks _) = do
  blocks' <- mapM (mergePhis >=> calcPtr) blocks
  return f{ aBody=blocks' }

-------------------------------------------------------------------------------
-- Vectorise Phi Functions-- {{{
-------------------------------------------------------------------------------

-- phiのベクトル化 生存解析のために必要
-- phiが先頭に並んでいることを仮定
mergePhis :: ABlock -> Caml ABlock
mergePhis block@(ABlock _ stmts) =
  return block { aStatements = f M.empty stmts }
    where
      f :: Map Label [(Id,PhiVal)] -> [Statement] -> [Statement]
      f _ [] = []
      f acc is'@((id',inst):is) = case inst of
        x := APhi lvs ->
          let acc' = foldl' h acc lvs
              h acc_ (l,v) =
                let g Nothing = Just [(x,v)]
                    g (Just xvs) = Just ((x,v):xvs)
                in M.alter g l acc_
          in f acc' is
        _ -- end
          | M.null acc -> is'
          | otherwise  -> (id'-1, Do (APhiV (M.toList acc))) : is'
-- }}}

-------------------------------------------------------------------------------
-- Calculate Pointer Address-- {{{
-------------------------------------------------------------------------------

-- Ptr, PtrGをAddとかにつぶす
-- TODO 複数indexに対応
calcPtr :: ABlock -> Caml ABlock
calcPtr block@(ABlock _ insts) = do
  heap <- use globalHeap
  inst' <- concatMapM (f heap) insts
  return block{ aStatements = inst' }
    where
      f heap i@(n,ninst)= case ninst of
        x := APtr p ixs ->
          case ixs of
          [ix] -> return [(n, x := AAdd p ix)]
          [C k,C j] -> do
            ptr <- genId "ptr"
            m   <- freshInstId
            return [(n,ptr := ALd p (C k)), (m, x := AAdd ptr (C j))]
          [V y,C j] -> do
            tmp <- genId "tmp"
            ptr <- genId "ptr"
            m   <- freshInstId
            l   <- freshInstId
            return [(l, tmp := AAdd p (V y)), (n, ptr := ALd tmp (C 0)), (m, x := AAdd ptr (C j))]
          _ -> error $ "BackEnd.Second.Virtual: Not Implemented: " ++ show i
        x := APtrG (Label p) ixs ->
          let Just (addr,_,_) = M.lookup p heap
          in  case ixs of
          [C j]     -> return [(n, x := ASet (addr+j))]
          [V y]     -> return [(n, x := AAdd y (C addr))]
          [V y,C j] -> do
            ptr <- genId "ptr"
            m   <- freshInstId
            return [(n, ptr := ALd y (C addr)), (m, x := AAdd ptr (C j))]
          _ -> error $ "BackEnd.Second.Virtual: Not Implemented: " ++ show i
        _ -> return [i]
-- }}}

