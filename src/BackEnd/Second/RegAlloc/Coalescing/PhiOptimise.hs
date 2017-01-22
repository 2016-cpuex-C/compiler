{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc.Coalescing.PhiOptimise (
    phiOpimise
  ) where

import Base hiding (EQ)
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import BackEnd.Second.RegAlloc.Coloring

import qualified Data.Map.Lazy as M
import qualified Data.Set as S
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Data.Maybe    (fromJust, mapMaybe)
import           Control.Arrow (second)
import           Data.List     (delete, maximumBy)
import           Data.Function (on)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type Graph = Map Id (Set Id)
data Entry = Entry Color Graph (Set Id)
  deriving (Show,Eq)
instance Ord Entry where
  Entry c1 g1 s1 `compare` Entry c2 g2 s2 =
    case S.size s1 `compare` S.size s2 of     -- sのサイズが大きいほうが優先
      EQ -> case c2 `compare` c1 of           -- その中で若いレジスタを優先
              EQ -> (s2,g2) `compare` (s1,g1) -- あとは適当
              ne -> ne
      ne -> ne

data CS = CS {
    _colMap_       :: Map Id Color
  , _colMapMod_    :: Map Id Color
  , _interferenceG :: Graph
  , _entryQ        :: Set Entry
  , _pinned_       :: Set Id
  , _candidate_    :: Set Id
  } deriving (Show,Eq,Ord)
makeLenses ''CS

type CamlCS = StateT CS Caml

data OptimiseUnit = OU Id [Id]
  deriving (Show,Eq,Ord)

-------------------------------------------------------------------------------
-- CamlCS
-------------------------------------------------------------------------------

addToQueue :: Entry -> CamlCS ()
addToQueue e@(Entry _ _ _S) = do
  --($logDebug) $ "addToQueue: " <> show' e
  entryQ %= S.insert e

popQueue :: CamlCS (Maybe Entry)
popQueue = do
  q <- use entryQ
  --($logDebug) $ "popQueue" <> show' q
  if null q
    then return Nothing
    else do
      let (x,q') = S.deleteFindMax q
      entryQ .= q'
      ($logDebug) $ "popQueue" <> show' x
      return (Just x)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

-- entryQとcandidateはOptimiseUnitごとに初期化
-- pinnedは全体

--mainRC :: AFunDef -> Caml (Map Id Color)
--mainRC f = do
--  colMap' <- colorFun f
phiOpimise :: AFunDef -> Map Id Color -> Caml (Map Id Color)
phiOpimise f colMap' = do
  g <- interferenceGraph f
  let ous = optimiseUnits f g

  ($logDebug) $ "mainRC: " <> show' (aFunName f)
  ($logDebug) $ "interference graph: " <> show' g
  ($logDebug) $ "optimise unit: "      <> show' ous
  ($logDebug) $ "coloring: "           <> show' colMap'
  r <- runStateT (coalesceSub ous) CS {
          _colMap_       = colMap'
        , _colMapMod_    = M.empty
        , _interferenceG = g
        , _entryQ        = S.empty
        , _pinned_       = S.fromList $ aArgs f ++ aFArgs f
        , _candidate_    = S.empty
        }

  ($logDebugSH) $ snd r ^. colMap_
  return $ snd r ^. colMap_

coalesceSub :: [OptimiseUnit] -> CamlCS ()
coalesceSub ous = forM_ (reverse ous) $ \ou -> do
  ($logDebug) $ "coalesceSub: " <> show' ou
  initRC ou
  testRC ou
  applyRC
  --($logDebugSH) =<< use colMap_

initRC :: OptimiseUnit -> CamlCS ()
initRC ou = do
  entryQ .= S.empty
  mapM_ addToQueue =<< createEntries ou

testRC :: OptimiseUnit -> CamlCS ()
testRC ou = do
  candidate_ .= S.empty
  (colMapMod_ .=) =<< use colMap_
  popQueue >>= \case
    Nothing -> return ()
    Just e@(Entry c _ _)  -> do
      ($logDebug) $ "testRC: " <> show' e
      testSub ou e >>= \case
        Nothing -> return ()
        Just g'  -> do
          let s' = maximumStableSet g'
          addToQueue $ Entry c g' s'
          testRC ou

testSub :: OptimiseUnit -> Entry -> CamlCS (Maybe Graph)
testSub (OU p as) (Entry c g s) = go (filter (`S.member`s) (p:as))
  where
    go [] = return Nothing
    go (u:us) = tryColor u Nothing c >>= \case
      Success -> candidate_ %= S.insert u >> go us
      Candidate v
        | v /= p -> return $ Just $ insertAppendS v u $ insertAppendS u v g -- TODO
      _ -> return $ Just $ insertAppendS u u g

tryColor :: Id -> Maybe Id -> Color -> CamlCS TryResult
tryColor v mu c = do
  --($logDebug) $ "tryColor: " <> show' (v,mu,c)
  colMapMod' <- use colMapMod_
  ifG'       <- use interferenceG
  pinned'    <- use pinned_
  candidate' <- use candidate_
  let c_v = lookupMapNote "" v colMapMod'
  if| c == c_v                -> {- ($logDebug) ("tc ok: " <> show' (v,mu,c)) >> -} return Success
    | v `S.member` pinned'    -> {- ($logDebug) ("tc pn: " <> show' (v,mu,c)) >> -} return (Pinned v)
    | v `S.member` candidate' -> {- ($logDebug) ("tc ca: " <> show' (v,mu,c)) >> -} return (Candidate v)
    | otherwise ->
        let p n = Just n /= mu && c == lookupMapNote "p" n colMapMod'
        in  go c_v $ S.toList $ S.filter p $ lookupMapNote "" v ifG'

  where
    go :: Color -> [Id] -> CamlCS TryResult
    go _ [] = do
      ($logDebug) $ "tryColor Success: " <> show' (v,c)
      colMapMod_ %= M.insert v c
      return Success
    go c_v (n:ns) = tryColor n (Just v) c_v >>= \case
      Success -> go c_v ns
      other   -> return other

data TryResult
  = Success
  | Pinned Id
  | Candidate Id
  | Forbidden Id
  deriving (Show,Eq,Ord)

applyRC :: CamlCS ()
applyRC = do
  --($logDebug) "applyRC"
  candidate' <- use candidate_
  when (S.size candidate' > 1) $ do
    ($logDebug) $ "applying: " <> show' candidate'
    pinned_ %= S.union candidate'
    (colMap_ .=) =<< use colMapMod_

-------------------------------------------------------------------------------
-- are
-------------------------------------------------------------------------------

createEntries :: OptimiseUnit -> CamlCS [Entry]
createEntries ou@(OU p _) = do
  colMap' <- use colMap_
  let (n,nf) = maxColorN colMap'
  case lookupMapNote "" p colMap' of
    R{} -> mapM ((`createEntry` ou) . R) [0..n-1]
    F{} -> mapM ((`createEntry` ou) . F) [0..nf-1]

createEntry :: Color -> OptimiseUnit -> CamlCS Entry
createEntry c (OU p as) = do
  g <- flip inducedSubGraph (S.fromList (p:as)) <$> use interferenceG
  return $ Entry c g (maximumStableSet g)

optimiseUnits :: AFunDef -> Graph -> [OptimiseUnit]
optimiseUnits f c = map (ou c) (phiCols f)
  where
    ou _C (p,as) = OU p $ filter g as
      where g x = x `S.notMember` lookupMapNote "ou" p _C

phiCols :: AFunDef -> [(Id,[Id])]
phiCols f = g =<< aStatements =<< aBody f
  where
    g :: Statement -> [(Id,[Id])]
    g (_, Do (APhiV m)) = map (second (mapMaybe h)) $ transposePhi m
    --g (_, x := AMove y) = [(x,[y])]
    --g (_, x := AFMov y) = [(x,[y])]
    g _ = []
    h (_, PVVar x _ _) = Just x
    h _ = Nothing

maximumStableSet :: Graph -> Set Id
maximumStableSet g = fromJust $ go S.empty (M.keys g)
  where
    go :: Set Id -> [Id] -> Maybe (Set Id)
    go xs ys
      | not (stable xs) = Nothing
      | otherwise =
          let cs = mapMaybe (\(y,ys') -> go (S.insert y xs) ys') (removeEach ys)
          in if null cs
               then Just xs
               else Just $ maximumBy (compare `on` S.size) cs

    stable :: Set Id -> Bool
    stable xs = all p xs
      where p x = S.null $ xs `S.intersection` lookupMapNote "" x g

inducedSubGraph :: Graph -> Set Id -> Graph
inducedSubGraph g xs =
  M.filterWithKey (\x _ -> x `S.member` xs) $ M.map (S.intersection xs) g

removeEach :: Eq a => [a] -> [(a,[a])]
removeEach xs = zip xs $ map (`delete` xs) xs

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

{-
main :: IO ()
main = do
  let hoge = S.fromList [x0,x1,x2,x3,x4]
      x0 = Entry (R 0) (M.fromList [("n.53",S.fromList []),("n.53.tr",S.fromList [])]) (S.fromList ["n.53","n.53.tr"])
      x1 = Entry (R 1) (M.fromList [("n.53",S.fromList []),("n.53.tr",S.fromList [])]) (S.fromList ["n.53","n.53.tr"])
      x2 = Entry (R 2) (M.fromList [("n.53",S.fromList []),("n.53.tr",S.fromList [])]) (S.fromList ["n.53","n.53.tr"])
      x3 = Entry (R 3) (M.fromList [("n.53",S.fromList []),("n.53.tr",S.fromList [])]) (S.fromList ["n.53","n.53.tr"])
      x4 = Entry (R 3) (M.fromList [("n.53",S.fromList ["n.53"]),("n.53.tr",S.fromList [])]) (S.fromList ["n.53.tr"])
      (y0,ys0) = S.deleteFindMax hoge
      (y1,ys1) = S.deleteFindMax ys0
      (y2,ys2) = S.deleteFindMax ys1
      (y3,ys3) = S.deleteFindMax ys2
      (y4,ys4) = S.deleteFindMax ys3
  print y0
  print y1
  print y2
  print y3
  print y4
  print ys4
-}

