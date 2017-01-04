{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
-- remove or simplify virtual instructions

module BackEnd.Second.Virtual where

import Prelude

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import qualified Data.Map as M
import qualified Data.Set as S
import           Data.List ((\\))
import           Data.List.Extra (unsnoc)
import           Data.Tree
import           Control.Lens (Lens')
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Monad.Extra (concatMapM)
import           Control.Monad.State.Class (MonadState)
import           Control.Arrow (second)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data RS
  = RS {
    _blockMap_   :: Map Label ABlock
  , _liveOutB_   :: Map Label (Set Id, Set Id)
  , _predMap_    :: Map Label [Label]
  , _stackInMap_ :: Map Label (Set Id)
  , _regInMap_   :: Map Label (Set Id)
  , _regOutMap_  :: Map Label (Set Id)
  , _regSet_     :: Set Id
  , _stackSet_   :: Set Id
  }
makeLenses ''RS
type CamlRS = StateT RS Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

virtual :: AProg -> Caml AProg
virtual (AProg fundefs) = do
  ($logInfo) "virtual"
  AProg <$> mapM (virtualFunDef>=>saveAndRestore) fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef f@(AFunDef _l _ _ blocks _) = do
  --($logInfo) $ "virtualFunDef: " <> show' _l
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
{-saveAndRestore = insertSave >=> insertRestore_-}
saveAndRestore f = do
  fi <- insertSave f
  fr <- insertRestore fi
  ($logDebug) ">>>saveAndRestore>>>"
  ($logDebugSH) fi
  ($logDebugSH) fr
  ($logDebug) "<<<saveAndRestore<<<"
  return fr

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

-------------
-- Restore --
-------------

insertRestore :: AFunDef -> Caml AFunDef
insertRestore fun = do
  stackInMap' <- stackInMap fun
  regInMap'   <- regInMap fun
  regOutMap'  <- regOutMap fun
  ($logDebug) ">>>insertRestore>>>"
  ($logDebugSH) regInMap'
  ($logDebugSH) regOutMap'
  ($logDebug) "<<<insertRestore<<<"
  liveOutB'   <- analyzeLifetimeB fun
  blocks <- M.elems . view blockMap_ <$>
    execStateT (mapM_ insertRestoreBlock (aBody fun)) RS {
      _blockMap_    = blockMap fun
    , _liveOutB_    = liveOutB'
    , _predMap_     = predBlockMap fun
    , _stackInMap_  = stackInMap'
    , _regInMap_    = regInMap'
    , _regOutMap_   = regOutMap'
    , _regSet_      = S.empty
    , _stackSet_    = S.empty
    }
  return fun { aBody = blocks }

-- TODO Baseに移動
lookupMapLensM :: (Ord k, MonadState s m) => k -> Lens' s (Map k a) -> m (Maybe a)
lookupMapLensM x m = uses m (M.lookup x)
lookupMapLensNoteM :: (Ord k, MonadState s m) => String -> k -> Lens' s (Map k a) -> m a
lookupMapLensNoteM s x m = fromJustNote msg <$> lookupMapLensM x m
  where msg = "lookupMapLensNoteM: " ++ s

-- 手続き的だなあ
insertRestoreBlock :: ABlock -> CamlRS ()
insertRestoreBlock (ABlock l stmts) = do
  let msg = "insertRestoreBlock: "

  -- initialize
  stackSet_ <~ lookupMapLensNoteM msg l stackInMap_
  regSet_   <~ lookupMapLensNoteM msg l regInMap_

  -- stmts
  Just (stmts',term) <- unsnoc <$> concatMapM insertRestoreStmt stmts

  -- restore
  regOut  <- lookupMapLensNoteM msg l regOutMap_
  regSet' <- use regSet_
  (liveOut',liveOutF') <- lookupMapLensNoteM msg l liveOutB_
  let toBeRestored = regOut S.\\ regSet'
  restores  <- mapM restore  $ S.toList $ liveOut'  `S.intersection` toBeRestored
  restoreFs <- mapM restoreF $ S.toList $ liveOutF' `S.intersection` toBeRestored

  -- end
  addBlock l $ stmts' ++ restores ++ restoreFs ++ [term]

insertRestoreStmt :: Statement -> CamlRS [Statement]
insertRestoreStmt s@(id',inst) =
  case inst of
    Do (ASave x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return []
      False -> stackSet_ %= S.insert x >> return [s]

    Do (AFSave x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return []
      False -> stackSet_ %= S.insert x >> return [s]

    Do (APhiV lvs) -> do
      lvs' <- mapM hogePhiVal lvs
      regSet_ %= S.union (uncurry S.union $ defInst inst)
      return [(id', Do (APhiV lvs'))]

    _ -> do
      let (used,usedF) = useInst inst
      regSet' <- use regSet_
      restores  <- mapM restore  $ S.toList $ used  S.\\ regSet'
      restoreFs <- mapM restoreF $ S.toList $ usedF S.\\ regSet'
      case inst of
        x:=ACall{} -> regSet_ .= S.singleton x
        Do ACall{} -> regSet_ .= S.empty
        x := _     -> regSet_ %= S.insert x
        _          -> return ()
      return $ restores ++ restoreFs ++ [s]

-- TODO なんでこれで結果が変わるのさ
--      + SSAでなくなる
--      + そのためregister割り当てに影響がある
restore :: Id -> CamlRS Statement
--restore x  = regSet_ %= S.insert x >> lift (assignInstId $ x := ARestore x)
restore x  = regSet_ %= S.insert x >> lift (assignInstId $ Do (ARestore x))

restoreF :: Id -> CamlRS Statement
--restoreF x = regSet_ %= S.insert x >> lift (assignInstId $ x := AFRestore x)
restoreF x = regSet_ %= S.insert x >> lift (assignInstId $ Do (AFRestore x))

hogePhiVal :: (Label, [(Id,PhiVal)]) -> CamlRS (Label, [(Id,PhiVal)])
hogePhiVal (l,xvs) = do
  regOut' <- lookupMapLensNoteM "hogePhiVal: " l regOutMap_
  let f (PVVar x t _)
        | x `S.member` regOut' = PVVar x t False -- on register
        | otherwise            = PVVar x t True  -- on memory
      f v = v
  return (l, map (second f) xvs)

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

insertRestore_ :: AFunDef -> Caml AFunDef-- {{{
insertRestore_ fun@(AFunDef _ xs ys _ _) = do
  let blockTree = dfsBlock fun
  stackMap <- stackInMap fun
  liveout <- analyzeLifetime fun

  --($logDebug) $ "===================="
  --($logDebugSH) =<< regInMap fun
  --($logDebugSH) =<< regOutMap fun

  --($logDebugSH) $ toLiveOutB liveout
  blocks <- M.elems . view blockMap_ <$>
    execStateT (insertRestoreTree_ (S.fromList (xs++ys)) stackMap blockTree) RS {
      _blockMap_= blockMap fun
    , _predMap_ = predBlockMap fun
    , _liveOutB_= toLiveOutB liveout
    , _regSet_  = S.empty
    , _stackSet_= S.empty
    , _stackInMap_ = undefined
    , _regInMap_   = undefined
    , _regOutMap_  = undefined
    }
  return fun { aBody = blocks }

  where
    toLiveOutB liveout' = M.fromList
      [ (l, lives)
      | b <- aBody fun
      , let l = aBlockName b
            lastId = fst $ lastStmt b
            lives = fromJustNote "そんなバナナ" $ M.lookup lastId liveout'
      ]
-- }}}

-- entry blockではArgsを考慮する必要がある
insertRestoreTree_ :: Set Id -> Map Label (Set Id) -> Tree ABlock -> CamlRS ()-- {{{
insertRestoreTree_ mArgs stackMap (Node b ts) = do
  let l = aBlockName b
      Just s = M.lookup l stackMap
  insertRestoreBlock_ mArgs s b
  mapM_ (insertRestoreTree_ S.empty stackMap) ts
-- }}}

-- mArgs:   entryブロックの場合は引数がすでにレジスタにある
-- stackIn: ブロックの先頭でstackにある変数
insertRestoreBlock_ :: Set Id -> Set Id -> ABlock -> CamlRS ()-- {{{
insertRestoreBlock_ mArgs stackIn (ABlock l stmts) = do

  regSetIn <- do
    preds <- uses predMap_ (M.findWithDefault [] l)
    x <- mapM (\l' -> uses liveOutB_ (uncurry S.union . lookupMapJustNote "" l')) preds
    if null x
      then return S.empty
      else return $ foldl1 S.intersection x

  stackSet_ .= stackIn
  regSet_   .= regSetIn `S.union` mArgs
  Just (stmts_,term) <- unsnoc <$> concatMapM insertRestoreStmt_ stmts

  inReg <- use regSet_
  Just (liveout,liveoutF) <- uses liveOutB_ (M.lookup l)

  restores  <- forM (S.toList $ liveout S.\\ inReg) $ \x -> do
    regSet_ %= S.insert x
    lift $ assignInstId $ Do (ARestore x)

  restoreFs <- forM (S.toList $ liveoutF S.\\ inReg) $ \x -> do
    regSet_ %= S.insert x
    lift $ assignInstId $ Do (AFRestore x)

  addBlock l $ stmts_ ++ restores ++ restoreFs ++ [term]
-- }}}

insertRestoreStmt_ :: Statement -> CamlRS [Statement]-- {{{
insertRestoreStmt_ s = --do
  --lift. $logDebug =<< do {
  --  regset <- use regSet;
  --  stkset <- use stackSet;
  --  return $ show' (fst s) <> ": " <> show' regset <> "\n    " <> show' stkset;
  --  }
  case snd s of
    Do (ASave x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return []
      False -> stackSet_ %= S.insert x >> return [s]

    Do (AFSave x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return []
      False -> stackSet_ %= S.insert x >> return [s]

    -- 使われる変数はregisterにあると考えて良い
    -- 各ブロックの最後にrestoreしているため
    -- TODO restoreしないほうが命令数は減る
    --      registerに無い変数はSSA_Deconstructionでrestoreすべき
    --      つらそう...
    i@(Do APhiV{}) -> do
      let added = S.union (uncurry S.union $ useInst i) (uncurry S.union $ defInst i)
      regSet_ %= S.union added
      return [s]

    inst -> do
      inReg <- use regSet_
      let (used,usedF) = useInst inst
      restores  <- forM (S.toList $ used S.\\ inReg) $ \x -> do
        regSet_ %= S.insert x
        lift $ assignInstId $ Do (ARestore x)
      restoreFs <- forM (S.toList $ usedF S.\\ inReg) $ \x -> do
        regSet_ %= S.insert x
        lift $ assignInstId $ Do (AFRestore x)
      case inst of
        x:=ACall{} -> regSet_ .= S.singleton x
        Do ACall{} -> regSet_ .= S.empty
        x := _     -> regSet_ %= S.insert x
        _          -> return ()
      return $ restores ++ restoreFs ++ [s]
-- }}}

addBlock :: Label -> [Statement] -> CamlRS ()
addBlock l contents = blockMap_ %= M.insert l (ABlock l contents)

-- super tanuki
-- 　 　 _    _
--     （〆⌒ ヽ)
--     ﾐ ´・ω･｀)ﾐ
--　　/ ,..──-､ ヽ
--　 しｌ　 x　）J
-- ___.'､ヽ　 ノ
--(_((_,ノＵ¯Ｕ
--
