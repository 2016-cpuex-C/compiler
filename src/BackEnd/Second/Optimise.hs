{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.Optimise (
    optimiseA
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Optimise.TailCall
import BackEnd.Second.Optimise.ConstFold ()
import BackEnd.Second.Optimise.CompareBranch
import BackEnd.Second.Optimise.NanjaKore
import BackEnd.Second.Optimise.MulAdd
import BackEnd.Second.Optimise.Elim
import Prelude hiding (log)

optimiseA :: AProg -> Caml AProg
optimiseA p = do
  ($logInfo) "optimiseA"
  elim $ mulAdd $ nanjaKore $ compareBranch $ tailCallOptimise p

