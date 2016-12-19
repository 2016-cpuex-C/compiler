{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.LivenessAnalysis

import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Data.List ((\\), foldl')
import           Control.Lens (use)
import           Control.Monad ((>=>), forM)
import           Control.Monad.Extra (concatMapM)
import           Data.Maybe (fromMaybe)

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = do
  log "virtual"
  AProg <$> mapM (virtualFunDef>=>zantei) fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef f@(AFunDef l _ _ blocks _) = do
  log $ "virtualFunDef: " ++ show l
  blocks' <- forM blocks $
                mergePhis
                >=> calcPtr
  return f{ aBody=blocks' }

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

-- phiのベクトル化 生存解析のために必要
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

-- Ptr, PtrGをAddとかにつぶす
-- TODO 複数indexに対応
calcPtr :: ABlock -> Caml ABlock
calcPtr block@(ABlock _ insts) = do
  heap <- use globalHeap
  return block{ aStatements = concatMap (f heap) insts }
    where
      f heap i@(n,ninst)= case ninst of
        x := APtr p ixs ->
          let [ix] = ixs
          in  [(n, x := AAdd p ix)]
        x := APtrG (Label p) ixs -> case ixs of
          [C j] -> let Just (addr,_,_) = M.lookup p heap
                   in  [(n, x := ASet (addr+j))]
          [V y] -> let Just (addr,_,_) = M.lookup p heap
                   in  [(n, x := AAdd y (C addr))]
          _ -> error "BackEnd.Second.Virtual: Not Implemented"
        _ -> [i]

-- function call前後のsave/restore
-- 本当はRegAlloc.Spillでやるのがよいが今はとりあえず動かしたいので
zantei :: AFunDef -> Caml AFunDef
zantei fundef@(AFunDef _ _ _ blocks _) = do
  liveout <- livenessAnalysis fundef
  blocks' <- mapM (zanteiB liveout) blocks
  return fundef { aBody = blocks' }

zanteiB :: Map InstId (Set Id, Set Id)
        -> ABlock -> Caml ABlock
zanteiB liveout b@(ABlock _ insts) = do
  insts' <- concatMapM (zanteiI liveout) insts
  return b { aStatements = insts' }

zanteiI :: Map InstId (Set Id, Set Id)
        -> (InstId, Inst) -> Caml [(InstId, Inst)]
zanteiI liveout inst@(n,i) = case i of
  Do (ACallDir _ _ _ _) -> zanteiISub inst Nothing
  x := ACallDir t _ _ _ -> zanteiISub inst (Just (x,t))
  _ -> return [inst]

  where
    (live,liveF)  = flip fromMaybe (M.lookup n liveout) $
                      error ("zanteiI: live: " ++ show inst)

    zanteiISub :: (InstId, Inst)
               -> Maybe (Id,Type) -> Caml [(InstId, Inst)]
    zanteiISub inst' mx = do
      ss' <- mapM assignInstId saves
      rs' <- mapM assignInstId restores
      return $ ss' ++ [inst'] ++ rs'

      where
        saves :: [Inst]
        saves = map (Do . ASave) xs ++ map (Do .AFSave) ys

        restores ::[Inst]
        restores = map (Do . ARestore) xs ++ map (Do . AFRestore) ys

        -- call前にsaveすべきもの
        xs,ys :: [Id]
        (xs,ys) = (S.toList live \\ m ,S.toList liveF \\ mF)
            where (m,mF) = case mx of
                    Just (x,TFloat) -> ([],[x])
                    Just (x,_)      -> ([x],[])
                    Nothing         -> ([],[])

