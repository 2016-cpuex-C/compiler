{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}
-- 積和命令
-- a = y * z
-- b = x + a
-- => b = x + y * z

module BackEnd.Second.Optimise.MulAdd where

import Base
import BackEnd.Second.Asm

import qualified Data.Map as M
import           Data.Maybe (catMaybes)

mulAdd :: AProg -> AProg
mulAdd (AProg fs) = AProg $ map mulAddFun fs

mulAddFun :: AFunDef -> AFunDef
mulAddFun f = f { aBody = map mulAddBlock (aBody f) }

mulAddBlock :: ABlock -> ABlock
mulAddBlock b = b { aStatements = map g (aStatements b) }
  where
    h x = M.lookup x (mulMap b)
    g s@(n,inst) = case inst of
      x := AFAdd (h -> Just (z,w)) y -> (n, madd x y z w)
      x := AFAdd y (h -> Just (z,w)) -> (n, madd x y z w)
      _ -> s

    -- x := y + z * w
    madd x y z w = x := APrim (Label "madd")
                          (TFun [TFloat,TFloat,TFloat] TFloat)
                          [] [y,z,w]

mulMap :: ABlock -> Map Id (Id,Id)
mulMap b =
  let g (_,x := AFMul y z) = Just (x,(y,z))
      g _ = Nothing
  in M.fromList $ catMaybes $ map g (aStatements b)

