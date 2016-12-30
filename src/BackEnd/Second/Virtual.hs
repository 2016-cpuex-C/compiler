{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import           Safe
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Data.List ((\\), foldl')
import           Data.List.Extra (unsnoc)
import           Data.Tree
import           Control.Lens (view,use,uses,makeLenses)
import           Control.Lens.Operators
import           Control.Monad ((>=>), forM)
import           Control.Monad.Trans.State
import           Control.Monad.Extra (concatMapM)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data RS
  = RS {
    _bmap     :: Map Label ABlock
  , _predMap  :: Map Label [Label]
  , _liveOutB :: Map Label (Set Id, Set Id)
  , _regSet   :: Set Id
  , _stackSet :: Set Id
  }
makeLenses ''RS
type CamlRS = StateT RS Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = do
  log "virtual"
  AProg <$> mapM (virtualFunDef>=>zantei) fundefs
  {-AProg <$> mapM (virtualFunDef>=>saveAndRestore) fundefs-}

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef f@(AFunDef l _ _ blocks _) = do
  log $ "virtualFunDef: " ++ show l
  blocks' <- forM blocks $
                mergePhis >=> calcPtr
  return f{ aBody=blocks' }

-------------------------------------------------------------------------------
-- Vectorise Phi Functions
-------------------------------------------------------------------------------

-- phiのベクトル化 生存解析のために必要
-- phiが先頭に並んでいることを仮定
mergePhis :: ABlock -> Caml ABlock
mergePhis block@(ABlock _ stmts) =
  return block { aStatements = f M.empty stmts }
    where
      f :: Map Label [(Id,PhiVal)] -> [Statement] -> [Statement]
      f _ [] = []
      f acc is'@((id',inst):is) = case inst of
        x := APhi lvs ->
          let acc' = foldl' h acc lvs
              h acc_ (l,v) =
                let g Nothing = Just [(x,v)]
                    g (Just xvs) = Just ((x,v):xvs)
                in M.alter g l acc_
          in f acc' is
        _ -- end
          | M.null acc -> is'
          | otherwise  -> (id'-1, Do (APhiV (M.toList acc))) : is'

-------------------------------------------------------------------------------
-- Calculate Pointer Address
-------------------------------------------------------------------------------

-- Ptr, PtrGをAddとかにつぶす
-- TODO 複数indexに対応
calcPtr :: ABlock -> Caml ABlock
calcPtr block@(ABlock _ insts) = do
  heap <- use globalHeap
  inst' <- concatMapM (f heap) insts
  return block{ aStatements = inst' }
    where
      f heap i@(n,ninst)= case ninst of
        x := APtr p ixs ->
          case ixs of
          [ix] -> return [(n, x := AAdd p ix)]
          [C k,C j] -> do
            ptr <- genId "ptr"
            m   <- freshInstId
            return [(n,ptr := ALd p (C k)), (m, x := AAdd ptr (C j))]
          [V y,C j] -> do
            tmp <- genId "tmp"
            ptr <- genId "ptr"
            m   <- freshInstId
            l   <- freshInstId
            return [(l, tmp := AAdd p (V y)), (n, ptr := ALd tmp (C 0)), (m, x := AAdd ptr (C j))]
          _ -> error $ "BackEnd.Second.Virtual: Not Implemented: " ++ show i
        x := APtrG (Label p) ixs ->
          let Just (addr,_,_) = M.lookup p heap
          in  case ixs of
          [C j]     -> return [(n, x := ASet (addr+j))]
          [V y]     -> return [(n, x := AAdd y (C addr))]
          [V y,C j] -> do
            ptr <- genId "ptr"
            m   <- freshInstId
            return [(n, ptr := ALd y (C addr)), (m, x := AAdd ptr (C j))]
          _ -> error $ "BackEnd.Second.Virtual: Not Implemented: " ++ show i
        _ -> return [i]

-------------------------------------------------------------------------------
-- Save/Restore
-------------------------------------------------------------------------------

saveAndRestore :: AFunDef -> Caml AFunDef
saveAndRestore = insertSave >=> insertRestore

----------
-- Save --
----------

insertSave :: AFunDef -> Caml AFunDef
insertSave fun@(AFunDef _ _ _ blocks _) = do
  liveout <- analyzeLifetime fun
  blocks' <- mapM (insertSaveB liveout) blocks
  return fun { aBody = blocks' }

insertSaveB :: Map InstId (Set Id, Set Id) -> ABlock -> Caml ABlock
insertSaveB liveout b@(ABlock _ insts) = do
  insts' <- concatMapM (insertSaveI liveout) insts
  return b { aStatements = insts' }

insertSaveI :: Map InstId (Set Id, Set Id)
            -> (InstId, Inst) -> Caml [(InstId, Inst)]
insertSaveI liveout inst@(n,i) = case i of
  Do ACall{}         -> insertSaveISub inst Nothing
  x := ACall t _ _ _ -> insertSaveISub inst (Just (x,t))
  _ -> return [inst]

  where
    (live,liveF)  = fromJustNote ("insertSaveI: live: "++show inst)
                                 (M.lookup n liveout)
    insertSaveISub inst' mx = do
      ss' <- mapM assignInstId saves
      return $ ss' ++ [inst']
      where
        saves   = map (Do . ASave) xs ++ map (Do .AFSave) ys
        (xs,ys) = (S.toList live \\ m ,S.toList liveF \\ mF)
        (m,mF)  = case mx of
                    Just (x,TFloat) -> ([],[x])
                    Just (x,_)      -> ([x],[])
                    Nothing         -> ([],[])

-- Analysis.Stackを使う
--
--  状態
--  + 現在saveされている変数の集合 saved     :: Set Id
--
--  savedに無い変数はレジスタにある 逆も然り
--  (ただしsave直後の関数呼び出しを除く callではrestoreしないようにすれば良さそう)
--  + Save x は Save (x ++ cnt x) に書き換える必要あり
--    + already savedの判定どうするの
--      + ~~Save (base name) (current name) のように持っておけば良い
--        + Save x "" -> Save x (x ++ cnt x)
--        + Analysis.Stackは base name だけを見る~~
--      + restoreの前にAnalysis.Stackを呼んで,
--        不要なsaveは除去しておけば良い
--  + savedにある変数を見たら直前にrestoreを挿入し,savedから削除
--  + traverseの順番を間違えると死ぬ
--    + 多分Emitと同じように単純にdfsでよい
-- ASaveは[Id]を引数に取るのがいいかもしれない
--
-- used inst と saved のintersectionをとる
--
-- とりあえず

insertRestore :: AFunDef -> Caml AFunDef
insertRestore fun@(AFunDef _ xs ys _ _) = do
  let stackMap  = stackSets fun
      blockTree = dfsBlock fun
  liveout <- analyzeLifetime fun
  blocks <- M.elems . view bmap <$>
    execStateT (insertRestoreTree (S.fromList (xs++ys)) stackMap blockTree) RS {
      _bmap     = blockMap fun
    , _predMap  = predBlockMap fun
    , _liveOutB = toLiveOutB liveout
    , _regSet   = S.empty
    , _stackSet = S.empty
    }
  return fun { aBody = blocks }

  where
    toLiveOutB liveout' = M.fromList
      [ (l, lives)
      | b <- aBody fun
      , let l = aBlockName b
            lastId = fst $ lastStmt b
            lives = fromJustNote "hoge" $ M.lookup lastId liveout'
      ]

insertRestoreTree :: Set Id -> Map Label (Set Id) -> Tree ABlock -> CamlRS ()
insertRestoreTree rs stackMap (Node b ts) = do
  let l = aBlockName b
      Just s = M.lookup l stackMap
  insertRestoreBlock rs s b
  mapM_ (insertRestoreTree S.empty stackMap) ts

-- super tanuki
-- 　 　 _    _
--     （〆⌒ ヽ)
--     ﾐ ´・ω･｀)ﾐ
--　　/ ,..──-､ ヽ
--　 しｌ　 x　）J
-- ___.'､ヽ　 ノ
--(_((_,ノＵ¯Ｕ
insertRestoreBlock :: Set Id -> Set Id -> ABlock -> CamlRS ()
insertRestoreBlock rs s (ABlock l stmts) = do

  regSetIn <- do
    preds <- uses predMap (M.findWithDefault [] l)
    x <- mapM (\l' -> uses liveOutB (uncurry S.union . unsafeLookup l')) preds
    if null x
      then return S.empty
      else return $ foldl1 S.intersection x
  lift.log $ "insertRestoreBlock: " ++ show l
  lift.log $ show regSetIn

  let うわああああんもういやだあああ = True
  if うわああああんもういやだあああ
    then error "うわああああんもういやだあああ"
    else return ()

  stackSet %= S.filter (`S.member` s)
  regSet   .= regSetIn `S.union` rs
  Just (stmts_,term) <- unsnoc <$> concatMapM insertRestoreStmt stmts

  inReg <- use regSet
  Just (liveout,liveoutF) <- uses liveOutB (M.lookup l)
  restore  <- forM (S.toList $ liveout S.\\ inReg) $ \x -> do
    regSet %= S.insert x
    lift $ assignInstId $ Do (ARestore x)
  restoreF <- forM (S.toList $ liveoutF S.\\ inReg) $ \x -> do
    regSet %= S.insert x
    lift $ assignInstId $ Do (AFRestore x)
  addBlock l $ stmts_ ++ restore ++ restoreF ++ [term]

insertRestoreStmt :: Statement -> CamlRS [Statement]
insertRestoreStmt s = case snd s of
  Do (ASave x) -> uses stackSet (S.member x) >>= \case
    True  -> return []
    False -> return [s]

  {-Do APhiV{} -> return [s]-}

  inst -> do
    inReg <- use regSet
    let (used,usedF) = useInst inst
    restore  <- forM (S.toList $ used S.\\ inReg) $ \x -> do
      regSet %= S.insert x
      lift $ assignInstId $ Do (ARestore x)
    restoreF <- forM (S.toList $ usedF S.\\ inReg) $ \x -> do
      regSet %= S.insert x
      lift $ assignInstId $ Do (AFRestore x)
    case inst of
      x:=ACall{} -> regSet .= S.singleton x
      Do ACall{} -> regSet .= S.empty
      x := _     -> regSet %= S.insert x
      _          -> return ()
    return $ restore ++ restoreF ++ [s]

addBlock :: Label -> [Statement] -> CamlRS ()
addBlock l contents = bmap %= M.insert l (ABlock l contents)

------------
-- zantei --
------------

zantei :: AFunDef -> Caml AFunDef
zantei fundef@(AFunDef _ _ _ blocks _) = do
  liveout <- analyzeLifetime fundef
  blocks' <- mapM (zanteiB liveout) blocks
  return fundef { aBody = blocks' }

zanteiB :: Map InstId (Set Id, Set Id)
        -> ABlock -> Caml ABlock
zanteiB liveout b@(ABlock _ insts) = do
  insts' <- concatMapM (zanteiI liveout) insts
  return b { aStatements = insts' }

zanteiI :: Map InstId (Set Id, Set Id)
        -> (InstId, Inst) -> Caml [(InstId, Inst)]
zanteiI liveout inst@(n,i) = case i of
  Do ACall{} -> zanteiISub inst Nothing
  x := ACall t _ _ _ -> zanteiISub inst (Just (x,t))
  _ -> return [inst]
  where
    (live,liveF) =
      fromJustNote ("zanteiI: live: " ++ show inst) (M.lookup n liveout)

    zanteiISub :: (InstId, Inst)
               -> Maybe (Id,Type) -> Caml [(InstId, Inst)]
    zanteiISub inst' mx = do
      ss' <- mapM assignInstId saves
      rs' <- mapM assignInstId restores
      return $ ss' ++ [inst'] ++ rs'

      where
        saves :: [Inst]
        saves = map (Do . ASave) xs ++ map (Do .AFSave) ys

        restores ::[Inst]
        restores = map (Do . ARestore) xs ++ map (Do . AFRestore) ys

        -- call前にsaveすべきもの
        xs,ys :: [Id]
        (xs,ys) = (S.toList live \\ m ,S.toList liveF \\ mF)
            where (m,mF) = case mx of
                    Just (x,TFloat) -> ([],[x])
                    Just (x,_)      -> ([x],[])
                    Nothing         -> ([],[])

