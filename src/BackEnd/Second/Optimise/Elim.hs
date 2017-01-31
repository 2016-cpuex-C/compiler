{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
-- 不要定義削除

module BackEnd.Second.Optimise.Elim where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Maybe (catMaybes)
--import Debug.Trace (trace)

elim :: AProg -> Caml AProg
elim (AProg fs) = AProg <$> mapM elimFun fs

elimFun :: AFunDef -> Caml AFunDef
elimFun f = do
  liveOut' <- analyzeLifetime f
  let g  = elimBlock $ M.map (uncurry S.union) liveOut'
      f' = f { aBody = map g (aBody f) }
  if f'==f then return f else elimFun f'

--elimBlock :: Map Id [a] -> ABlock -> ABlock
elimBlock :: Map InstId (Set Id) -> ABlock -> ABlock
elimBlock dic b = b { aStatements = catMaybes $ map g (aStatements b) }
  where
    --unUsed x = null $ M.findWithDefault [] x dic
    unUsed x n = x `S.notMember` lookupMapNote "elimBlock" n dic
    g s@(n,inst) = case inst of
      x := e@ACall{}
        | unUsed x n -> Just (n,Do e)
      x := _
        | unUsed x n -> Nothing
      Do (APhiV lvs) -> Just (n, Do (APhiV lvs'))
        where lvs' = [ (l, [ (x,v)
                           | (x,v) <- xvs
                           --, if x == "mat.257.365..5" then
                           --    trace ("elim: " <> show (M.findWithDefault [] x dic)) True else
                           --    True
                           , not (unUsed x n)])
                     | (l,xvs) <- lvs ]

      _ -> Just s

