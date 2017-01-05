{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module MiddleEnd.LambdaLifting where

import Prelude hiding (log)

import           Base
import           MiddleEnd.KNormal       hiding (fv)
{-import           MiddleEnd.Alpha                (alpha)-}
import           MiddleEnd.Elim                 (elim)

import qualified Data.Map as M
import           Data.Set                       (toList, fromList, singleton, (\\))
import qualified Data.Set as S
import           Control.Lens            hiding (lifted)
import           Control.Monad.Trans.State.Lazy

data LL = LL { _directlyCallable :: Set Id -- function without any free variables
             , _liftedMap :: Map Id [Id]   -- lifted function and its free variables
             } deriving Show
makeLenses ''LL

type CamlLL = StateT LL Caml

lambdaLift :: KExpr -> Caml KExpr
lambdaLift e = evalStateT (f M.empty e) (LL S.empty M.empty) >>= elim

fv :: KExpr -> CamlLL (Set Id)
fv e_ = do
  --TODO 何度も呼び出すのもったいない
  stArrays <- lift $ uses globalHeap (map fst . M.toList)
  fv' stArrays e_
  where
    fv' :: [Id] -> KExpr -> CamlLL (Set Id)
    fv' ign e = case e of
      KUnit           -> return $ S.empty
      KInt _          -> return $ S.empty
      KBool _         -> return $ S.empty
      KFloat _        -> return $ S.empty
      KExtArray _     -> return $ S.empty
      KVar  x         -> return $ S.singleton x
      KNeg  x         -> return $ S.singleton x
      KFNeg x         -> return $ S.singleton x
      KAdd  x y       -> return $ S.fromList [x,y]
      KSub  x y       -> return $ S.fromList [x,y]
      KMul  x y       -> return $ S.fromList [x,y]
      KDiv  x y       -> return $ S.fromList [x,y]
      KFAdd x y       -> return $ S.fromList [x,y]
      KFSub x y       -> return $ S.fromList [x,y]
      KFMul x y       -> return $ S.fromList [x,y]
      KFDiv x y       -> return $ S.fromList [x,y]
      KTuple xs       -> return $ S.fromList xs
      KArray x y      -> return $ S.fromList [x,y]
      KArrayInit _ x  -> return $ S.singleton x
      KExtFunApp _ xs -> return $ S.fromList xs
      KIfEq x y e1 e2 ->
        S.insert x . S.insert y <$> (S.union <$> fv' ign e1 <*> fv' ign e2)
      KIfLe x y e1 e2 ->
        S.insert x . S.insert y <$> (S.union <$> fv' ign e1 <*> fv' ign e2)
      KLet (x,_t) e1 e2 -> S.union <$> fv' ign e1 <*> (S.delete x <$> fv' ign e2)
      KLetRec (KFunDef (x,_t) yts e1) e2 ->
        let ys = S.fromList $ map fst yts
        in  S.delete x <$> (S.union <$> ((\\ ys) <$> fv' ign e1) <*> fv' ign e2)
      KLetTuple xts y e' -> S.insert y . (\\ S.fromList (map fst xts)) <$> fv' ign e'
      KApp x ys -> do
        dcs <- use directlyCallable
        lm  <- use liftedMap
        return . S.fromList $ case (S.member x dcs, M.lookup x lm) of
          (True,  Nothing ) -> ys                  -- xは元からfvsなし
          (True,  Just fvs) -> ys++fvs             -- xはLambdaLiftingによってfvsなしに
          (False, Nothing ) -> x:ys                -- (recursive function)
          (False, Just fvs) -> liftName x:ys++fvs  -- xはLambdaLiftingしたものの引数いっぱい
      KGet x y
        | toGlobalId x `elem` ign -> return $ S.singleton y
        | otherwise    -> return $ S.fromList [x,y]
      KPut x y z
        | toGlobalId x `elem` ign -> return $ S.fromList [y,z]
        | otherwise    -> return $ S.fromList [x,y,z]

f :: Map Id Type -> KExpr -> CamlLL KExpr
f env e = case e of
  KIfEq x y e1 e2 -> KIfEq x y <$> f env e1 <*> f env e2
  KIfLe x y e1 e2 -> KIfLe x y <$> f env e1 <*> f env e2
  KLet (x,t) e1 e2 -> KLet (x,t) <$> f env e1 <*> f (M.insert x t env) e2
  KLetTuple xts y e' -> KLetTuple xts y <$> f (insertList xts env) e'

  KLetRec fundef@(KFunDef (x,t) yts e1) e2 -> do
    let ys = map fst yts
        envE2  = M.insert x t env
        envE1  = insertList yts envE2
    fvs' <- fv e1
    case toList $ fvs' \\ singleton x \\ fromList ys of
      [] -> do
        -- lift.($logInfo) $ pack x <> " is directly callable"
        directlyCallable %= S.insert x
        e1' <- f envE1 e1
        e2' <- f envE2 e2
        return $ KLetRec fundef{kbody=e1'} e2'

      fvs -> do
        --lift.($logInfo).pack $
        --  "LambdaLifting: free variable(s) " ++ ppList fvs ++ " " ++
        --  "found in function " ++ x
        let (fvs1,fvs2) = splitAt (maxArgs - length ys) fvs
            ts = [ t' | ~(Just t') <- map (`M.lookup` env) fvs1 ]
            insertOrigin = KLetRec fundef{kbody = KApp (liftName x) (fvs1++ys)}
            envE2' = M.insert (liftName x) (liftTy t ts) envE2
        if null fvs2 then do
          -- lift.($logInfo) $ pack x <> " is directly callable"
          directlyCallable %= S.insert x
        else lift.($logWarn).pack $
          "there are so many free variables in " ++ x ++
          " that can't lift it: " ++ show (length fvs2) ++
          " variables remains"
        liftedMap %= M.insert x fvs1
        e1' <- insertOrigin <$> f envE1  e1
        e2' <- insertOrigin <$> f envE2' e2
        return $ KLetRec (liftFun fundef fvs1 ts e1') e2'
            -- e.g. fundef : f = fun y -> x + y のとき
            --    lifted : _f = fun x y -> x + y
            --    origin : f  = fun y -> _f x y

  KApp x ys -> do
    lifted <- use liftedMap
    case M.lookup x lifted of
      Nothing  -> return $ KApp x ys
      Just fvs -> return $ KApp (liftName x) (fvs++ys)

  _ -> return e

liftFun :: KFunDef -> [Id] -> [Type] -> KExpr -> KFunDef
liftFun (KFunDef (x,t) yts _) fvs ts e =
  let t' = liftTy t ts
      yts' = zip fvs ts ++ yts
  in  KFunDef (liftName x,t') yts' e

-- "_"で始まる名前は無いのでこれでOK(see FrontEnd.Lexer)
liftName :: Id -> Id
liftName x = "_"++x

liftTy :: Type -> [Type] -> Type
liftTy t ts = case t of
  TFun targs tret -> TFun (ts++targs) tret
  _ -> error "まじで"

