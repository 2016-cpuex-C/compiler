{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.Analysis.Lifetime (
    analyzeLifetime
  , analyzeLifetimeB
  , interferenceGraph
  ) where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis.Base

import           Prelude hiding (log,succ)
import qualified Data.Map as M
import qualified Data.Set as S
import           Control.Monad.Trans.State
import           Control.Lens.Operators

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data LA = LA {
    _succMap_ :: Map InstId [InstId]
  , _instMap_ :: Map InstId (Label, Inst)
  , _liveOut_ :: Map InstId (Set Id, Set Id)
  } deriving Show
makeLenses ''LA

type CamlLA = StateT LA Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

interferenceGraph :: AFunDef -> Caml (Map Id (Set Id))
interferenceGraph f = toG <$> analyzeLifetime f
  where
    toG :: Map InstId (Set Id, Set Id) -> Map Id (Set Id)
    toG liveOut' = foldl' g M.empty (M.elems liveOut')
    g :: Map Id (Set Id) -> (Set Id, Set Id) -> Map Id (Set Id)
    g m (s,s_f) = foldl' h m (xs++xs_f)
      where
        h :: Map Id (Set Id) -> (Id, Set Id) -> Map Id (Set Id)
        h m' (x',s') = insertAppendSetS x' s' m'
        xs   = map (\x -> (x, S.delete x s  )) $ S.toList s
        xs_f = map (\x -> (x, S.delete x s_f)) $ S.toList s_f

-- inst単位
analyzeLifetime :: AFunDef -> Caml (Map InstId (Set Id, Set Id))
analyzeLifetime f =
  view liveOut_ <$> execStateT analyzeLifetimeSub LA {
      _instMap_ = instMap f
    , _succMap_ = succMap f
    , _liveOut_ = M.empty
  }

-- block単位
analyzeLifetimeB :: AFunDef -> Caml (Map Label (Set Id, Set Id))
analyzeLifetimeB fun = do
  liveOut' <- analyzeLifetime fun
  return $ M.fromList $ do
    b <- aBody fun
    let l = aBlockName b
        lastId = fst $ lastStmt b
        lives = lookupMapNote "liveOutB" lastId liveOut'
    return (l,lives)

analyzeLifetimeSub :: CamlLA ()
analyzeLifetimeSub = do
  liveOutOld <- use liveOut_
  mapM_ update =<< uses instMap_ M.keys
  liveOutNew <- use liveOut_
  unless (liveOutNew==liveOutOld) analyzeLifetimeSub

update :: InstId -> CamlLA ()
update n = do
  Just succs <- uses succMap_ (M.lookup n)
  new <- next n succs
  liveOut_ %= M.insert n new

next :: InstId -> [InstId] -> CamlLA (Set Id, Set Id)
next n succs = unions2 <$> mapM f succs
  where f m = union2 <$> use' n m <*> (difference2 <$> out' m <*> def' m)

-------------------------------------------------------------------------------
-- Successor Map
-------------------------------------------------------------------------------

succMap :: AFunDef -> Map InstId [InstId]
succMap f
  | isEmptyFun f = M.empty
  | otherwise    = execState (succMapSub (entryBlock f)) M.empty
  where
    bmap = blockMap f
    succMapSub b@(ABlock _ stmts) = go stmts
      where
        go ~((n,_):rest) = gets (M.member n) >>= \case
          False
            | null rest -> do
                let succBlocks  = [ lookupMapNote "succMap" l' bmap
                                  | l' <- nextBlockNames b ]
                    succInstIds = map firstInstId succBlocks
                modify $ M.insert n succInstIds
                mapM_ succMapSub succBlocks
            | otherwise -> do
                modify $ M.insert n [fst $ head rest]
                go rest
          True  -> return ()

        firstInstId = fst.firstStmt

-------------------------------------------------------------------------------
-- Instruction Map
-------------------------------------------------------------------------------

instMap :: AFunDef -> Map InstId (Label, Inst)
instMap (AFunDef _ _ _ blocks _) = M.unions $ map instMapSub blocks
  where
    instMapSub :: ABlock -> Map InstId (Label, Inst)
    instMapSub (ABlock b insts) = M.fromList [ (n, (b,i)) | (n,i) <- insts ]

-------------------------------------------------------------------------------
-- small
-------------------------------------------------------------------------------

blockOfInst :: InstId -> CamlLA Label
blockOfInst n = uses instMap_ (fst. lookupMapNote msg n)
  where msg = "Analysis.Lifetime.blockOfInst: " ++ show n

out' :: InstId -> CamlLA (Set Id, Set Id)
out' n = uses liveOut_ (M.findWithDefault (S.empty,S.empty) n)

def' :: InstId -> CamlLA (Set Id, Set Id)
def' n = defInst <$> uses instMap_ (snd. lookupMapNote msg n)
  where msg = "Analysis.Lifetime.def': " ++ show n

-- Variables used in instruction `m` after the execution of `n`
-- (phi function uses different variables dependent on its predecessor)
-- (nande kokodake eigo yanen)
use' :: InstId -> InstId -> CamlLA (Set Id, Set Id)
use' n m = uses instMap_ (snd. lookupMapNote msg m) >>= useInst'
  where
    msg = "use'" ++ show (n,m)

    useInst' :: Inst -> CamlLA (Set Id, Set Id)
    useInst' (Do (APhiV ps)) = do
      b <- blockOfInst n
      let xvs = case lookup b ps of
                  Just hoge -> hoge
                  Nothing   -> error $ "use': " ++ show (n,b,ps)

      return (S.fromList [ y | (_, PVVar y t _) <- xvs, t /= TFloat ]
             ,S.fromList [ y | (_, PVVar y t _) <- xvs, t == TFloat ])

    useInst' inst = return $ useInst inst

