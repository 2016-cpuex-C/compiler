{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module MiddleEnd.Optimise where

import Base
import MiddleEnd.KNormal
import MiddleEnd.Beta
import MiddleEnd.Assoc
import MiddleEnd.Inline
import MiddleEnd.ConstFold
import MiddleEnd.Elim
import MiddleEnd.CSE ()
import MiddleEnd.StaticAlloc

import Prelude hiding (log)

optimise :: KExpr -> Caml KExpr
optimise = optimise1 >=> optimise2

optimise1 :: KExpr -> Caml KExpr
optimise1 e = use optimiseLimit >>= go e
  where
    go e' 0 = return e'
    go e' n = do
      ($logInfo) $ "iter: " <> show' n
      e'' <- staticAlloc =<< elim =<< constFold =<< inline =<< assoc =<< beta e'
      if e'==e''
        then return e'
        else go e'' (n-1)

optimise2 :: KExpr -> Caml KExpr
optimise2 e = ($logInfo) "optimise2" >> use optimiseLimit >>= go e
  where
    go e' 0 = return e'
    go e' n = do
      ($logInfo) $ "iter: " <> show' n
      e'' <- staticAlloc =<< elim =<< constFold =<< inlineRec =<< assoc =<< beta e'
      if e'==e''
        then return e'
        else go e'' (n-1)
