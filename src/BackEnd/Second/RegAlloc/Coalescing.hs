{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc.Coalescing where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.RegAlloc.Coalescing.PhiOptimise
import qualified Data.Map as M
import qualified Data.Set as S
import Control.Lens.Operators
import Control.Monad.Extra (concatMapM)
import Control.Monad.Trans.State
import Control.Arrow (second)

data Pin = Pin {
    _colMap_ :: Map Id Color
  , _pinned_ :: Set Id
  }
makeLenses ''Pin
type CamlPin = StateT Pin Caml

coalesce :: AFunDef -> Map Id Color -> Caml (AFunDef,Map Id Color)
coalesce f colMap = do
  (f', Pin colMap' pinned) <- setArgs f colMap -- 関数呼び出しのcoalescing
  colMap'' <- phiOpimise f' colMap' pinned
  return (f',colMap'')

-- APhiSの追加
setArgs :: AFunDef -> Map Id Color -> Caml (AFunDef, Pin)
setArgs f colMap = do
  (blocks',s) <- runStateT (mapM setArgsB (aBody f)) Pin {
      _colMap_ = colMap
    , _pinned_ = S.empty
    }
  return (f { aBody = blocks' }, s)

setArgsB :: ABlock -> CamlPin ABlock
setArgsB b = do
  stmts' <- concatMapM setArgsS (aStatements b)
  return b { aStatements = stmts' }

setArgsS :: Statement -> CamlPin [Statement]
setArgsS s@(id',inst)= case inst of
  Do (ACall     t f xs ys) -> hoge xs ys $ \xs' ys' -> (id', Do (ACall     t f xs' ys'))
  Do (ATailCall t f xs ys) -> hoge xs ys $ \xs' ys' -> (id', Do (ATailCall t f xs' ys'))
  z := ACall     t f xs ys -> hoge xs ys $ \xs' ys' -> (id', z := ACall    t f xs' ys' )
  z := ATailCall t f xs ys -> hoge xs ys $ \xs' ys' -> (id', z := ACall    t f xs' ys' )

  Do (ARet t (Just (V x))) -> fuga t x   $ \x' -> (id', Do (ARet t (Just (V x'))))
  _ -> return [s]

hoge :: [Id] -> [Id] -> ([Id] -> [Id] -> Statement) -> CamlPin [Statement]
hoge xs ys call = do
  xs' <- mapM (renameAndPin "_arg") xs
  ys' <- mapM (renameAndPin "_arg") ys
  forM_ (zip xs' [0..]) $ \(x',i) -> colMap_ %= M.insert x' (R i)
  forM_ (zip ys' [0..]) $ \(y',i) -> colMap_ %= M.insert y' (F i)
  phis' <- lift $ assignInstId $ Do $ phis (zip xs' xs) (zip ys' ys)
  return [phis', call xs' ys']
  where
    phis xxs' yys' = APhiS (xvs++yvs)
      where
        xvs = map (second f) xxs'
        yvs = map (second g) yys'
        f x = PVVar x TInt   False
        g y = PVVar y TFloat False

fuga :: Type -> Id -> (Id -> Statement) -> CamlPin [Statement]
fuga t x ret = do
  x' <- renameAndPin "_ret" x
  colMap_ %= M.insert x' (if t == TFloat then F 0 else R 0)
  phi <- lift $ assignInstId $ Do (APhiS [(x',PVVar x t False)])
  return [phi, ret x']

renameAndPin :: String -> Id -> CamlPin Id
renameAndPin modifier x = do
  x' <- lift $ genId (x++modifier)
  pinned_ %= S.insert x'
  return x'

