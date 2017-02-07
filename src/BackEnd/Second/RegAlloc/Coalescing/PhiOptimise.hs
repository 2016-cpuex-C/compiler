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
import           Data.Maybe    (fromJust, mapMaybe, maybeToList)
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
  entryQ %= S.insert e

popQueue :: CamlCS (Maybe Entry)
popQueue = do
  q <- use entryQ
  if null q
    then return Nothing
    else do
      let (x,q') = S.deleteFindMax q
      entryQ .= q'
      return (Just x)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

phiOpimise :: AFunDef -> Map Id Color -> Set Id -> Caml (Map Id Color)
phiOpimise f colMap' prePinned = do
  g <- interferenceGraph f
  let ous = optimiseUnits f g
  r <- runStateT (coalesceSub ous) CS {
          _colMap_       = colMap'
        , _colMapMod_    = M.empty
        , _interferenceG = g
        , _entryQ        = S.empty
        , _pinned_       = S.fromList (aArgs f ++ aFArgs f) `S.union` prePinned
        , _candidate_    = S.empty
        }

  return $ snd r ^. colMap_

coalesceSub :: [OptimiseUnit] -> CamlCS ()
coalesceSub ous = forM_ (reverse ous) $ \ou -> do
  initRC ou
  testRC ou
  applyRC

initRC :: OptimiseUnit -> CamlCS ()
initRC ou = do
  entryQ .= S.empty
  ous <- createEntries ou
  mapM_ addToQueue ous

testRC :: OptimiseUnit -> CamlCS ()
testRC ou = do
  candidate_ .= S.empty
  (colMapMod_ .=) =<< use colMap_
  popQueue >>= \case
    Nothing -> return ()
    Just e@(Entry c _ _)  -> do
      testSub ou e >>= \case
        Nothing -> return ()
        Just g'  -> do
          let s' = maximumStableSet g'
          addToQueue $ Entry c g' s'
          testRC ou

testSub :: OptimiseUnit -> Entry -> CamlCS (Maybe Graph)
testSub _ou@(OU p as) _e@(Entry c g s) = do
  go (filter (`S.member`s) (p:as))
  where
    go us' = do
      case us' of
        []     -> return Nothing
        (u:us) -> tryColor u Nothing c >>= \case
            Success -> candidate_ %= S.insert u >> go us
            Candidate v
              | v /= p -> return $ Just $ insertAppendS v u $ insertAppendS u v g -- TODO
            _ -> return $ Just $ insertAppendS u u g

tryColor :: Id -> Maybe Id -> Color -> CamlCS TryResult
tryColor v mu c = do
  colMapMod' <- use colMapMod_
  ifG'       <- use interferenceG
  pinned'    <- use pinned_
  candidate' <- use candidate_
  let c_v = lookupMapNote "" v colMapMod'
  if| c == c_v                -> return Success
    | v `S.member` pinned'    -> return (Pinned v)
    | v `S.member` candidate' -> return (Candidate v)
    | otherwise ->
        let p n = Just n /= mu && c == lookupMapNote "tryColor" n colMapMod'
        in  go c_v $ S.toList $ S.filter p $ lookupMapNote "tryColor" v ifG'

  where
    go :: Color -> [Id] -> CamlCS TryResult
    go _ [] = do
      colMapMod_ %= M.insert v c
      return Success
    go c_v (n:ns) = do
      tryColor n (Just v) c_v >>= \case
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
  candidate' <- use candidate_
  when (S.size candidate' > 1) $ do
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
createEntry c _ou@(OU p as) = do
  g <- flip inducedSubGraph (S.fromList (p:as)) <$> use interferenceG
  let s = maximumStableSet g
  return $ Entry c g s

optimiseUnits :: AFunDef -> Graph -> [OptimiseUnit]
optimiseUnits f c = map ou (phiCols f)
  where
    ou (p,as) = OU p $ filter g as
      where g x = x /= p && x `S.notMember` M.findWithDefault S.empty p c
      -- x <- phi (x1,...,xn)  (x==xi for some i)
      -- みたいなものがありえるので x /= p が必要

phiCols :: AFunDef -> [(Id,[Id])]
phiCols f = g =<< aStatements =<< aBody f
  where
    g :: Statement -> [(Id,[Id])]
    g (_, Do (APhiV m)) = map (second (mapMaybe (h.snd))) $ transposePhi m
    g (_, Do (APhiS m)) = map (second (maybeToList.h)) m
    g _ = []
    h (PVVar x _ _) = Just x
    h _ = Nothing

-- 指数時間なので辛い
maximumStableSet :: Graph -> Set Id
maximumStableSet g = fromJust $ go (S.fromList obvious) rest
  where
    -- これをやらないと時間的に死ぬ(死んだ)
    (obvious,rest) = both M.keys $ M.partition null g

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

    removeEach :: Eq a => [a] -> [(a,[a])]
    removeEach xs = zip xs $ map (`delete` xs) xs

inducedSubGraph :: Graph -> Set Id -> Graph
inducedSubGraph g xs =
  M.filterWithKey (\x _ -> x `S.member` xs) $ M.map (S.intersection xs) g

