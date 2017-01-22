{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
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
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Monad.Extra (concatMapM)
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
  AProg <$> mapM virtualFunDef fundefs

virtualFunDef :: AFunDef -> Caml AFunDef
virtualFunDef f@(AFunDef _ _ _ blocks _) = do
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

saveAndRestore :: AProg -> Caml AProg
saveAndRestore (AProg fs) = AProg <$> mapM (insertSave >=> insertRestore) fs

----------
-- Save --
----------

insertSave :: AFunDef -> Caml AFunDef
insertSave fun@(AFunDef _ _ _ blocks _) = do
  liveOut' <- analyzeLifetime fun
  blocks' <- mapM (insertSaveB liveOut') blocks
  return fun { aBody = blocks' }

insertSaveB :: Map InstId (Set Id, Set Id) -> ABlock -> Caml ABlock
insertSaveB liveOut' b@(ABlock _ insts) = do
  insts' <- concatMapM (insertSaveS liveOut') insts
  return b { aStatements = insts' }

insertSaveS :: Map InstId (Set Id, Set Id)
            -> Statement -> Caml [Statement]
insertSaveS liveOut' inst@(n,i) = case i of
  Do ACall{}         -> insertSaveSSub inst Nothing
  x := ACall t _ _ _ -> insertSaveSSub inst (Just (x,t))
  _ -> return [inst]

  where
    (live,liveF)  = lookupMapNote ("insertSaveI: live: "++show inst) n liveOut'
    insertSaveSSub inst' mx = do
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
      True  -> return [] -- already saved
      False -> stackSet_ %= S.insert x >> return [s]

    Do (AFSave x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return [] -- already saved
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

restore :: Id -> CamlRS Statement
restore x  = regSet_ %= S.insert x >> lift (assignInstId $ Do (ARestore x))

restoreF :: Id -> CamlRS Statement
restoreF x = regSet_ %= S.insert x >> lift (assignInstId $ Do (AFRestore x))

hogePhiVal :: (Label, [(Id,PhiVal)]) -> CamlRS (Label, [(Id,PhiVal)])
hogePhiVal (l,xvs) = do
  regOut' <- lookupMapLensNoteM "hogePhiVal: " l regOutMap_
  let f (PVVar x t _)
        | x `S.member` regOut' = PVVar x t False -- on register
        | otherwise            = PVVar x t True  -- on memory
      f v = v
  return (l, map (second f) xvs)

addBlock :: Label -> [Statement] -> CamlRS ()
addBlock l contents = blockMap_ %= M.insert l (ABlock l contents)

-------------------------------------------------------------------------------
-- Primitives
-------------------------------------------------------------------------------

-- libmincaml.mlで実装したほうが効率が良かった
prim :: AFunDef -> Caml AFunDef
prim f = return f { aBody = map primBlock (aBody f) }

primBlock :: ABlock -> ABlock
primBlock b = b { aStatements = map primStmt (aStatements b) }

primStmt :: Statement -> Statement
primStmt = second primInst

primInst :: Inst -> Inst
primInst = \case
  x := ACall _ (Label "min_caml_sqrt")  [] [y]        -> x := APrim (Label "sqrt")    (TFun [TFloat] TFloat) [] [y]
  x := ACall _ (Label "min_caml_floor") [] [y]        -> x := APrim (Label "floor")   (TFun [TFloat] TFloat) [] [y]
  --x := ACall _ (Label "min_caml_int_of_float") [] [y] -> x := APrim (Label "ftoi")    (TFun [TInt] TFloat)   [] [y]
  --x := ACall _ (Label "min_caml_float_of_int") [y] [] -> x := APrim (Label "itof")    (TFun [TInt] TFloat) [V y] []
  i -> i

