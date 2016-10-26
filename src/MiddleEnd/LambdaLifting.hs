{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

module MiddleEnd.LambdaLifting where

import Prelude hiding (log)

import           Base
import           MiddleEnd.KNormal

import           Data.Map                       (Map)
import qualified Data.Map as M
import           Data.Set                       (fromList, Set, (\\))
import qualified Data.Set as S
import           Data.Maybe                     (fromMaybe)
import           Control.Lens            hiding (lifted)
--import           Control.Monad                  (unless)
import           Control.Monad.Trans.Class      (lift)
import           Control.Monad.Trans.State.Lazy

data LL = LL { _topLevelFuns :: Set Id
             , _liftedMap ::Map Id [Id]
             } deriving Show
makeLenses ''LL

type CamlLL = StateT LL Caml

lambdaLift :: KExpr -> Caml KExpr
lambdaLift e = evalStateT (f M.empty e) (LL S.empty M.empty)

f :: Map Id Type -> KExpr -> CamlLL KExpr
f env e = case e of
  KUnit    -> return   KUnit
  KInt i   -> return $ KInt i
  KFloat d -> return $ KFloat d

  KNeg  x -> return $ KNeg x
  KFNeg x -> return $ KFNeg x

  KAdd  x y -> return $ KAdd  x y
  KSub  x y -> return $ KSub  x y
  KMul  x y -> return $ KMul  x y
  KDiv  x y -> return $ KDiv  x y
  KFAdd x y -> return $ KFAdd x y
  KFSub x y -> return $ KFSub x y
  KFMul x y -> return $ KFMul x y
  KFDiv x y -> return $ KFDiv x y

  KIfEq x y e1 e2 -> KIfEq x y <$> f env e1 <*> f env e2
  KIfLe x y e1 e2 -> KIfLe x y <$> f env e1 <*> f env e2

  KLet (x,t) e1 e2 -> KLet (x,t) <$> f env e1 <*> f (M.insert x t env) e2

  KLetRec fundef@(KFunDef (x,t) yts e1) e2 -> do
    topLevelFuns %= S.insert x
    topLevel <- use topLevelFuns
    let ys = map fst yts
        envE2  = M.insert x t env
        envE1  = M.union (M.fromList yts) envE2
    case S.toList (fv e1 \\ topLevel \\ fromList ys) of
      [] -> do
        e1' <- f envE1 e1
        e2' <- f envE2 e2
        return $ KLetRec fundef{kbody=e1'} e2'

      fvs -> do
        lift.log $ "free variable(s) " ++ ppList fvs ++ " " ++
                   "found in function " ++ x ++ "\n"
        let ts = map (`unsafeLookup` env) fvs
            fundef' = abstruct fundef fvs ts
            insertOrigin = KLetRec fundef{kbody=KApp (liftName x) (fvs++ys)}
        liftedMap %= M.insert x fvs
        e1' <- f envE1 e1
        e2' <- f envE2 e2
        return $ KLetRec fundef'{kbody=insertOrigin e1'} $ insertOrigin e2'
        -- e1,e2中の, 関数適用でないxはclosureにするしか無いのでinsertOriginが必要
        -- 例: let f x = let g y = x + y in g の最後のg

  KApp x ys -> do
    lifted <- use liftedMap
    case M.lookup x lifted of
      Nothing  -> return $ KApp x ys
      Just fvs -> return $ KApp (liftName x) (fvs++ys)

  KTuple xs -> return $ KTuple xs

  KVar x -> return $ KVar x

  KLetTuple xts y e' -> KLetTuple xts y <$> f (M.union (M.fromList xts) env) e'

  KGet x y        -> return $ KGet x y
  KPut x y z      -> return $ KPut x y z
  KExtArray x     -> return $ KExtArray x
  KExtFunApp x ys -> return $ KExtFunApp x ys

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "unsafeLookup: " ++ show key) (M.lookup key dic)

abstruct :: KFunDef -> [Id] -> [Type] -> KFunDef
abstruct (KFunDef (x,t) yts _) fvs ts =
  let t' = case t of
             TFun targs tret -> TFun (ts++targs) tret
             _ -> error "まじで"
      yts' = zip fvs ts ++ yts
  in  KFunDef (liftName x,t') yts' undefined

-- 良くないかも 考えます
liftName :: Id -> Id
liftName x = "__"++x


