{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

module MiddleEnd.Global where
-- global array をコンパイル時に確保する

import Prelude hiding (log)

import Base
import MiddleEnd.KNormal

import           Data.Map (Map)
import qualified Data.Map as M
import           Control.Lens

staticArray :: KExpr -> Caml KExpr
staticArray = f Nothing M.empty

-- mname : 現在定義中の変数名(配列に限る)
-- env   : Int型定数の環境
f :: Maybe (Id,Type) -> Map Id Integer -> KExpr -> Caml KExpr
f mname env e = case e of
  KIfEq x y e1 e2 -> KIfEq x y <$> f Nothing env e1 <*> f Nothing env e2
  KIfLe x y e1 e2 -> KIfLe x y <$> f Nothing env e1 <*> f Nothing env e2
    -- 分岐する場合配列のサイズが異なる可能性があるため当面は諦める.
    -- TODO 両方調べて同じ長さならやるという方法がある

  KLetTuple xts y e' -> KLetTuple xts y <$> f mname env e'

  KLetRec (KFunDef (x,t) yts e1) e2 -> KLetRec (KFunDef (x,t) yts e1) <$> f mname env e2
    -- recursiveだとまずいので関数内は走査しない.
    -- TODO recursiveでなければ同じ所にallocしてよさげ(相互再帰は無いのでチェックは楽)

  KLet (x,TInt) (KInt i) e2 -> KLet (x,TInt) (KInt i) <$> f mname (M.insert x i env) e2
    -- ConstFoldが進むに連れてenvが充実する

  KLet (x,t@(TArray _)) e1 e2 -> KLet (x,t) <$> f (Just (x,t)) env e1 <*> f mname env e2
    -- TODO 不安

  KLet (x,t) e1 e2 -> KLet (x,t) <$> f mname env e1 <*> f mname env e2

  KArray y z -> case (mname, M.lookup y env) of
    (Just (name,t), Just size) -> do
      addr <- use startGP
      startGP += size
      globalHeap %= M.insert name (addr,t)
      log $ "Global: " ++ name ++ " is allocated at " ++
            show addr ++ " ~ " ++ show (addr+size-1)
      initializeArray "array_init" (addr,size) z
    _ -> return e
  KFArray y z -> case (mname, M.lookup y env) of
    (Just (name,t), Just size) -> do
      addr <- use startGP
      startGP += size
      globalHeap %= M.insert name (addr,t)
      log $ "Global: " ++ name ++ " is allocated at " ++
            show addr ++ " ~ " ++ show (addr+size-1)
      initializeArray "float_array_init" (addr,size) z
    _ -> return e

  KVar x -> do
    heap <- use globalHeap
    case (mname, M.lookup x heap) of
      (Just (name,t), Just (addr,t'))
        | t==t' -> globalHeap %= M.insert name (addr,t)
              -- let arr = let x = createArray 0 0 in x みたいな場合
              -- この時点でxとtに同じ場所を割り当てて良い.
        | otherwise -> error "Global.hs: Impossible"
      _ -> return ()
    return e

  _ -> return e

initializeArray :: Id -> (Integer,Integer) -> Id -> Caml KExpr
initializeArray createArray (addr,size) x = do
  vaddr <- genId "addr"
  vsize <- genId "size"
  return $
    KLet (vaddr,TInt) (KInt addr) $
      KLet (vsize,TInt) (KInt size) $
        KExtFunApp createArray [vaddr,vsize,x]
