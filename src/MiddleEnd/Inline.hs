{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module MiddleEnd.Inline where

import Prelude hiding (log)

import           Base
import           MiddleEnd.KNormal
import qualified MiddleEnd.Alpha as Alpha

import qualified Data.Map as M
import qualified Data.Set as S
import           Data.List (isPrefixOf)

inline :: KExpr -> Caml KExpr
inline e = do
  limit <- use threshold
  inlineSub limit e

size :: KExpr -> Int
size = \case
  KIfEq _ _ e1 e2             -> 1 + size e1 + size e2
  KIfLe _ _ e1 e2             -> 1 + size e1 + size e2
  KLet _ e1 e2                -> 1 + size e1 + size e2
  KLetRec (KFunDef _ _ e1) e2 -> 1 + size e1 + size e2
  KLetTuple _ _ e             -> 1 + size e
  _ -> 1

inlineSub :: Int -> KExpr -> Caml KExpr
inlineSub _limit = g M.empty
  where
    g :: Map Id ([(Id,Type)], KExpr) -> KExpr -> Caml KExpr
    g env e = case e of
      KIfEq x y e1 e2 -> KIfEq x y <$> g env e1 <*> g env e2
      KIfLe x y e1 e2 -> KIfLe x y <$> g env e1 <*> g env e2

      KLet xt e1 e2 -> KLet xt <$> g env e1 <*> g env e2
      KLetRec f@(KFunDef (x,t) yts e1) e2 -> do
        {-let inlining = not (isRecursive f)-}
        let inlining = size e1 < _limit && (not (isRecursive f))
            env' = if not inlining then env else M.insert x (yts,e1) env
        e1' <- g env' e1
        e2' <- g env' e2
        return $ KLetRec (KFunDef (x,t) yts e1') e2'
      KApp x ys ->
        case M.lookup x env of
          Just (zts,e') -> do
            ($logInfo) $ "inlining " <> pack x
            let env' = M.fromList (zip (map fst zts) ys)
            Alpha.g env' e'
          _ -> return e
      KLetTuple xts y e' -> KLetTuple xts y <$> g env e'
      _ -> return e


-- recursive functionのみinline化
inlineRec :: KExpr -> Caml KExpr
inlineRec e = do
  limit <- use threshold
  inlineRecSub limit e

inlineRecSub :: Int -> KExpr ->Caml KExpr
inlineRecSub limit = g' Nothing M.empty
  where
    g' :: Maybe Id -> Map Id ([(Id,Type)], KExpr) -> KExpr -> Caml KExpr
    g' target env e =
      let g = g' target
      in  case e of
      KIfEq x y e1 e2 -> KIfEq x y <$> g env e1 <*> g env e2
      KIfLe x y e1 e2 -> KIfLe x y <$> g env e1 <*> g env e2

      KLet xt e1 e2 -> KLet xt <$> g env e1 <*> g env e2
      KLetRec (KFunDef (x,t) yts e1) e2 -> do
        let inlining = size e1 < limit
                    && not ("read_net_item"   `isPrefixOf` x)
                    && not ("read_or_network" `isPrefixOf` x)
                    -- 350でcolort tarinai 他のは1500いける
            env' = if not inlining then env else M.insert x (yts,e1) env
        e1' <- g' (Just x) env' e1
        e2' <- g env' e2
        return $ KLetRec (KFunDef (x,t) yts e1') e2'
      KApp x ys ->
        case (target,M.lookup x env) of
          (Just x', Just (zts,e')) | x==x' -> do
            ($logInfo) $ "inlining " <> pack x <> " size: " <> show' (size e')
            let env' = M.fromList (zip (map fst zts) ys)
            Alpha.g env' e'
          _ -> return e
      KLetTuple xts y e' -> KLetTuple xts y <$> g env e'
      _ -> return e

-- even-oddみたいな相互再帰には対応していない
-- レイトレにはないのでまあ
isRecursive :: KFunDef -> Bool
isRecursive (KFunDef (x,_) _ e) = x `S.member` fv e

