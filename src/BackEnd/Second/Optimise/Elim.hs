{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
-- 不要定義削除

module BackEnd.Second.Optimise.Elim where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import qualified Data.Map as M
import Data.Maybe (catMaybes)

elim :: AProg -> AProg
elim (AProg fs) = AProg $ map elimFun fs

elimFun :: AFunDef -> AFunDef
elimFun f = f { aBody = map g (aBody f) }
  where g = elimBlock (useSiteMap f)

elimBlock :: Map Id [Statement] -> ABlock -> ABlock
elimBlock dic b = b { aStatements = catMaybes $ map g (aStatements b) }
  where
    notUsed x = null $ M.findWithDefault [] x dic
    g s@(n,inst) = case inst of
      x := e@ACall{}
        | notUsed x -> Just (n,Do e)
      x := _
        | notUsed x -> Nothing
      _ -> Just s

