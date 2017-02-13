{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

-- AFunDefからCFGを作ればあとはPureに任せれば良い

module BackEnd.Second.RegAlloc.Dominance (
    dominatorTree
  , dominatorTreeL
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import qualified BackEnd.Second.RegAlloc.Dominance.Pure as P

import Data.Tree

-- Labelを経由したほうが速い(ABlockの比較は重いので)
dominatorTree :: AFunDef -> Tree ABlock
dominatorTree f = g $ dominatorTreeL f
  where
    g (Node l ls) = Node (lookupMapNote "dominatorTree" l (blockMap f)) (map g ls)

dominatorTreeL :: AFunDef -> Tree Label
dominatorTreeL f = P.dominatorTree r vs es
  where
    r = root f
    vs = vertexes f
    es = edges f

root :: AFunDef -> Label
root = entryBlockName

vertexes :: AFunDef -> [Label]
vertexes (AFunDef _ _ _ blocks _) = map aBlockName blocks

edges :: AFunDef -> [(Label,Label)]
edges (AFunDef _ _ _ blocks _) = concatMap edge blocks

edge :: ABlock -> [(Label,Label)]
edge b@(ABlock u _) = map (u,) (nextBlockNames b)

