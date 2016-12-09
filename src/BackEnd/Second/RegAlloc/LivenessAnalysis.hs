{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.RegAlloc.LivenessAnalysis where

import Base
import BackEnd.Second.Asm

import           Prelude hiding (log,succ)
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Control.Monad.Trans.State
import           Control.Lens (use,uses,view,makeLenses)
import           Control.Lens.Operators
import           Control.Monad (unless)
import           Data.Bifunctor (bimap)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data LA = LA {
    _succMap      :: Map InstId [InstId]
  , _instMap      :: Map InstId (Label, Named AInst)
  , _liveOut      :: Map InstId (Set Id, Set Id)
  } deriving Show
makeLenses ''LA
type CamlLA = StateT LA Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

livenessAnalysis :: AFunDef -> Caml (Map InstId (Set Id, Set Id))
livenessAnalysis f =
  view liveOut <$> execStateT livenessAnalysisSub LA {
        _instMap = getInstMap f
      , _succMap = getSuccMap f
      , _liveOut = M.empty
    }

livenessAnalysisSub :: CamlLA ()
livenessAnalysisSub = do
  liveOutOld <- use liveOut
  mapM_ update =<< uses instMap M.keys
  liveOutNew <- use liveOut
  unless (liveOutNew==liveOutOld) livenessAnalysisSub

update :: InstId -> CamlLA ()
update n = do
  succs <- uses succMap (unsafeLookup n)
  new <- next n succs
  liveOut %= M.insert n new

next :: InstId -> [InstId] -> CamlLA (Set Id, Set Id)
next n succs = unions2 <$> mapM f succs
  where f m = union2 <$> use' n m <*> (difference2 <$> out' m <*> def' m)

-------------------------------------------------------------------------------
-- Get Successor Map
-------------------------------------------------------------------------------

getSuccMap :: AFunDef -> Map InstId [InstId]
getSuccMap f
  | isEmptyFun f = M.empty
  | otherwise    = execState (getSuccMapSub (entryBlock f)) M.empty
  where
    bmap = blockMap f
    getSuccMapSub b@(ABlock _ insts) = go insts
      where
        go ~((n,_):rest) = gets (M.member n) >>= \case
          False
            | null rest -> do
                let succBlocks = map (`unsafeLookup` bmap) (nextBlockNames b)
                modify $ M.insert n (map firstInstId succBlocks)
                mapM_ getSuccMapSub succBlocks
            | otherwise -> do
                modify $ M.insert n [fst $ head rest]
                go rest
          True  -> return ()

        firstInstId = fst.head.ablockContents


-------------------------------------------------------------------------------
-- Get Instruction Map
-------------------------------------------------------------------------------

-- 名前が良くない
getInstMap :: AFunDef -> Map InstId (Label, Named AInst)
getInstMap (AFunDef _ _ _ blocks _) = M.unions $ map instMapSub blocks
  where
    instMapSub :: ABlock -> Map InstId (Label, Named AInst)
    instMapSub (ABlock b insts) = M.fromList [ (n, (b,i)) | (n,i) <- insts ]

-------------------------------------------------------------------------------
-- small
-------------------------------------------------------------------------------

blockOfInst :: InstId -> CamlLA Label
blockOfInst n = uses instMap (fst.unsafeLookup n)

out' :: InstId -> CamlLA (Set Id, Set Id)
out' n = uses liveOut (M.findWithDefault (S.empty,S.empty) n)

def' :: InstId -> CamlLA (Set Id, Set Id)
def' n = defInst <$> uses instMap (snd.unsafeLookup n)

-- Variables used in instruction m after the execution of n
-- (phi function uses different variables dependent on its predecessor)
use' :: InstId -> InstId -> CamlLA (Set Id, Set Id)
use' n m = uses instMap (snd.unsafeLookup m) >>= useInst'
  where
    useInst' :: Named AInst -> CamlLA (Set Id, Set Id)
    useInst' (Do (APhiV ps)) = do
      b <- blockOfInst n
      let Just xvs = lookup b ps
      return (S.fromList [ y | (_, PVVar (y, t))      <- xvs, t /= TFloat ]
             ,S.fromList [ y | (_, PVVar (y, TFloat)) <- xvs])
    useInst' inst = return $ useInst inst

defInst :: Named AInst -> (Set Id, Set Id)
defInst (Do (APhiV ps)) =
    (S.fromList [ x | (x,v) <- concatMap snd ps, not (isFloat v)]
    ,S.fromList [ x | (x,v) <- concatMap snd ps, isFloat v])
  where
    isFloat PVFloat{}          = True
    isFloat (PVVar (_,TFloat)) = True
    isFloat _                  = False
defInst Do{} = (S.empty, S.empty)
defInst (x:=i) | float i   = (S.empty, S.singleton x)
               | otherwise = (S.singleton x, S.empty)
  where
    float = \case-- {{{
      ASetF {} -> True
      AFMov {} -> True
      AFAdd {} -> True
      AFSub {} -> True
      AFMul {} -> True
      AFDiv {} -> True
      AFLd  {} -> True
      AFLdi {} -> True
      ACallDir TFloat _ _ _ -> True
      ASelect  TFloat _ _ _ -> True
      _ -> False
-- }}}

useInst :: Named AInst -> (Set Id, Set Id)
useInst = \case
    (Do i) -> fromList2 $ g i
    (_:=i) -> fromList2 $ g i
  where
    h C{} = [] -- {{{
    h (V x) = [x]
    g :: AInst -> ([Id],[Id])
    g i = case i of
      ANop             -> ([],[])
      ASet{}           -> ([],[])
      ASetF{}          -> ([],[])
      ASetL{}          -> ([],[])
      ALdi{}           -> ([],[])
      AFLdi{}          -> ([],[])
      ABr{}            -> ([],[])
      ASti x _         -> ([x],[])
      AFSti x _        -> ([],[x])
      AMove x          -> ([x],[])
      ACBr x _ _       -> ([x],[])
      ASwitch x _ _    -> ([x],[])
      AFMov x          -> ([],[x])
      AFAdd x y        -> ([],[x,y])
      AFSub x y        -> ([],[x,y])
      AFMul x y        -> ([],[x,y])
      AFDiv x y        -> ([],[x,y])
      AFCmp _ x y      -> ([],[x,y])

      AAdd x y'        -> (x : h y', [])
      ASub x y'        -> (x : h y', [])
      AMul x y'        -> (x : h y', [])
      ADiv x y'        -> (x : h y', [])
      ACmp  _ x y'     -> (x : h y', [])
      ASll    x y'     -> (x : h y', [])
      ASrl    x y'     -> (x : h y', [])
      AAnd    x y'     -> (x : h y', [])
      AOr     x y'     -> (x : h y', [])
      AXor    x y'     -> (x : h y', [])
      ALd   x y'       -> (x : h y', [])
      AFLd  x y'       -> (x : h y', [])
      ASt   x y z'     -> (x : y : h z', [])
      AFSt  x y z'     -> (y : h z', [x])

      APtr x y'        -> (x : concatMap h y', [])
      APtrG _ y'       -> (concatMap h y', [])

      AGetHP      -> ([],[])
      AStHP x y'  -> (x : h y',[])
      AFStHP x y' -> (h y', [x])
      AIncHP x'   -> (h x',[])

      ACallDir _ _ xs ys -> (xs,ys)

      ASelect TFloat x y' z' -> ([x], h y' ++ h z')
      ASelect _      x y' z' -> (x : h y' ++ h z', [])
      ARet _ Nothing         -> ([],[])
      ARet TFloat (Just x')  -> ([],h x')
      ARet _      (Just x')  -> (h x',[])

      APhi{} -> error "Impossible: APhi should have already been removed"
      APhiV ps -> ([ y | (_, PVVar (y, t)) <- concatMap snd ps, t/=TFloat ]
                  ,[ y | (_, PVVar (y, TFloat)) <- concatMap snd ps])
      --}}}

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

fromList2 :: ([Id], [Id]) -> (Set Id, Set Id)
fromList2 = bimap S.fromList S.fromList

unions2 :: [(Set Id, Set Id)] -> (Set Id, Set Id)
unions2 = bimap S.unions S.unions . unzip

union2 :: (Set Id, Set Id) -> (Set Id, Set Id) -> (Set Id, Set Id)
union2 = lift2 S.union

difference2 :: (Set Id, Set Id) -> (Set Id, Set Id) -> (Set Id, Set Id)
difference2 = lift2 S.difference

lift2 :: (a -> b -> c) -> (a, a) -> (b, b) -> (c, c)
lift2 f (x1,x2) (y1,y2) = (f x1 y1, f x2 y2)

