{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc.Coalescing (
    coalesce
  , callHoge
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.RegAlloc.Coalescing.PhiOptimise

coalesce :: AFunDef -> Map Id Color -> Caml (Map Id Color)
coalesce = phiOpimise

-- APhiSの追加
callHoge :: AFunDef -> Caml AFunDef
callHoge = undefined



