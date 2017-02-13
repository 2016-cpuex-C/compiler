{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.SaveAndRestore.Rename where

import Prelude

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import BackEnd.Second.Optimise.Elim
import BackEnd.Second.RegAlloc.Dominance

import qualified Data.Map as M
import qualified Data.Set as S
import           Data.List ((\\))
import           Data.List.Extra (unsnoc)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Monad.Extra (concatMapM)
import           Control.Arrow (second)
import           Data.Maybe (catMaybes)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data RS
  = RS {
    _blockMap_    :: Map Label ABlock
  , _liveOutB_    :: Map Label (Set Id, Set Id)
  , _predMap_     :: Map Label [Label]
  , _stackInMap_  :: Map Label (Set Id)
  , _regInMap_    :: Map Label (Set Id)
  , _regOutMap_   :: Map Label (Set Id)
  , _regSet_      :: Set Id
  , _stackSet_    :: Set Id
  , _renameMapIn_ :: Map (Label,Id) Id
  , _renameMap_   :: Map (Label,Id) Id
  , _renameCnt_   :: Map Id Int
  , _currentBlock_:: Label
  }
makeLenses ''RS
type CamlRS = StateT RS Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

saveAndRestore :: AProg -> Caml AProg
saveAndRestore (AProg fs) = AProg <$> mapM (insertSave >=> insertRestore >=> elimFun) fs

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
    execStateT hoge RS {
      _blockMap_     = blockMap fun
    , _liveOutB_     = liveOutB'
    , _predMap_      = predBlockMap fun
    , _stackInMap_   = stackInMap'
    , _regInMap_     = regInMap'
    , _regOutMap_    = regOutMap'
    , _regSet_       = S.empty
    , _stackSet_     = S.empty
    , _renameMapIn_  = M.empty
    , _renameMap_    = M.empty
    , _renameCnt_    = M.empty
    , _currentBlock_ = undefined
    }
  return fun { aBody = blocks }

  where
    hoge = do
      mapM_ insertRestoreBlock (dominatorTree fun)
      blockMap' <- use blockMap_
      mapM_ renamePhi (M.elems blockMap')

-- 手続き的だなあ
insertRestoreBlock :: ABlock -> CamlRS ()
insertRestoreBlock (ABlock l stmts) = do
  let msg = "insertRestoreBlock: "

  -- initialize
  currentBlock_ .= l
  setRenameMapIn l
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
    Do (ASave _ x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return [] -- already saved
      False -> stackSet_ %= S.insert x >> renameStmt s <&> (:[])

    Do (AFSave _ x) -> uses stackSet_ (S.member x) >>= \case
      True  -> return [] -- already saved
      False -> stackSet_ %= S.insert x >> renameStmt s <&> (:[])

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
      s' <- renameStmt s
      return $ restores ++ restoreFs ++ [s']

restore :: Id -> CamlRS Statement
restore x  = do
  regSet_ %= S.insert x
  x' <- freshNameUpdate x
  lift (assignInstId $ x' := ARestore x)

restoreF :: Id -> CamlRS Statement
restoreF x = do
  regSet_ %= S.insert x
  x' <- freshNameUpdate x
  lift (assignInstId $ x' := AFRestore x)

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
-- renaming
-------------------------------------------------------------------------------

setRenameMapIn :: Label -> CamlRS ()
setRenameMapIn l = lookupMapLensNoteM msg l predMap_ >>= \case
  l':ls -> do
    regIn <- lookupMapLensNoteM msg l regInMap_
    forM_ regIn $ \x -> do
      x' <- if null ls
              then findWithDefaultLensM x (l',x) renameMap_
              else freshName x
      renameMapIn_ %= M.insert (l,x) x'
      renameMap_   %= M.insert (l,x) x'
  [] -> return ()
  where
    msg = "renameMapIn:" ++ show l

freshName :: Id -> CamlRS Id
freshName x = do
  n <- findWithDefaultLensM 0 x renameCnt_
  renameCnt_ %= M.insert x (n+1)
  return $ x++".."++show n

freshNameUpdate :: Id -> CamlRS Id
freshNameUpdate x = do
  x' <- freshName x
  l  <- use currentBlock_
  renameMap_ %= M.insert (l,x) x'
  return x'

renameStmt :: Statement -> CamlRS Statement
renameStmt (id',inst) = do
  l <- use currentBlock_
  renameMap' <- use renameMap_
  let f  x = M.findWithDefault x (l,x) renameMap'
      f' (C i) = C i
      f' (V x) = V (f x)
      g e = case e of-- {{{
        AMove x     -> AMove (f x)
        ANeg  x     -> ANeg  (f x)
        AAdd x y'   -> AAdd  (f x) (f' y')
        ASub x y'   -> ASub  (f x) (f' y')
        AMul x y'   -> AMul  (f x) (f' y')
        ADiv x y'   -> ADiv  (f x) (f' y')
        ASll x y'   -> ASll  (f x) (f' y')
        ASrl x y'   -> ASrl  (f x) (f' y')
        AAnd x y'   -> AAnd  (f x) (f' y')
        AOr  x y'   -> AOr   (f x) (f' y')
        AXor x y'   -> AXor  (f x) (f' y')
        ALd  x y'   -> ALd   (f x) (f' y')
        ASt  x y z' -> ASt   (f x) (f y) (f' z')
        ASti x i    -> ASti  (f x) i

        AFMov x      -> AFMov (f x)
        AFNeg x      -> AFNeg (f x)
        AFAdd x y    -> AFAdd (f x) (f  y)
        AFSub x y    -> AFSub (f x) (f  y)
        AFMul x y    -> AFMul (f x) (f  y)
        AFDiv x y    -> AFDiv (f x) (f  y)
        AFLd  x y'   -> AFLd  (f x) (f' y')
        AFSt  x y z' -> AFSt  (f x) (f y) (f' z')
        AFSti x i    -> AFSti (f x) i

        ACmp p x y' -> ACmp p (f x) (f' y')
        AFCmp p x y -> AFCmp p (f x) (f y)
        ASwap x y   -> ASwap (f x) (f y)
        AFSwap x y  -> AFSwap (f x) (f y)

        ACall t l' xs ys -> ACall t l' (map f xs) (map f ys)
        ASelect t x y z  -> ASelect t (f x) (f y) (f z)
        ASave  x_ x -> ASave  (f x_) x
        AFSave x_ x -> AFSave (f x_) x
        -- restoreはオッケー (そもそもここにはこないけど)
        AStHP x y'  -> AStHP (f x) (f' y')
        AFStHP x y' -> AFStHP (f x) (f' y')
        AIncHP x'   -> AIncHP (f' x')
        ATailCall t l' xs ys -> ATailCall t l' (map f xs) (map f ys)
        ARet t (Just x') -> ARet t (Just (f' x'))
        ACBr x lt lf -> ACBr (f x) lt lf
        ASwitch x ld ils -> ASwitch (f x) ld ils
        ACmpBr  p x y' lt lf -> ACmpBr  p (f x) (f' y') lt lf
        AFCmpBr p x y  lt lf -> AFCmpBr p (f x) (f y)   lt lf
        APrim l' t xs' ys -> APrim l' t (map f' xs') (map f ys)
        ARestore{}  -> error $ show e
        AFRestore{} -> error $ show e
        _ -> e-- }}}
  case inst of
    x:=e -> return (id', f x := g e)
    Do e -> return (id', Do $ g e)

renamePhi :: ABlock -> CamlRS ()
renamePhi b@(ABlock l stmts) = do
  currentBlock_ .= l
  new <- catchError (addPhi b) $ \err -> do
          ($logError) "renamePhi: addPhi"
          ($logError) $ "at block " <> show' b
          ($logError) $ "err message: " <> show' err
          ($logErrorSH) =<< use liveOutB_
          throwError $ Failure "_"
  case head stmts of
    (id', Do (APhiV are)) -> do
      are' <- forM are $ \(lp,xvs) -> do
        xvs' <- forM xvs $ \(x,v) -> case v of
          PVVar y t False -> do
            y' <- findWithDefaultLensM y (lp,y) renameMap_
            return (x,PVVar y' t False)
          _ -> return (x,v)
        return (lp,xvs')
      let are'' = mergePhiBody are' new
          phi = (id', Do (APhiV are''))
      addBlock l (phi:tail stmts)

    _ -> do
      phi <- lift $ assignInstId $ Do (APhiV new)
      unless (null new) $ addBlock l (phi:stmts)

addPhi :: ABlock -> CamlRS [(Label,[(Id,PhiVal)])]
addPhi (ABlock l _) = do
  preds <- lookupMapLensNoteM "addPhi" l predMap_
  if (length preds > 1) then do
    regIn <- lookupMapLensNoteM "nnn" l regInMap_
    forM preds $ \lp -> do
      xvs <- forM (S.toList regIn) $ \x -> do
          t   <- typeOf lp x
          xl  <- lookupMapLensNoteM "mmm" (l, x) renameMapIn_
          xlp <- findWithDefaultLensM x (lp,x) renameMap_
          return $ Just (xl,PVVar xlp t False) -- TODO
        `catchError` \_ ->
          return Nothing
          -- なんでこれでいいんだっけ (ちゃんとログ残しとけばか)
      return (lp, catMaybes xvs)
  else
    return []

  where
    -- 汚い 別の形で情報を持たせたい
    -- あと勝手にTIntにしていいのかしらという問題も
    typeOf :: Label -> Id -> CamlRS Type
    typeOf lp x = do
      (s,sf) <- lookupMapLensNoteM "addPhi: typeOf" lp liveOutB_
      if| x `S.member` s  -> return TInt
        | x `S.member` sf -> return TFloat
        | otherwise       -> throwError $ Failure $ "addPhi: typeOf" ++ show (x,l,lp,s,sf)

mergePhiBody :: [(Label,[(Id,PhiVal)])]
             -> [(Label,[(Id,PhiVal)])]
             -> [(Label,[(Id,PhiVal)])]
mergePhiBody a [] = a
mergePhiBody a b  = map f a
  where
    f (l,xvs) = (l, lookupJustNote "mergePhiBody" l b++xvs)

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

