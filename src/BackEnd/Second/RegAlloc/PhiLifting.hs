{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.RegAlloc.PhiLifting where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm

phiLift :: AFunDef -> Caml AFunDef
phiLift = undefined

{-
PhiLifting (a i = φ(a i1 : B 1 , a i2 : B 2 , . . . , a im : B m ))
  Create new virtual v i
  Add copy instruction I = a i := v i
  at the end of block B j
  Replace a i by v i in φ
  For each virtual a ij ∈ φ,
    Create new virtual v ij
    Add copy instruction I = v ij := a ij
    at the end of block B j
    Replace a ij by v ij in φ

PhiMemCoalesce (S I = {I 1 , I 2 , . . . , I q }, S Q = {Q 1 , Q 2 , . . . , Q r })
  For each instruction I = v ij := a ij ∈ S I,
    S I := S I \ {I}
    Let Q v be the equivalence class of v ij
    Let Q a be the equivalence class of a ij
    If Q v ∩ Q v = ∅
      S Q := S Q \ {Q v }
      S Q := S Q \ {Q a }
      S Q := S Q ∪ {Q a ∪ Q v
-}

