{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
--{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.Optimise.TailCall where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

tailCallOptimise :: AProg -> AProg
tailCallOptimise p = AProg $ main : map tailCallOptimiseFun others
  where (main,others) = popMain p

tailCallOptimiseFun :: AFunDef -> AFunDef
tailCallOptimiseFun f = f { aBody = map tailCallOptimiseBlock $ aBody f }

tailCallOptimiseBlock :: ABlock -> ABlock
tailCallOptimiseBlock b = b { aStatements = f $ aStatements b }
  where
    f [s] = [s]
    f stmts = (stmts'++) $ case (p,q) of
        ((i, x := ACall t l ys zs), (_, Do (ARet _ (Just (V y)))))
          | x==y -> [(i, Do (ATailCall t l ys zs))]

        ((i, Do (ACall t l ys zs)), (_, Do (ARet _ Nothing)))
                 -> [(i, Do (ATailCall t l ys zs))]

        ((i, _ := ACall t l ys zs), (_, Do (ARet _ Nothing)))
                 -> [(i, Do (ATailCall t l ys zs))]

        _ -> [p,q]
      where
        (stmts', [p,q]) = splitAt (length stmts - 2) stmts


