{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

-- AFunDefからCFGを作ればあとはPureに任せれば良い

module BackEnd.Second.RegAlloc.Dominance where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import qualified BackEnd.Second.RegAlloc.Dominance.Pure as P

import           Data.Tree

-- Labelを経由したほうが速い(ABlockの比較は重いので)
dominatorTree :: AFunDef -> Tree ABlock
dominatorTree f = g (P.dominatorTree r vs es)
  where
    r = root f
    vs = vertexes f
    es = edges f

    g (Node l ls) = Node (lookupMapNote "dominatorTree" l (blockMap f)) (map g ls)

root :: AFunDef -> Label
root = entryBlockName

vertexes :: AFunDef -> [Label]
vertexes (AFunDef _ _ _ blocks _) = map aBlockName blocks

edges :: AFunDef -> [(Label,Label)]
edges (AFunDef _ _ _ blocks _) = concatMap edge blocks

edge :: ABlock -> [(Label,Label)]
edge b@(ABlock u _) = map (u,) (nextBlockNames b)

