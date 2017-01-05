{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.CSE where
{- Common Subexpression Elimination -}

import           Base
import           MiddleEnd.KNormal
import           MiddleEnd.Elim    (hasSubEffect)

import qualified Data.Map as M
import           Control.Monad.Reader
import           Data.Maybe (fromMaybe)

fromJust :: Maybe a -> a
fromJust = fromMaybe (error "cse.hs")

hasSubEffect' :: KExpr -> Bool
hasSubEffect' = hasSubEffect

cse :: KExpr -> Caml KExpr
cse = return . cse'

cse' :: KExpr -> KExpr
cse' e = runReader (cElim e) M.empty

cElim :: KExpr -> Reader (Map KExpr Id) KExpr
cElim e = do
  calculated <- asks $ M.member e
  if | hasSubEffect e -> return e
     | calculated -> case e of
          KUnit -> return e
          KInt{} -> return e
          _ -> KVar <$> asks (lookupMapNote "cElim" e)
     | otherwise -> case e of
          KLet (x,t) e1 e2 -> do
            e2' <- local (M.insert e1 x) (cElim e2)
            return $ KLet (x,t) e1 e2'
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

