{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.SaveAndRestore.NoRename where

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
        mkSave  x = Do (ASave  x x)
        mkSaveF x = Do (AFSave x x)
        saves   = map mkSave xs ++ map mkSaveF ys
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
  regOut' <- lookupMapLensNoteM msg l regOutMap_
  regSet' <- use regSet_
  (liveOut',liveOutF') <- lookupMapLensNoteM msg l liveOutB_
  let toBeRestored = regOut' S.\\ regSet'
  restores  <- mapM restore  $ S.toList $ liveOut'  `S.intersection` toBeRestored
  restoreFs <- mapM restoreF $ S.toList $ liveOutF' `S.intersection` toBeRestored

  -- end
  addBlock l $ stmts' ++ restores ++ restoreFs ++ [term]

insertRestoreStmt :: Statement -> CamlRS [Statement]
insertRestoreStmt s@(id',inst) =
  case inst of
    Do (ASave x _) -> uses stackSet_ (S.member x) >>= \case
      True  -> return [] -- already saved
      False -> stackSet_ %= S.insert x >> return [s]

    Do (AFSave x _) -> uses stackSet_ (S.member x) >>= \case
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

