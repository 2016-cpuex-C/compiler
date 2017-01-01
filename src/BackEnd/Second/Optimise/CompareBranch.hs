{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
--  cond := ACmp p x y
--  Do (ACBr cond l1 l2)
-- condがほかで使われていないとき
--  Do (ACmpBr p x y l1 l2)
-- に変換 Emitでbeq x y l1とかに潰す

module BackEnd.Second.Optimise.CompareBranch where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import qualified Data.Map as M
import           Data.List (delete)

compareBranch :: AProg -> AProg
compareBranch (AProg fs) = AProg $ map compareBranchFun fs

compareBranchFun :: AFunDef -> AFunDef
compareBranchFun f = f { aBody = map g (aBody f) }
  where g = compareBranchBlock (defSiteMap f) (useSiteMap f)

compareBranchBlock :: Map Id Statement -> Map Id [Statement] -> ABlock -> ABlock
compareBranchBlock defMap useMap b@(ABlock _ stmts) = case lastStmt b of
  lst@(n, Do (ACBr x lt lf)) -> case M.lookup x useMap of
    Just [_] -> case M.lookup x defMap of
      Just def_x@(_, _ := ACmp  p y z') ->
        let lst' = (n, Do (ACmpBr p y z' lt lf))
            stmts' = delete def_x (delete lst stmts) ++ [lst']
        in b { aStatements = stmts' }
      Just def_x@(_, _ := AFCmp p y z ) ->
        let lst' = (n, Do (AFCmpBr p y z lt lf))
            stmts' = delete def_x (delete lst stmts) ++ [lst']
        in b { aStatements = stmts' }
      _ -> b
    _ -> b
  _ -> b

