{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Analysis.StackAndReg (
    stackInMap
  , regInMap
  , regOutMap
) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis.Base
import BackEnd.Second.Analysis.Lifetime

import qualified Data.Map.Strict as M
import qualified Data.Set as S
import           Data.Set (union,(\\))
import           Data.Maybe (mapMaybe)

-- Virtual.saveAndRestore用の解析
--     Virtual.insertSave     saveを挿入
--  -> stackInMap             stackの状態を計算
--  -> reg(In/Out)Map         registerの状態を計算
--  -> Virtual.insertRestore  restoreを挿入
-- の順に使う
-- stackInMapはEmitモジュールでも使用する

-------------------------------------------------------------------------------
-- Stack
-------------------------------------------------------------------------------

-- 各ブロックの先頭でStackに入っているはずの変数
--  stackIn[b]  = ∩ (b'∈ pred[b]) stackOut[b']
--  stackOut[b] = stackIn[b]∪ save[b]
-- を元に計算
-- Virtual.insertSave後のAFunDefに対して有効
-- (SSA Deconstructionの後でも良い)

stackInMap :: AFunDef -> Caml (Map Label (Set Id))
stackInMap = return . stackInMapSub

stackInMapSub :: AFunDef -> Map Label (Set Id)
stackInMapSub fun = fst <$> fix' M.empty go
  where
    go :: Map Label (Set Id, Set Id) -> Map Label (Set Id, Set Id)
    go s = foldl f mempty (aBody fun)
      where
        f acc b =
          let l = aBlockName b
              in_b  = intersections' [ snd $ lookupWith0 lp s
                                     | lp <- lookupWith0 l (predBlockMap fun) ]
              out_b = saveOut b in_b
          in M.insert l (in_b,out_b) acc

-- stackにin'がある状態でbに入ってきたとして,
-- bの出口でstackに存在する変数の集合
saveOut :: ABlock -> Set Id -> Set Id
saveOut b in' = in' `union` savedAt b

savedAt :: ABlock -> Set Id
savedAt b = S.fromList $ mapMaybe h $ aStatements b
  where h (_,Do (ASave  _ x)) = Just x -- 第二引数 stack上での名前
        h (_,Do (AFSave _ x)) = Just x
        h _                   = Nothing

-------------------------------------------------------------------------------
-- Register
-------------------------------------------------------------------------------

-- 各ブロックの先頭/後尾でRegisterに入っている変数
--  mustRegIn[b] = UEVAR[b] \ StackIn[b]
--  regOut[b] = (∪ (b'∈ succ[b]) mustRegIn[b'])∪ left[b]
--  regIn[b]  = ∩ (b'∈ pred[b]) regOut[b]
-- を元に計算
-- UEVAR[b]:
--  upper exposed variables.
--  bの上のブロック(bへのCFG上のpathがあるブロック)で定義され,
--  b以下のブロックで使われる変数
-- left[b]:
--  b中の最後の関数呼び出し..
--    + で定義される変数
--    + 以降で使われる変数
--  はregisterに残っている(後者はrestoreが挿入されることを見越して)

mustRegInMap :: AFunDef -> Caml (Map Label (Set Id))
mustRegInMap fun = do
  liveOut <- M.map gattai <$> analyzeLifetime fun
  let stackInMap' = stackInMapSub fun
      ueVar l =
        let (id',inst) = firstStmt $ (blockMap fun)!l
            lo = liveOut!id'
        in  (lo `union` useInst' inst) \\ defInst' inst
  return $ M.fromList [ (l, ueVar l \\ (stackInMap'!l)) | ABlock l _ <- aBody fun ]

regOutMap :: AFunDef -> Caml (Map Label (Set Id))
regOutMap fun = do
  regInMap' <- mustRegInMap fun
  let left l =
        let f acc (_,inst) = case inst of
              Do ACall{} -> defInst' inst
              _:=ACall{} -> defInst' inst
              _          -> acc `union` defInst' inst `union` useInst' inst
        in  foldl' f (regInMap'!l) (aStatements $ (blockMap fun)!l)
      regOut l =
        S.unions $ (left l:) $ map (regInMap'!) $ (succBlockMap fun)!l
  return $ M.fromList [ (l, regOut l) | ABlock l _ <- aBody fun ]

regInMap :: AFunDef -> Caml (Map Label (Set Id))
regInMap fun = do
  mustRegInMap' <- mustRegInMap fun
  regOutMap' <- regOutMap fun
  let regOut l =
        regOutMap'!l
      pred' l =
        (predBlockMap fun)!l
      regIn l
        | null (pred' l) = mustRegInMap'!l
        | otherwise      = intersections' (map regOut (pred' l))
  return $ M.fromList [ (l, regIn l) | ABlock l _ <- aBody fun ]

-- phi関数のオペランドはstackにあっても良い(cf. SSA_Deconstruction)
useInst' :: Inst -> Set Id
useInst' (Do APhiV{}) = S.empty
useInst' inst = gattai $ useInst inst

defInst' :: Inst -> Set Id
defInst' inst = gattai $ defInst inst

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

(!) :: Ord k => Map k a -> k -> a
(!) = flip $ lookupMapNote "StackAndReg: "
infix 7 !

lookupWith0 :: Monoid a => Label -> Map Label a -> a
lookupWith0 = M.findWithDefault mempty

intersections' :: Ord a => [Set a] -> Set a
intersections' [] = S.empty
intersections' ss = foldl1 S.intersection ss

fix' :: Eq a => a -> (a -> a) -> a
fix' m f = go m
  where go x = let x' = f x in if x==x' then x else go x'

gattai :: (Set Id, Set Id) -> Set Id
gattai = uncurry union

