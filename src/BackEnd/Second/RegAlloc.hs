{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

-- Spilling, Coloring, Coalescing を統合する予定

module BackEnd.Second.RegAlloc (
    regAlloc
  , Color(..)
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.RegAlloc.Coalescing --as Export

regAlloc :: AFunDef -> Caml (Map Id Color)
regAlloc f = coalesce f =<< colorFun f
{-regAlloc f = colorFun f-}

