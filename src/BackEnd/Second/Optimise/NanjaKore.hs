{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}

--    x := Add y (C i)
--    z := Ld x (C j)
-- みたいなのを
--    z := Ld y (C (i+j))に変換する
-- GetElementPtrが大量のAdd y (C i)を生成しているので(cf. Virtual.calcPtr)
-- かなり効くはず

module BackEnd.Second.Optimise.NanjaKore where

import Base
import BackEnd.Second.Asm

import qualified Data.Map as M
import           Data.Maybe (catMaybes)

nanjaKore :: AProg -> AProg
nanjaKore (AProg fs) = AProg $ map nanjaKoreFun fs

nanjaKoreFun :: AFunDef -> AFunDef
nanjaKoreFun f = f { aBody = map g (aBody f) }
  where g = nanjaKoreBlock (addiMap f)

nanjaKoreBlock :: Map Id (Id,Integer) -> ABlock -> ABlock
nanjaKoreBlock dic b = b { aStatements = map g (aStatements b) }
  where
    g s@(n,inst) = case inst of
      x := ALd y (C i) -> case M.lookup y dic of
        Just (z,j) -> (n, x := ALd z (C (i+j)))
        Nothing -> s
      x := AFLd y (C i) -> case M.lookup y dic of
        Just (z,j) -> (n, x := AFLd z (C (i+j)))
        Nothing -> s
      Do (ASt x y (C i)) -> case M.lookup y dic of
        Just (z,j) -> (n, Do (ASt x z (C (i+j))))
        Nothing -> s
      Do (AFSt x y (C i)) -> case M.lookup y dic of
        Just (z,j) -> (n, Do (AFSt x z (C (i+j))))
        Nothing -> s
      _ -> s

addiMap :: AFunDef -> Map Id (Id,Integer)
addiMap f =
  let g (_,x := AAdd y (C i)) = Just (x,(y,i))
      g _ = Nothing
      stmts = concatMap aStatements $ aBody f
  in M.fromList $ catMaybes $ map g stmts

