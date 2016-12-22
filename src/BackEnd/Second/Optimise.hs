
module BackEnd.Second.Optimise (
    optimiseA
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Optimise.TailCall
import Prelude hiding (log)

optimiseA :: AProg -> Caml AProg
optimiseA p = do
  log "optimiseA"
  return $ tailCallOptimise p

