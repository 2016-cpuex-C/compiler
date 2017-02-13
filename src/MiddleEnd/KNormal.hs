{-# LANGUAGE LambdaCase #-}

module MiddleEnd.KNormal (
  KExpr(..),
  KFunDef(..),
  kNormalize,
  fv
) where

import Base
import FrontEnd.Syntax
import qualified Data.Set as S
import qualified Data.Map as M

-----------------------
-- KNormal.t = KExpr --
-----------------------
data KExpr = KUnit
           | KInt Integer
           | KBool Bool
           | KFloat Float
           | KNeg  Id
           | KF2I  Id
           | KI2F  Id
           | KAdd  Id Id
           | KSub  Id Id
           | KMul  Id Id
           | KDiv  Id Id
           | KLAnd Id Id
           | KLOr  Id Id
           | KLXor Id Id
           | KSrl  Id Id
           | KSll  Id Id
           | KFNeg Id
           | KFAdd Id Id
           | KFSub Id Id
           | KFMul Id Id
           | KFDiv Id Id
           | KIfEq Id Id KExpr KExpr
           | KIfLe Id Id KExpr KExpr
           | KLet  (Id, Type) KExpr KExpr
           | KVar  Id
           | KLetRec KFunDef KExpr
           | KApp Id [Id]
           | KTuple [Id]
           | KLetTuple [(Id,Type)] Id KExpr
           | KGet Id Id
           | KPut Id Id Id
           | KArray Id Id
           | KArrayInit Label Id
           | KExtArray Id
           | KExtFunApp Id [Id]
           deriving (Show, Eq, Ord)
data KFunDef = KFunDef { kname ::  (Id,Type)
                       , kargs :: [(Id,Type)]
                       , kbody :: KExpr
                       }
              deriving (Show, Eq, Ord)

fv :: KExpr -> Set Id
fv = \case
  KUnit -> S.empty
  KInt _ -> S.empty
  KBool _ -> S.empty
  KFloat _ -> S.empty
  KExtArray _ -> S.empty

  KNeg  x -> S.singleton x
  KFNeg x -> S.singleton x
  KF2I  x -> S.singleton x
  KI2F  x -> S.singleton x

  KAdd    x y -> S.fromList [x,y]
  KSub    x y -> S.fromList [x,y]
  KMul    x y -> S.fromList [x,y]
  KDiv    x y -> S.fromList [x,y]
  KLAnd   x y -> S.fromList [x,y]
  KLOr    x y -> S.fromList [x,y]
  KLXor   x y -> S.fromList [x,y]
  KSrl    x y -> S.fromList [x,y]
  KSll    x y -> S.fromList [x,y]
  KFAdd   x y -> S.fromList [x,y]
  KFSub   x y -> S.fromList [x,y]
  KFMul   x y -> S.fromList [x,y]
  KFDiv   x y -> S.fromList [x,y]
  KGet    x y -> S.fromList [x,y]
  KArray  x y -> S.fromList [x,y]
  KArrayInit _ x -> S.singleton x

  KIfEq x y e1 e2 -> S.insert x (S.insert y (S.union (fv e1) (fv e2)))
  KIfLe x y e1 e2 -> S.insert x (S.insert y (S.union (fv e1) (fv e2)))

  KLet (x,_t) e1 e2 -> S.union (fv e1) (S.delete x (fv e2))

  KVar x -> S.singleton x

  KLetRec (KFunDef (x,_t) yts e1) e2 ->
    let zs = S.difference (fv e1) (S.fromList $ map fst yts)
    in  S.difference (S.union zs (fv e2)) (S.singleton x) -- deleteじゃダメなの？

  KApp x ys -> S.fromList (x:ys)

  KTuple xs       -> S.fromList xs
  KExtFunApp _ xs -> S.fromList xs

  KPut x y z -> S.fromList [x,y,z]

  KLetTuple xts y e -> S.insert y (S.difference (fv e) (S.fromList $ map fst xts))


insertLet :: Caml (KExpr,Type) -> (Id -> Caml (KExpr,Type)) -> Caml (KExpr, Type)
insertLet m k = m >>= \case
  (KVar x, _t) -> k x
  (e, t) -> do
    x <- genTmp t
    (e',t') <- k x
    return (KLet (x,t) e e', t')

insertLetWithTy :: Caml (KExpr,Type) -> (Id -> Type -> Caml (KExpr,Type)) -> Caml (KExpr, Type)
insertLetWithTy m k = m >>= \case
  (KVar x, t) -> k x t
  (e, t) -> do
    x <- genTmp t
    (e',t') <- k x t
    return (KLet (x,t) e e', t')

g :: Map Id Type -> Expr -> Caml (KExpr, Type)
g env e = case e of
  EUnit    -> return (KUnit, TUnit)
  EBool b  -> return (KBool b,TBool)
  EInt i   -> return (KInt i, TInt)
  EFloat d -> return (KFloat d, TFloat)

  ENot e' ->
    g env (EIf e' (EBool False) (EBool True))

  ENeg  e'    -> int1 KNeg  e'
  EF2I  e'    -> int1 KF2I e'
  EAdd  e1 e2 -> int2 KAdd  e1 e2
  ESub  e1 e2 -> int2 KSub  e1 e2
  EMul  e1 e2 -> int2 KMul  e1 e2
  EDiv  e1 e2 -> int2 KDiv  e1 e2
  ELAnd e1 e2 -> int2 KLAnd e1 e2
  ELOr  e1 e2 -> int2 KLOr  e1 e2
  ELXor e1 e2 -> int2 KLXor e1 e2
  ESrl  e1 e2 -> int2 KSrl  e1 e2
  ESll  e1 e2 -> int2 KSll  e1 e2

  EFNeg e'    -> float1 KFNeg e'
  EI2F  e'    -> float1 KI2F e'
  EFAdd e1 e2 -> float2 KFAdd e1 e2
  EFSub e1 e2 -> float2 KFSub e1 e2
  EFMul e1 e2 -> float2 KFMul e1 e2
  EFDiv e1 e2 -> float2 KFDiv e1 e2


  EEq{} -> g env (EIf e (EBool True) (EBool False))
  ELe{} -> g env (EIf e (EBool True) (EBool False))

  EIf (ENot e1) e2 e3 -> g env (EIf e1 e3 e2)

  EIf (EEq e1 e2) e3 e4 ->
    insertLet (g env e1) $ \x ->
    insertLet (g env e2) $ \y -> do
      (e3', t3) <- g env e3
      (e4',_t4) <- g env e4
      return (KIfEq x y e3' e4', t3)

  EIf (ELe e1 e2) e3 e4 ->
    insertLet (g env e1) $ \x ->
    insertLet (g env e2) $ \y -> do
      (e3', t3) <- g env e3
      (e4',_t4) <- g env e4
      return (KIfLe x y e3' e4', t3)

  EIf e1 e2 e3 ->
    g env (EIf (EEq e1 (EBool False)) e3 e2)

  ELet (x,t) e1 e2 -> do
    (e1',_t1) <- g env e1
    (e2', t2) <- g (M.insert x t env) e2
    return (KLet (x,t) e1' e2', t2)

  EVar x ->
    case M.lookup x env of
      Just t  -> return (KVar x, t)
      Nothing -> throwError $ Failure ("unknown variable " ++ x ++ " found")
      --Nothing -> uses extTyEnv (M.lookup x) >>= \case
      --  Just t@(TArray _) -> return (KExtArray x, t)
      --  _ -> throwError $ Failure ("external variable " ++ x ++" does not have an array type")

  ELetRec (EFunDef (x,t) yts e1) e2 -> do
    let env' = M.insert x t env
    (e2', t2) <- g env' e2
    (e1',_t1) <- g (insertList yts env') e1
    return (KLetRec (KFunDef (x,t) yts e1') e2', t2)

  EApp (EVar f) e2s
    | M.notMember f env -> uses extTyEnv (M.lookup f) >>= \case
        Just (TFun _ t) ->
          let bind xs []        = return (KExtFunApp f xs, t)
              bind xs (e2:e2s') = insertLet (g env e2) $ \x -> bind (xs++[x]) e2s'
          in  bind [] e2s
        _ -> error "KNormal:Aiee!!"

  EApp e1 e2s ->
    insertLetWithTy (g env e1) $ \f (TFun _ t) ->
    let bind xs []       = return (KApp f xs, t)
        bind xs (e2:e2s') = insertLet (g env e2) $ \x -> bind (xs++[x]) e2s'
    in  bind [] e2s

  ETuple es ->
    let bind xs ts []       = return (KTuple xs, TTuple ts)
        bind xs ts (e':es') = insertLetWithTy (g env e') $ \x t -> bind (xs++[x]) (ts++[t]) es'
    in  bind [] [] es

  ELetTuple xts e1 e2 ->
    insertLet (g env e1) $ \y -> do
      (e2',t2) <- g (insertList xts env) e2
      return (KLetTuple xts y e2', t2)

  EArray e1 e2 ->
    insertLet       (g env e1) $ \x    ->
    insertLetWithTy (g env e2) $ \y t2 ->
    return (KArray x y, TPtr t2)
    --let mkArray = case t2 of TFloat -> KFArray; _ -> KArray
    --in  return (mkArray x y, TArray t2)

  --EArray e1 e2 ->
  --  insertLet       (g env e1) $ \x    ->
  --  insertLetWithTy (g env e2) $ \y t2 ->
  --    let l = case t2 of
  --              TFloat -> "create_float_array"
  --              _ -> "create_array"
  --    in  return (KExtFunApp l [x,y], TArray t2)

  EGet e1 e2 ->
    insertLetWithTy (g env e1) $ \x (TPtr t) ->
    insertLet       (g env e2) $ \y -> return (KGet x y, t)

  EPut e1 e2 e3 ->
    insertLet (g env e1) $ \x ->
    insertLet (g env e2) $ \y ->
    insertLet (g env e3) $ \z ->
    return (KPut x y z, TUnit)

  where
    arity1 t f e1 =
      insertLet (g env e1) $ \x ->
      return (f x, t)
    int1 = arity1 TInt
    float1 = arity1 TFloat

    arity2 t f e1 e2 =
      insertLet (g env e1) $ \x ->
      insertLet (g env e2) $ \y ->
      return (f x y, t)
    int2 = arity2 TInt
    float2 = arity2 TFloat

kNormalize :: Expr -> Caml KExpr
kNormalize e = fst <$> g M.empty e


