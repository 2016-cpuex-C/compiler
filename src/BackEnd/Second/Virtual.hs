{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Base
import BackEnd.Second.Asm

import Data.Map (Map)
import qualified  Data.Map as M
import Data.List (foldl')

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = AProg <$> mapM virtualFunDef fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef fundef@(AFunDef _ _ _ blocks _) = do
  blocks' <- mapM mergePhis blocks
  return fundef{ abody=blocks' }

-------------------------------------------------------------------------------
-- 命令毎
-------------------------------------------------------------------------------

-- phiのベクトル化
-- しないと生存解析が辛い
mergePhis :: ABlock -> Caml ABlock
mergePhis block@(ABlock _ insts) =
  return block{ ablockContents = f M.empty insts }
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
{-calcPtr :: ABlock -> Caml ABlock-}
{-calcPtr block@(ABlock _ insts) =-}
  {-return block{ ablockContents = f M.empty insts }-}
    {-where-}
      {-f = undefined-}

