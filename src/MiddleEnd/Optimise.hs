
module MiddleEnd.Optimise where

import Base
import MiddleEnd.KNormal
import MiddleEnd.Beta
import MiddleEnd.Assoc
import MiddleEnd.Inline
import MiddleEnd.ConstFold
import MiddleEnd.Elim
import MiddleEnd.CSE
import MiddleEnd.StaticAlloc
import Control.Lens (use)

import Prelude hiding (log)

optimise :: KExpr -> Caml KExpr
optimise e = use optimiseLimit >>= go e
  where
    go e' 0 = return e'
    go e' n = do
      log $ "iter: " ++ show n
      e'' <- staticAlloc =<< cse =<< elim =<< constFold =<< inline =<< assoc =<< beta e'
      if e'==e''
        then return e'
        else go e'' (n-1)

