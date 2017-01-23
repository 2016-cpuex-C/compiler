{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc.Coalescing (
    coalesce
  , setArgs
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.RegAlloc.Coalescing.PhiOptimise
import qualified Data.Map as M
import Control.Monad.Extra (concatMapM)
import Control.Monad.Trans.State
import Control.Arrow (second)

coalesce :: AFunDef -> Map Id Color -> Caml (Map Id Color)
coalesce f colMap = do
  --(f', colMap') <- setArgs f colMap
  --phiOpimise f' colMap'
  phiOpimise f colMap

type CamlArg = StateT (Map Id Color) Caml

-- APhiSの追加
setArgs :: AFunDef -> Map Id Color -> Caml (AFunDef, Map Id Color)
setArgs f colMap = do
  (blocks',colMap') <- runStateT (mapM setArgsB (aBody f)) colMap
  return (f { aBody = blocks' }, colMap')

setArgsB :: ABlock -> CamlArg ABlock
setArgsB b = do
  stmts' <- concatMapM setArgsS (aStatements b)
  return b { aStatements = stmts' }

setArgsS :: Statement -> CamlArg [Statement]
setArgsS = \case
  (id', Do (ACall     t f xs ys)) -> hoge xs ys $ \xs' ys' -> (id', Do (ACall     t f xs' ys'))
  (id', Do (ATailCall t f xs ys)) -> hoge xs ys $ \xs' ys' -> (id', Do (ATailCall t f xs' ys'))
  (id', z := ACall     t f xs ys) -> hoge xs ys $ \xs' ys' -> (id', z := ACall     t f xs' ys')
  (id', z := ATailCall t f xs ys) -> hoge xs ys $ \xs' ys' -> (id', z := ACall     t f xs' ys')
  s -> return [s]

hoge :: [Id] -> [Id] -> ([Id] -> [Id] -> Statement) -> CamlArg [Statement]
hoge xs ys call = do
  xs' <- mapM rename xs
  ys' <- mapM rename ys
  forM_ (zip xs' [0..]) $ \(x,i) -> modify' (M.insert x (R i))
  forM_ (zip ys' [0..]) $ \(y,i) -> modify' (M.insert y (F i))
  phis' <- lift $ assignInstId $ Do $ phis (zip xs' xs) (zip ys' ys)
  return [phis', call xs' ys']
  where
    rename x = lift $ genId (x++"_arg")
    phis xxs' yys' = APhiS (xvs++yvs)
      where
        xvs = map (second f) xxs'
        yvs = map (second g) yys'
        f x = PVVar x TInt   False
        g y = PVVar y TFloat False

