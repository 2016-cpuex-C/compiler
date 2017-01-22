{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module BackEnd.Second.RegAlloc.Coloring (
    Color(..)
  , colorFun
  , colorToInt
  , maxColorN
  ) where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import BackEnd.Second.RegAlloc.Dominance

import qualified Data.Map as M
import qualified Data.Set as S
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Data.Tree

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data Color = R Int | F Int
  deriving (Show,Eq,Ord)

colorToInt :: Color -> Int
colorToInt (R n) = n
colorToInt (F n) = n

data CS = CS {
    _liveOut   :: Map InstId (Set Id, Set Id) -- read only
  , _colorMap  :: Map Id Color                -- write only
  , _colorMapF :: Map Id Color                -- write only
  , _used      :: Map Id Color
  , _usedF     :: Map Id Color
  , _free      :: [Color]
  , _freeF     :: [Color]
  }
makeLenses ''CS

type CamlCS = StateT CS Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

colorFun :: AFunDef -> Caml (Map Id Color)
--colorFun f@(AFunDef l xs ys _ _) = withoutLogging $ do
colorFun f@(AFunDef l xs ys _ _) = do
    liveout <- analyzeLifetime f
    s <- execStateT (colorTree (dominatorTree f)) CS {
              _liveOut   = liveout
            , _colorMap  = M.fromList $ zip xs $ map R [0..]
            , _colorMapF = M.fromList $ zip ys $ map F [0..]
            , _used      = M.fromList $ zip xs $ map R [0..]
            , _usedF     = M.fromList $ zip ys $ map F [0..]
            , _free      = map R [length xs..length allRegs-1]
            , _freeF     = map F [length ys..length allFRegs-1]
            }
    let colMap = M.union (s^.colorMap) (s^.colorMapF)
        (x,y) = bimap (max (length xs)) (max (length ys)) $ chromaticN liveout
        (z,w) = maxColorN colMap
    when (x/=z || y/=w ) $ do
      ($logError) "RegAlloc.Coloring"
      ($logErrorSH) l
      ($logErrorSH) (x,y)
      ($logErrorSH) (z,w)
      ($logErrorSH) (s^.colorMap)
      ($logErrorSH) (s^.colorMapF)
      ($logErrorSH) f
      error "RegAlloc: Congratulations! You've found a new bug!"
    --($logDebugSH) l
    ($logDebug)   $ "chromatic number: " <> show' (l,x,y)
    return colMap
 `catchError` \(Failure e) ->
    error $ e ++ "@" ++ show l

maxColorN :: Map Id Color -> (Int,Int)
maxColorN m = (maximum' [ n | (_,R n) <- M.toList m ]
              ,maximum' [ n | (_,F n) <- M.toList m ])
  where maximum' [] = 0
        maximum' n  = maximum n + 1

-- 引数の数より小さい場合は正しくないことがある(引数の数が本当の答えかも)
chromaticN :: Map InstId (Set Id, Set Id) -> (Int,Int)
chromaticN m = join bimap f $ unzip $ map snd (M.toList m)
  where f = maximum . map S.size

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

colorTree :: Tree ABlock -> CamlCS ()
colorTree (Node (ABlock _l stmts) bs) = do
  --($logDebug) $ "block: " <> show' l
  mapM_ colorStmt stmts
  forM_ bs $ localState . colorTree


colorStmt :: Statement -> CamlCS ()
colorStmt (n,inst) = do
    (liveout, liveoutF) <- uses liveOut (lookupMapNote "colorStmt" n)
    (used',   usedF'  ) <- (,) <$> use used <*> use usedF
    --(free',   freeF'  ) <- (,) <$> use free <*> use freeF

    let (ds,dsF) = defInst inst
        dead  x = x `S.notMember` liveout
        deadF x = x `S.notMember` liveoutF

    mapM_ remove  $ filter dead  (M.keys used' )
    mapM_ removeF $ filter deadF (M.keys usedF')

    mapM_ assign  $ ds
    mapM_ assignF $ dsF
    mapM_ remove  $ S.filter dead  ds
    mapM_ removeF $ S.filter deadF dsF
    -- 不要変数削除したら mapM_ assign (S.filter live ds) とかでよい

    -- $logDebug $ pack.init.unlines $
    --   [ "  instid: " ++ show n
    --   , "      us:   " ++ show (useInst inst)
    --   , "      ds:   " ++ show (ds,dsF)
    --   , "      used: " ++ show (used',usedF')
    --   , "      free: " ++ show (free',freeF')
    --   , "      lout: " ++ show (liveout,liveoutF) ]

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

-- 頭から割り当てるのではなく
-- あれを考慮する
assign :: Id -> CamlCS ()
assign x = use free >>= \case
  c:_ -> do free     %= tail
            used     %= M.insert x c
            colorMap %= M.insert x c
            -- $logDebug $ "    assign: " <> show' (x,c)
  [] -> lift $ throwError $ Failure "color tarinai"

assignF :: Id -> CamlCS ()
assignF x = use freeF >>= \case
  c:_ -> do freeF     %= tail
            usedF     %= M.insert x c
            colorMapF %= M.insert x c
            -- $logDebug $ "    assign: " <> show' (x,c)
  [] -> error "color tarinai"

remove :: Id -> CamlCS ()
remove x = uses used (M.lookup x) >>= \case
  Just c  -> do free %= (c:)
                used %= M.delete x
                -- $logDebug $ "    remove: " <> show' (x,c)
  Nothing -> return ()

removeF :: Id -> CamlCS ()
removeF x = uses usedF (M.lookup x) >>= \case
  Just c  -> do freeF %= (c:)
                usedF %= M.delete x
                -- $logDebug $ "    remove: " <> show' (x,c)
  Nothing -> return ()

