{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.RegAlloc.Color where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Dominator        (dominatorTree)
import BackEnd.Second.RegAlloc.LivenessAnalysis (livenessAnalysis
                                                ,useInst, defInst)

import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Control.Lens (use,uses,makeLenses)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Monad (forM_, join, when)
import           Data.Bifunctor (bimap)
import           Data.Tree

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type Color = Int

data CS = CS {
    _liveOut :: Map InstId (Set Id, Set Id) -- read only
  , _colMap  :: Map Id Color                -- write only
  , _colMapF :: Map Id Color                -- write only
  , _used    :: Map Id Color
  , _usedF   :: Map Id Color
  , _free    :: [Color]
  , _freeF   :: [Color]
  }
makeLenses ''CS

type CamlCS = StateT CS Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

colorFun :: AFunDef -> Caml (Map Id Color, Map Id Color)
colorFun f@(AFunDef l xs ys _ _) = do
  liveout <- livenessAnalysis f
  s <- execStateT (colorTree (dominatorTree f)) CS {
            _liveOut = liveout

          , _colMap  = M.fromList $ zip xs [0..]
          , _colMapF = M.fromList $ zip ys [0..]

          , _used    = M.fromList $ zip xs [0..]
          , _usedF   = M.fromList $ zip ys [0..]
          , _free    = [length xs..length allRegs-1]
          , _freeF   = [length ys..length allFRegs-1]
          }
  let (x,y) = bimap (max (length xs)) (max (length ys)) $ chromaticNums liveout
      (z,w) = (maxColorN (s^.colMap), maxColorN (s^.colMapF))
  when (x/=z && (x,z)/=(0,1) || y/=w && (y,w)/=(0,1)) $ do
    -- 返り値を捨てる関数があると(0,1)にはなりうるが気にしないで良い
    log $ show l
    log $ show (x,y)
    log $ show (z,w)
    error "RegAlloc: Congratulations! You've found a new bug!"
  return (s^.colMap, s^.colMapF)

maxColorN :: Map Id Color -> Color
maxColorN m = maximum' [ n | (_,n) <- M.toList m ]
  where maximum' [] = 0
        maximum' n  = maximum n + 1

-- 引数の数より小さい場合は正しくないことがある(引数の数が本当の答えかも)
chromaticNums :: Map InstId (Set Id, Set Id) -> (Int,Int)
chromaticNums m = join bimap f $ unzip $ map snd (M.toList m)
  where f = maximum . map S.size

-------------------------------------------------------------------------------
-- Block
-------------------------------------------------------------------------------

colorTree :: Tree ABlock -> CamlCS ()
colorTree (Node (ABlock l insts) bs) = do
  logDebug $ "block: " ++ show l

  forM_ insts $ \(n, inst) -> do
    (liveout, liveoutF) <- uses liveOut (unsafeLookup n)
    (used',   usedF'  ) <- (,) <$> use used <*> use usedF
    (free',   freeF'  ) <- (,) <$> use free <*> use freeF

    let (ds,dsF) = defInst inst
        live  x = x `S.member` liveout
        dead  x = x `S.notMember` liveout
        liveF x = x `S.member` liveoutF
        deadF x = x `S.notMember` liveoutF

    logDebug.init.unlines $ [ "  instid: " ++ show n
                            , "      us:   " ++ show (useInst inst)
                            , "      ds:   " ++ show (ds,dsF)
                            , "      used: " ++ show (used',usedF')
                            , "      free: " ++ show (free',freeF')
                            , "      lout: " ++ show (liveout,liveoutF) ]

    mapM_ remove  $ filter dead  $ M.keys used'
    mapM_ removeF $ filter deadF $ M.keys usedF'

    mapM_ assign  $ S.filter live  ds
    mapM_ assignF $ S.filter liveF dsF

  forM_ bs $ localState . colorTree

-- usedとfreeの状態を復元する
localState :: CamlCS a -> CamlCS a
localState m = do
  usedB  <- use used
  usedFB <- use usedF
  freeB  <- use free
  freeFB <- use freeF
  x <- m
  used  .= usedB
  usedF .= usedFB
  free  .= freeB
  freeF .= freeFB
  return x

-------------------------------------------------------------------------------
-- Nyaaan
-------------------------------------------------------------------------------

assign :: Id -> CamlCS ()
assign x = use free >>= \case
  c:_ -> do free %= tail
            used %= M.insert x c
            colMap %= M.insert x c
            logDebug $ "    assign: " ++ show (x,c)
  [] -> error "color tarinai"

assignF :: Id -> CamlCS ()
assignF x = use freeF >>= \case
  c:_ -> do freeF   %= tail
            usedF   %= M.insert x c
            colMapF %= M.insert x c
            logDebug $ "    assign: " ++ show (x,c)
  [] -> error "color tarinai"

remove :: Id -> CamlCS ()
remove x = uses used (M.lookup x) >>= \case
  Just c  -> do free %= (c:)
                used %= M.delete x
                logDebug $ "    remove: " ++ show (x,c)
  Nothing -> return ()

removeF :: Id -> CamlCS ()
removeF x = uses usedF (M.lookup x) >>= \case
  Just c  -> do freeF %= (c:)
                usedF %= M.delete x
                logDebug $ "    remove: " ++ show (x,c)
  Nothing -> return ()

logDebug :: String -> CamlCS ()
logDebug = const (return ())
{-logDebug = lift.log-}

