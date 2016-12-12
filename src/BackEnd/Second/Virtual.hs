{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Base
import BackEnd.Second.Asm

import           Data.Map (Map)
import qualified Data.Map as M
import           Data.List (foldl')
import           Control.Lens (use)
import           Control.Monad ((>=>), forM)

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = AProg <$> mapM virtualFunDef fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef fundef@(AFunDef _ _ _ blocks _) = do
  blocks' <- forM blocks $
                mergePhis
                >=> calcPtr
                >=> return
  return fundef{ abody=blocks' }

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

-- phiのベクトル化 生存解析のために必要
-- しないと生存解析が辛い
mergePhis :: ABlock -> Caml ABlock
mergePhis block@(ABlock _ insts) =
  return block { ablockContents = f M.empty insts }
    where
      f :: Map Label [(Id,PhiVal)]
        -> [(Int, Named AInst)] -> [(Int, Named AInst)]
      f _ [] = []
      f acc is'@((id',ninst):is) = case ninst of
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

-- Ptr, PtrGをAddとかにつぶす
calcPtr :: ABlock -> Caml ABlock
calcPtr block@(ABlock _ insts) = do
  heap <- use globalHeap
  return block{ ablockContents = concatMap (f heap) insts }
    where
      f heap i@(n,ninst)= case ninst of
        x := APtr p [ix] ->
          [(n, x := AAdd p ix)]
        x := APtrG (Label p) [C j] ->
          let Just (addr,_,_) = M.lookup p heap
          in  [(n, x := ASet (addr+j))]
        x := APtrG (Label p) [V y] ->
          let Just (addr,_,_) = M.lookup p heap
          in  [(n, x := AAdd y (C addr))]
        _ -> [i]

