{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

-- AFunDefからCFGを作ればあとはPureに任せれば良い

module BackEnd.Second.RegAlloc.Dominance where

import Base
import BackEnd.Second.Asm
import qualified BackEnd.Second.RegAlloc.Dominance.Pure as P
import           Prelude hiding (log,succ)
import           Data.Tree

-- Labelを経由したほうが速そう(ABlockの比較は時間がかかりそうなので)
dominatorTree :: AFunDef -> Tree ABlock
dominatorTree f = g (P.dominatorTree r vs es)
  where
    r = root f
    vs = vertexes f
    es = edges f

    g (Node l ls) = Node (unsafeLookup l (blockMap f)) (map g ls)

root :: AFunDef -> Label
root = entryBlockName

vertexes :: AFunDef -> [Label]
vertexes (AFunDef _ _ _ blocks _) = map ablockName blocks

edges :: AFunDef -> [(Label,Label)]
edges (AFunDef _ _ _ blocks _) = concatMap edge blocks

edge :: ABlock -> [(Label,Label)]
edge b@(ABlock u _) = map (u,) (nextBlockNames b)

