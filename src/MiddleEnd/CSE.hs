{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.CSE (cse) where
{- Common Subexpression Elimination -}

import           Base
import           MiddleEnd.KNormal
import           MiddleEnd.Elim    (hasSubEffect)

import qualified Data.Map as M
import           Control.Monad.State.Strict
import Debug.Trace (trace, traceShowM)

cse :: KExpr -> Caml KExpr
cse = return . cse'

cse' :: KExpr -> KExpr
cse' e = evalState (cElim e) []

(!) :: Map Id KExpr -> Id -> KExpr
env ! x = lookupMapNote ("CSE.(!):" ++ x) x env

-- 変数名の違いを無視して等しい
(===) :: KExpr -> KExpr -> Bool
(===) = eq' M.empty M.empty
  where-- {{{
    eq' :: Map Id KExpr -> Map Id KExpr -> KExpr -> KExpr -> Bool
    eq' env1 env2 e1 e2 = if e1==e2 then True else
      let xs =||= ys = all f (zip xs ys)
            where f (y1, y2) = KVar y1 =|= KVar y2
          e1' =|= e2' = eq' env1 env2 e1' e2'
      in  trace "hoge" $ case (e1,e2) of
        (KVar x, _)
          | M.member x env1 -> (env1!x) =|= e2
        (_, KVar y)
          | M.member y env2 -> e1 =|= (env1!y)

        (KNeg  x1,    KNeg  x2)    -> KVar x1 =|= KVar x2
        (KAdd  x1 y1, KAdd  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KSub  x1 y1, KSub  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KMul  x1 y1, KMul  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KDiv  x1 y1, KDiv  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KFNeg x1,    KFNeg x2)    -> KVar x1 =|= KVar x2
        (KFAdd x1 y1, KFAdd x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KFSub x1 y1, KFSub x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KFMul x1 y1, KFMul x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KFDiv x1 y1, KFDiv x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KLAnd x1 y1, KLAnd x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KLOr  x1 y1, KLOr  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KLXor x1 y1, KLXor x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2
        (KGet  x1 y1, KGet  x2 y2) -> KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2

        (KPut  x1 y1 z1, KPut  x2 y2 z2) ->
          KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2 && KVar z1 =|= KVar z2

        (KIfEq x1 y1 s1 t1, KIfEq x2 y2 s2 t2) ->
          KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2 && s1 =|= s2 && t1 =|= t2
        (KIfLe x1 y1 s1 t1, KIfLe x2 y2 s2 t2) ->
          KVar x1 =|= KVar x2 && KVar y1 =|= KVar y2 && s1 =|= s2 && t1 =|= t2

        (KApp x1 ys1, KApp x2 ys2) ->
          KVar x1 =|= KVar x2 && ys1 =||= ys2

        (KExtFunApp f1 xs1, KExtFunApp f2 xs2) ->
          f1 == f2 && xs1 =||= xs2

        (KTuple xs1, KTuple xs2) -> xs1 =||= xs2

        (KLet (x1,ty1) s1 t1, KLet (x2,ty2) s2 t2) ->
          ty1 == ty2 && s1 =|= s2 &&
          eq' (M.insert x1 s1 env1) (M.insert x2 s2 env2) t1 t2

        _ -> False-- }}}

newtype Uwaa = Uwaa KExpr
  deriving (Show)

instance Eq Uwaa where
  Uwaa e1 == Uwaa e2 = e1 === e2

member :: Eq a => a -> [(a,b)] -> Bool
member x dic = case lookup x dic of
  Just{}  -> True
  Nothing -> False

local :: (s -> s) -> State s a -> State s a
local f m = do
  s <- get
  modify f
  x <- m
  put s
  return x

cElim :: KExpr -> State [(Uwaa, Id)] KExpr
cElim e = do
  calculated <- gets $ member (Uwaa e)
  --traceShowM calculated
  traceShowM e
  traceShowM $ hasSubEffect e
  if | calculated -> case e of
          KUnit -> return e
          KInt{} -> return e
          _ -> KVar <$> gets (lookupJustNote "cElim" (Uwaa e))
     | otherwise -> case e of
          KLet (x,t) e1 e2 -> do
            e1' <- cElim e1
            e2' <- if hasSubEffect e1
                     then local (((Uwaa e1'),x):) (cElim e2)
                     else cElim e2
            return $ KLet (x,t) e1' e2'
          KIfEq x y e1 e2 ->
            KIfEq x y <$> cElim e1 <*> cElim e2
          KIfLe x y e1 e2 ->
            KIfLe x y <$> cElim e1 <*> cElim e2
          KLetRec f@(KFunDef _ _ e1) e2 -> do
            e1' <- cElim e1
            e2' <- cElim e2
            return $ KLetRec f{kbody=e1'} e2'
          KLetTuple xts y e1 ->
            KLetTuple xts y <$> cElim e1
          _ -> return e

