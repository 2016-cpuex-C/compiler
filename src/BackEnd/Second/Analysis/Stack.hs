{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Analysis.Stack where
-- 入力: SSA deconstruction後の関数
-- 出力: 各基本ブロックの先頭に置けるstack

-- in[n]  = ∩ (m \in pred[n]) out[m] ただしpred[n]が空のときは空
-- out[n] = in[n] ∪  {saved at n}
-- この不動点を取る

import Prelude hiding (log,Ordering(..))

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis.Base

import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Data.Maybe (mapMaybe)

-------------------------------------------------------------------------------
-- StackSet
-------------------------------------------------------------------------------

type StackSet = Set Id

stackSets :: AFunDef -> Map Label StackSet
stackSets fun = fst <$> leastFixedPoint M.empty go
  where
    go :: Map Label (StackSet, StackSet) -> Map Label (StackSet, StackSet)
    go out' = foldl f mempty (aBody fun)
      where
        f acc b =
          let l = aBlockName b
              in_b  = intersections' [ snd $ lookupWith0 lp out'
                                     | lp <- lookupWith0 l (predBlockMap fun) ]
              out_b = in_b `S.union` S.fromList (savedAt b)
          in M.insert l (in_b,out_b) acc

    lookupWith0 :: Monoid a => Label -> Map Label a -> a
    lookupWith0 = M.findWithDefault mempty

    intersections' :: Ord a => [Set a] -> Set a
    intersections' [] = S.empty
    intersections' ss = foldl1 S.intersection ss

savedAt :: ABlock -> [Id]
savedAt b = mapMaybe h $ aStatements b
  where h (_,Do (ASave x))  = Just x
        h (_,Do (AFSave x)) = Just x
        h _                 = Nothing

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

-- 最小元を与える型クラスってないですかね
leastFixedPoint :: Eq a => a -> (a -> a) -> a
leastFixedPoint min' f = go min'
  where go x = let x' = f x in if x==x' then x else go x'

