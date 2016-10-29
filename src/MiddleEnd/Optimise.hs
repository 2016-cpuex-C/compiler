
module MiddleEnd.Optimise where

import Base
import MiddleEnd.KNormal
import MiddleEnd.Beta
import MiddleEnd.Assoc
import MiddleEnd.Inline
import MiddleEnd.ConstFold
import MiddleEnd.Elim
import MiddleEnd.CSE
import Control.Lens (use)

optimise :: KExpr -> Caml KExpr
optimise e = use optimiseLimit >>= go e
  where
    go e' n = do
      e'' <- cse =<< elim =<< constFold =<< inline =<< assoc =<< beta e'
      if e'==e''
        then return e'
        else go e'' (n-1)

