{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc (
    regAlloc
  , Color(..)
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.RegAlloc.Coalescing

regAlloc :: AFunDef -> Caml (AFunDef,Map Id Color)
regAlloc f = coalesce f =<< colorFun f

