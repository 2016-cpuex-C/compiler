{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module FrontEnd.Typing where

import Base
import FrontEnd.Syntax

import Data.IORef
import Control.Monad (zipWithM_)
import Control.Monad.Trans.Except
import qualified Data.Map as M
import           Control.Lens

-------------------------------------------------------------------------------
-- Main Function
-------------------------------------------------------------------------------

typing :: Expr -> Caml Expr
typing e = do
  m <- runExceptT $ do
    t <- infer M.empty e
    unify TUnit t `catchError` \Unify{} -> throwError Top
    extTyEnv <~ join (uses extTyEnv (mapM derefType))
    derefExpr e
  case m of
    Right e' -> return e'
    Left Top -> throwError $ Failure "top level does not have type unit"
    Left err -> throwError $ Failure $ show err

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type CamlT = ExceptT TypingError Caml

data TypingError
  = Unify Type Type
  | Typing Expr Type Type
  | Top
  deriving (Show)

readType :: TV -> CamlT (Maybe Type)
readType (TV _ ref) = liftIO $ readIORef ref

writeType :: TV -> Type -> CamlT ()
writeType (TV _ ref) t = liftIO $ writeIORef ref (Just t)

-------------------------------------------------------------------------------
-- Dereference
-------------------------------------------------------------------------------

derefType :: Type -> CamlT Type
derefType = \case
  TFun t1s t2 -> TFun   <$> mapM derefType t1s <*> derefType t2
  TTuple ts   -> TTuple <$> mapM derefType ts
  TPtr t      -> TPtr   <$> derefType t
  TVar tv -> readType tv >>= \case
    Nothing -> do
      lift.($logWarn) $ "uninstantiated type variable detected; assuming int@."
      writeType tv TInt
      return TInt
    Just t -> do
      t' <- derefType t
      writeType tv t'
      return t'
  TArray{} -> error "FrontEnd.Typing: TArray (impossible)"
  t -> return t

derefIdType :: (Id, Type) -> CamlT (Id, Type)
derefIdType (x,t) = (x,) <$> derefType t

derefFundef :: EFunDef -> CamlT EFunDef
derefFundef (EFunDef xt args e b) =
  EFunDef <$> derefIdType xt <*> mapM derefIdType args <*> derefExpr e <*> return b

derefExpr :: Expr -> CamlT Expr
derefExpr = \case
  ENot e        -> ENot   <$> derefExpr e
  ENeg e        -> ENeg   <$> derefExpr e
  EAdd e1 e2    -> EAdd   <$> derefExpr e1 <*> derefExpr e2
  ESub e1 e2    -> ESub   <$> derefExpr e1 <*> derefExpr e2
  EMul e1 e2    -> EMul   <$> derefExpr e1 <*> derefExpr e2
  EDiv e1 e2    -> EDiv   <$> derefExpr e1 <*> derefExpr e2
  ELAnd e1 e2   -> ELAnd  <$> derefExpr e1 <*> derefExpr e2
  ELOr  e1 e2   -> ELOr   <$> derefExpr e1 <*> derefExpr e2
  ELXor  e1 e2  -> ELXor   <$> derefExpr e1 <*> derefExpr e2
  EFNeg e       -> EFNeg  <$> derefExpr e
  EFAdd e1 e2   -> EFAdd  <$> derefExpr e1 <*> derefExpr e2
  EFSub e1 e2   -> EFSub  <$> derefExpr e1 <*> derefExpr e2
  EFMul e1 e2   -> EFMul  <$> derefExpr e1 <*> derefExpr e2
  EFDiv e1 e2   -> EFDiv  <$> derefExpr e1 <*> derefExpr e2
  EEq  e1 e2    -> EEq    <$> derefExpr e1 <*> derefExpr e2
  ELe  e1 e2    -> ELe    <$> derefExpr e1 <*> derefExpr e2
  EIf e1 e2 e3  -> EIf    <$> derefExpr e1 <*> derefExpr e2 <*> derefExpr e3
  EApp e es     -> EApp   <$> derefExpr e <*> mapM derefExpr es
  EArray e1 e2  -> EArray <$> derefExpr e1 <*> derefExpr e2
  EGet e1 e2    -> EGet   <$> derefExpr e1 <*> derefExpr e2
  EPut e1 e2 e3 -> EPut   <$> derefExpr e1 <*> derefExpr e2 <*> derefExpr e3
  ETuple es     -> ETuple <$> mapM derefExpr es
  ELet xt e1 e2 -> ELet  <$> derefIdType xt <*> derefExpr e1 <*> derefExpr e2
  ELetRec fundef e2 -> ELetRec <$> derefFundef fundef <*> derefExpr e2
  ELetTuple xts e1 e2 ->
    ELetTuple <$> mapM derefIdType xts <*> derefExpr e1 <*> derefExpr e2
  e -> return e

-------------------------------------------------------------------------------
-- Subroutines
-------------------------------------------------------------------------------

infer :: TyEnv -> Expr -> CamlT Type
infer env e =
  case e of
    EUnit    -> return TUnit
    EBool _  -> return TBool
    EInt _   -> return TInt
    EFloat _ -> return TFloat

    ENot  e' -> bool1  e'
    ENeg  e' -> int1   e'
    EFNeg e' -> float1 e'

    EAdd  e1 e2 -> int2 e1 e2
    ESub  e1 e2 -> int2 e1 e2
    EMul  e1 e2 -> int2 e1 e2
    EDiv  e1 e2 -> int2 e1 e2
    ELAnd e1 e2 -> int2 e1 e2
    ELOr  e1 e2 -> int2 e1 e2
    ELXor e1 e2 -> int2 e1 e2
    ESrl  e1 e2 -> int2 e1 e2
    ESll  e1 e2 -> int2 e1 e2

    EFAdd e1 e2 -> float2 e1 e2
    EFSub e1 e2 -> float2 e1 e2
    EFMul e1 e2 -> float2 e1 e2
    EFDiv e1 e2 -> float2 e1 e2

    EF2I e' -> do
        unifyM1 TFloat (infer env e')
        return TInt
    EI2F e' -> do
        unifyM1 TInt (infer env e')
        return TFloat

    EEq e1 e2 -> do
        unifyM2 (infer env e1) (infer env e2)
        return TBool
    ELe e1 e2 -> do
        unifyM2 (infer env e1) (infer env e2)
        return TBool

    EIf e1 e2 e3 -> do
        unifyM1 TBool (infer env e1)
        t2 <- infer env e2
        t3 <- infer env e3
        unify t2 t3
        return t2

    EVar x -> -- env -> S.extTyEnv と探し, なかったらS.extTyEnvに追加
      case M.lookup x env of
        Just t  -> return t
        Nothing -> uses extTyEnv (M.lookup x) >>= \case
          Just t -> return t
          Nothing -> do
            lift.($logWarn) $ "free variable " <> pack x <> " assumed as external@."
            t <- lift genType
            extTyEnv %= M.insert x t
            return t

    ELet (x,t) e1 e2 -> do
        unifyM1 t (infer env e1)
        infer (M.insert x t env) e2

    ELetRec (EFunDef (x,t) yts e1 _) e2 -> do
      let env' = M.insert x t env
      let argtys = map snd yts
      t' <- infer (insertList yts env') e1
      unify t (TFun argtys t')
      infer env' e2

    EApp e' es' -> do
      tret <- lift genType
      argtys <- mapM (infer env) es'
      unifyM1 (TFun argtys tret) (infer env e')
      return tret

    ETuple es -> TTuple <$> mapM (infer env) es

    ELetTuple xts e1 e2 -> do
      unifyM1 (TTuple $ map snd xts) (infer env e1)
      infer (insertList xts env) e2

    EArray e1 e2 -> do
      unifyM1 TInt (infer env e1)
      TPtr <$> infer env e2

    EGet e1 e2 -> do
      t <- lift genType
      unifyM1 (TPtr t) (infer env e1)
      unifyM1 TInt     (infer env e2)
      return t

    EPut e1 e2 e3 -> do
      t <- infer env e3
      unifyM1 (TPtr t) (infer env e1)
      unifyM1 TInt     (infer env e2)
      return TUnit

  `catchError`
    \err -> case err of
      Unify t1 t2 -> do
        e' <- derefExpr e
        t1' <- derefType t1
        t2' <- derefType t2
        throwError $ Typing e' t1' t2'
      _ -> throwError err
  where
    int1 e' = do
      unifyM1 TInt (infer env e')
      return TInt
    float1 e' = do
      unifyM1 TFloat (infer env e')
      return TFloat
    bool1 e' = do
      unifyM1 TBool (infer env e')
      return TBool

    int2 e1 e2 = do
      unifyM1 TInt (infer env e1)
      unifyM1 TInt (infer env e2)
      return TInt
    float2 e1 e2 = do
      unifyM1 TFloat (infer env e1)
      unifyM1 TFloat (infer env e2)
      return TFloat

unify :: Type -> Type -> CamlT ()
unify t1 t2 = case (t1,t2) of
  (TUnit, TUnit ) -> return ()
  (TInt,  TInt  ) -> return ()
  (TBool, TBool ) -> return ()
  (TFloat,TFloat) -> return ()

  (TFun t1s t1', TFun t2s t2')
    | length t1s == length t2s -> zipWithM_ unify (t1':t1s) (t2':t2s)
    | otherwise -> throwError $ Unify t1 t2
  (TTuple t1s, TTuple t2s)
    | length t1s == length t2s -> zipWithM_ unify t1s t2s
    | otherwise -> throwError $ Unify t1 t2
  (TPtr t1', TPtr t2') -> unify t1' t2'
  (TVar ref1, TVar ref2)
    | ref1 == ref2 -> return ()
    | otherwise -> (,) <$> readType ref1 <*> readType ref2 >>= \case
          (Just t1', _) -> unify t1' t2
          (_, Just t2') -> unify t1  t2'
          _             -> writeType ref1 t2
  (TVar ref1, _) -> readType ref1 >>= \case
      Nothing -> ifM (occur ref1 t2)
                     (throwError $ Unify t1 t2)
                     (writeType ref1 t2)
      Just t1' -> unify t1' t2
  (_, TVar ref2) -> readType ref2 >>= \case
      Nothing -> ifM (occur ref2 t1)
                     (throwError $ Unify t1 t2)
                     (writeType ref2 t1)
      Just t2' -> unify t1 t2'
  (TArray{}, _) -> error "FrontEnd.Typing: TArray (impossible)"
  (_, TArray{}) -> error "FrontEnd.Typing: TArray (impossible)"
  _ -> throwError $ Unify t1 t2

unifyM1 :: Type -> CamlT Type -> CamlT ()
unifyM1 t1 m2 = do
  t2 <- m2
  unify t1 t2

unifyM2 :: CamlT Type -> CamlT Type -> CamlT ()
unifyM2 m1 m2 = do
  t1 <- m1
  t2 <- m2
  unify t1 t2

occur :: TV -> Type -> CamlT Bool
occur tv1 = \case
  TFun t2s t2 -> anyM (occur tv1) (t2:t2s)
  TTuple t2s  -> anyM (occur tv1) t2s
  TPtr     t2 -> occur tv1 t2
  TVar tv2
    | tv1==tv2  -> return True
    | otherwise -> readType tv2 >>= \case
        Nothing -> return False
        Just t2 -> occur tv1 t2
  TArray{} -> error "FrontEnd.Typing: TArray (impossible)"
  _ -> return False

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

ifM :: Monad m => m Bool -> m a -> m a -> m a
ifM b x y = b >>= \case True -> x; False -> y

anyM :: Monad m => (a -> m Bool) -> [a] -> m Bool
anyM _m []     = return False
anyM  m (x:xs) = ifM (m x) (return True) (anyM m xs)

allM :: Monad m => (a -> m Bool) -> [a] -> m Bool
allM _m []     = return True
allM  m (x:xs) = ifM (m x) (allM m xs) (return False)

