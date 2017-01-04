{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.Analysis.Lifetime (
    analyzeLifetime
  , analyzeLifetimeB
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
    _succMap :: Map InstId [InstId]
  , _instMap :: Map InstId (Label, Inst)
  , _liveOut :: Map InstId (Set Id, Set Id)
  } deriving Show
makeLenses ''LA

type CamlLA = StateT LA Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

-- inst単位
analyzeLifetime :: AFunDef -> Caml (Map InstId (Set Id, Set Id))
analyzeLifetime f =
  view liveOut <$> execStateT analyzeLifetimeSub LA {
      _instMap = getInstMap f
    , _succMap = getSuccMap f
    , _liveOut = M.empty
  }

-- block単位
analyzeLifetimeB :: AFunDef -> Caml (Map Label (Set Id, Set Id))
analyzeLifetimeB fun = do
  liveOut' <- analyzeLifetime fun
  return $ M.fromList $ do
    b <- aBody fun
    let l = aBlockName b
        lastId = fst $ lastStmt b
        lives = lookupMapJustNote "liveOutB" lastId liveOut'
    return (l,lives)

analyzeLifetimeSub :: CamlLA ()
analyzeLifetimeSub = do
  liveOutOld <- use liveOut
  mapM_ update =<< uses instMap M.keys
  liveOutNew <- use liveOut
  unless (liveOutNew==liveOutOld) analyzeLifetimeSub

update :: InstId -> CamlLA ()
update n = do
  Just succs <- uses succMap (M.lookup n)
  new <- next n succs
  liveOut %= M.insert n new

next :: InstId -> [InstId] -> CamlLA (Set Id, Set Id)
next n succs = unions2 <$> mapM f succs
  where f m = union2 <$> use' n m <*> (difference2 <$> out' m <*> def' m)

-------------------------------------------------------------------------------
-- Successor Map
-------------------------------------------------------------------------------

-- TODO 名前変更 (getだとStateっぽい)
getSuccMap :: AFunDef -> Map InstId [InstId]
getSuccMap f
  | isEmptyFun f = M.empty
  | otherwise    = execState (getSuccMapSub (entryBlock f)) M.empty
  where
    bmap = blockMap f
    getSuccMapSub b@(ABlock _ stmts) = go stmts
      where
        go ~((n,_):rest) = gets (M.member n) >>= \case
          False
            | null rest -> do
                let tmpf l = fromJustNote ("tmpf: " ++ show (l,f,bmap)) $ M.lookup l bmap
                    succBlocks  = map tmpf (nextBlockNames b)
                                -- [ b' | ~(Just b') <- map (`M.lookup` bmap) (nextBlockNames b) ]
                                -- map (`unsafeLookup` bmap) (nextBlockNames b)
                    succInstIds = map firstInstId succBlocks
                modify $ M.insert n succInstIds
                mapM_ getSuccMapSub succBlocks
            | otherwise -> do
                modify $ M.insert n [fst $ head rest]
                go rest
          True  -> return ()

        firstInstId = fst.firstStmt

-------------------------------------------------------------------------------
-- Instruction Map
-------------------------------------------------------------------------------

-- TODO 名前変更 (getだとStateっぽい)
getInstMap :: AFunDef -> Map InstId (Label, Inst)
getInstMap (AFunDef _ _ _ blocks _) = M.unions $ map instMapSub blocks
  where
    instMapSub :: ABlock -> Map InstId (Label, Inst)
    instMapSub (ABlock b insts) = M.fromList [ (n, (b,i)) | (n,i) <- insts ]

-------------------------------------------------------------------------------
-- small
-------------------------------------------------------------------------------

blockOfInst :: InstId -> CamlLA Label
blockOfInst n = uses instMap (fst.fromJustNote msg.M.lookup n)
  where msg = "Analysis.Lifetime.blockOfInst: " ++ show n

out' :: InstId -> CamlLA (Set Id, Set Id)
out' n = uses liveOut (M.findWithDefault (S.empty,S.empty) n)

def' :: InstId -> CamlLA (Set Id, Set Id)
def' n = defInst <$> uses instMap (snd.fromJustNote msg.M.lookup n)
  where msg = "Analysis.Lifetime.def': " ++ show n

-- Variables used in instruction `m` after the execution of `n`
-- (phi function uses different variables dependent on its predecessor)
-- (nande kokodake eigo yanen)
use' :: InstId -> InstId -> CamlLA (Set Id, Set Id)
use' n m = uses instMap (snd.fromJustNote msg.M.lookup m) >>= useInst'
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

