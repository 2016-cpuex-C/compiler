{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module MiddleEnd.StaticAlloc where
-- サイズが静的に分かるarrayをメモリにallocateする
-- TODO タプルもやる

import Prelude hiding (log)

import Base
import MiddleEnd.KNormal

import qualified Data.Map as M
import           Control.Lens

staticAlloc :: KExpr -> Caml KExpr
staticAlloc = f Nothing M.empty

-- mname : 現在定義中の配列の名前
-- env   : Int型定数の環境
f :: Maybe (Id,Type) -> Map Id Integer -> KExpr -> Caml KExpr
f mname env e = case e of
  KIfEq x y e1 e2 -> KIfEq x y <$> f Nothing env e1 <*> f Nothing env e2
  KIfLe x y e1 e2 -> KIfLe x y <$> f Nothing env e1 <*> f Nothing env e2
    -- 分岐する場合配列のサイズが異なる可能性があるため当面は諦める.
    -- TODO 両方調べて同じ長さならやるという方法がある

  KLetTuple xts y e' -> KLetTuple xts y <$> f mname env e'

  KLetRec (KFunDef (x,t) yts e1 b) e2 -> KLetRec (KFunDef (x,t) yts e1 b) <$> f mname env e2
    -- recursiveだとまずいので関数内は走査しない.
    -- TODO recursiveでなければ同じ所にallocしてよさげ

  KLet (x,TInt) (KInt i) e2 -> KLet (x,TInt) (KInt i) <$> f mname (M.insert x i env) e2
    -- ConstFoldが進むに連れてenvが充実するのでKIntに制限して良い

  KLet (x,t@(TPtr _)) e1 e2 -> KLet (x,t) <$> f (Just (x,t)) env e1 <*> f mname env e2

  KLet (x,t) e1 e2 -> KLet (x,t) <$> f mname env e1 <*> f mname env e2

  KArray y z -> case (mname, M.lookup y env) of
    (Just (name,TPtr elemty), Just size) -> do
      let gname = toGlobalId name
      addr <- use startGP
      startGP += size
      globalHeap %= M.insert gname (addr,size,TArray size elemty)
      --($logInfo) $ "Global: " <> pack name <> " is allocated at " <>
      --             show' addr <> " ~ " <> show' (addr+size-1)
      return $ KArrayInit (Label gname) z
    _ -> return e

  KVar x -> do
    heap <- use globalHeap
    case (mname, M.lookup x heap) of
      (Just (name,_), Just info) -> globalHeap %= M.insert name info
      _ -> return ()
    return e

  _ -> return e

