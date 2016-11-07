{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

module MiddleEnd.LambdaLifting where

import Prelude hiding (log)

import           Base
import           MiddleEnd.KNormal       hiding (fv)
import           MiddleEnd.Alpha                (alpha)
import           MiddleEnd.Elim                 (elim)

import           Data.Map                       (Map)
import qualified Data.Map as M
import           Data.Set                       (toList, fromList, singleton, Set, (\\))
import qualified Data.Set as S
import           Data.Maybe                     (fromMaybe)
import           Control.Lens            hiding (lifted)
import           Control.Monad.Trans.Class      (lift)
import           Control.Monad.Trans.State.Lazy

data LL = LL { _directlyCallable :: Set Id -- function without any free variables
             , _liftedMap :: Map Id [Id]   -- lifted function and its free variables
             } deriving Show
makeLenses ''LL

type CamlLL = StateT LL Caml

lambdaLift :: KExpr -> Caml KExpr
lambdaLift e = evalStateT (f M.empty e) (LL S.empty M.empty) >>= alpha >>= elim

fv :: KExpr -> CamlLL (Set Id)
fv e_ = do
  stArrays <- lift $ uses globalHeap (map fst . M.toList) --何度も呼び出すのもったいない
  fv' stArrays e_
  where
    fv' :: [Id] -> KExpr -> CamlLL (Set Id)
    fv' ign e = case e of
      KUnit           -> return $ S.empty
      KInt _          -> return $ S.empty
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
      KFArray x y     -> return $ S.fromList [x,y]
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
        | x `elem` ign -> return $ S.singleton y
        | otherwise    -> return $ S.fromList [x,y]
      KPut x y z
        | x `elem` ign -> return $ S.fromList [y,z]
        | otherwise    -> return $ S.fromList [x,y,z]

f :: Map Id Type -> KExpr -> CamlLL KExpr
f env e = case e of
  KIfEq x y e1 e2 -> KIfEq x y <$> f env e1 <*> f env e2
  KIfLe x y e1 e2 -> KIfLe x y <$> f env e1 <*> f env e2
  KLet (x,t) e1 e2 -> KLet (x,t) <$> f env e1 <*> f (M.insert x t env) e2
  KLetTuple xts y e' -> KLetTuple xts y <$> f (M.union (M.fromList xts) env) e'

  KLetRec fundef@(KFunDef (x,t) yts e1) e2 -> do
    let ys = map fst yts
        envE2  = M.insert x t env
        envE1  = M.union (M.fromList yts) envE2
    fvs' <- fv e1
    case toList $ fvs' \\ singleton x \\ fromList ys of
      [] -> do
        lift.log $ x ++ " is directly callable"
        directlyCallable %= S.insert x
        e1' <- f envE1 e1
        e2' <- f envE2 e2
        return $ KLetRec fundef{kbody=e1'} e2'

      fvs -> do
        lift.log $ "LambdaLifting: free variable(s) " ++ ppList fvs ++ " " ++
                   "found in function " ++ x
        let (fvs1,fvs2) = splitAt (maxArgs - length ys) fvs
            ts = map (`unsafeLookup` env) fvs1
            fundef' = liftFun fundef fvs1 ts
            insertOrigin = KLetRec fundef{kbody=KApp (liftName x) (fvs1++ys)}
            envE2' = M.insert (liftName x) (liftTy t ts) envE2
            -- e.g. fundef: f = fun y -> x + y のとき
            --    fundef': _f = fun x y -> x + y
            --    origin : f  = fun y -> _f x y
        if null fvs2 then do
          lift.log $ x ++ " is directly callable"
          directlyCallable %= S.insert x
        else lift.log $
          "there are so many free variables in " ++ x ++
          " that can't lift all of them: " ++ show (length fvs2) ++
          " variables remains unlifted"
        liftedMap %= M.insert x fvs1
        e1' <- f envE1  e1
        e2' <- f envE2' e2
        return $ KLetRec fundef'{kbody=insertOrigin e1'} $ insertOrigin e2'

  KApp x ys -> do
    lifted <- use liftedMap
    case M.lookup x lifted of
      Nothing  -> return $ KApp x ys
      Just fvs -> return $ KApp (liftName x) (fvs++ys)

  _ -> return e

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "unsafeLookup: " ++ show key) (M.lookup key dic)

liftFun :: KFunDef -> [Id] -> [Type] -> KFunDef
liftFun (KFunDef (x,t) yts _) fvs ts =
  let t' = liftTy t ts
      yts' = zip fvs ts ++ yts
  in  KFunDef (liftName x,t') yts' undefined

-- "_"で始まる名前は無いのでこれでOK(see FrontEnd.Lexer)
liftName :: Id -> Id
liftName x = "_"++x

liftTy :: Type -> [Type] -> Type
liftTy t ts = case t of
  TFun targs tret -> TFun (ts++targs) tret
  _ -> error "まじで"

