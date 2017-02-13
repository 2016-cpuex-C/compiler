{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE TemplateHaskell #-}
-- http://sigma425.hatenablog.com/entry/2015/12/25/224053 の移植

module BackEnd.Second.RegAlloc.Dominance.Pure where

import           Base
import           Control.Lens (Lens')
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import qualified Data.Map as M
import           Data.Tree

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type VertexId = Int

data Graph v = Graph {
    _preds :: Map v [v] -- 辺
  , _succs :: Map v [v] -- 逆辺
  , _start :: v
  } deriving (Show,Eq)
makeLenses ''Graph

data DS v = DS {
    _graph     :: Graph v

  , _parent    :: Map v v        -- dfs木Tに於けるvの親
  , _idom      :: Map v v        -- idomID
  , _semi      :: Map v VertexId -- sdom(v)のid (求める前はvのid)
  , _vertex    :: Map VertexId v -- idからvertexを求める
  , _bucket    :: Map v [v]      -- bucket
  , _cor1_u    :: Map v v        -- Cor1のu
  , _idCnt     :: VertexId

    -- union find用
  , _parentsUF :: Map v v        -- UnionFindでの親的なやつ
  , _mn        :: Map v v
  }
makeLenses ''DS

type Dom v = State (DS v)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

dominatorTree :: (Show v, Ord v) => v -> [v] -> [(v,v)] -> Tree v
dominatorTree r vs es = mapToTree r $ evalState idomMap (mkInitialState r vs es)

-------------------------------------------------------------------------------
-- Initial State
-------------------------------------------------------------------------------

mkInitialState :: (Show v, Ord v) => v -> [v] -> [(v,v)] -> DS v
mkInitialState r vs es = DS {
    _graph     = mkGraph r vs es

  , _parentsUF = M.fromList [(v,v)| v <- vs ]
  , _mn        = M.fromList [(v,v)| v <- vs ]

  , _parent    = M.empty
  , _idom      = M.empty
  , _semi      = M.fromList [ (v,-1) | v <- vs]
  , _vertex    = M.empty
  , _bucket    = M.fromList [ (v,[]) | v <- vs]
  , _cor1_u    = M.empty
  , _idCnt     = -1
  }

mkGraph :: (Show v, Ord v) => v -> [v] -> [(v,v)] -> Graph v
mkGraph r vs es = Graph (p empty es) (s empty es) r
  where
    empty = M.fromList [ (v,[]) | v <- vs ]
    p acc [] = acc
    p acc ((u,v):es') = p (insertAppend u v acc) es'
    s acc [] = acc
    s acc ((u,v):es') = s (insertAppend v u acc) es'

-------------------------------------------------------------------------------
-- UF
-------------------------------------------------------------------------------

eval :: (Show v, Ord v) => v -> Dom v v
eval v = find v >> get' "eval" mn v

-- 枝u->vを張る (vの親をuとする)
link :: (Show v, Ord v) => v -> v -> Dom v ()
link u v = set' parentsUF v u

find :: (Show v, Ord v) => v -> Dom v v
find v = do
  u <- get' "find: v: " parentsUF v
  if u==v then
    return v
  else do
    r <- find u
    semi_mnv <- get' "find: semi_v: " semi =<< get' "find: mn_v: " mn v
    semi_mnu <- get' "find: semi_u: " semi =<< get' "find: mn_v: " mn u
    when (semi_mnv>semi_mnu) $ set' mn v u
    return r

-------------------------------------------------------------------------------
-- DFS
-------------------------------------------------------------------------------

dfs :: (Show v, Ord v) => v -> Dom v ()
dfs v = do
  i <- idCnt <+= 1
  set' semi v i
  set' vertex i v
  ps <- get' "dfs" (graph.preds) v
  forM_ ps $ \u -> do
    semi_u <- get' "dfs: semi:" semi u
    when (semi_u == -1) $ set' parent u v >> dfs u

-------------------------------------------------------------------------------
-- dominator
-------------------------------------------------------------------------------

idomMap :: (Show v, Ord v) => Dom v (Map v [v])
idomMap = do
  dfs =<< use (graph.start)
  n <- use idCnt -- root=0 ~ nまでのvertexが存在
  forM_ (reverse [1..n]) $ \i -> do -- rootは除く. 以下同様
    -- step 2
    w  <- get' "step2: w: " vertex i
    succ_w <- get' "step2: succ_w: " (graph.succs) w
    forM_ succ_w $ \v -> do
      u <- eval v
      semi_w <- get' "step2: semi_w: " semi w
      semi_u <- get' "step2: semi_u: " semi u
      set' semi w (min semi_w semi_u)

    semi_w <- get' "step2: semi_w: 2: " semi w
    semi_w_v <- get' "step2: semi_w_v" vertex semi_w
    bucket %= insertAppend semi_w_v w -- bucket[semi_w_v]にwを追加

    -- step 3
    parent_w <- get' "step3: parent_w: " parent w
    vs <- get' "step3: vs: " bucket parent_w
    forM_ vs $ \v -> set' cor1_u v =<< eval v
    bucket %= M.insert parent_w []
    link parent_w w

  -- step4
  forM_ [1..n] $ \i -> do
    w <- get' "step4: w" vertex i
    u <- get' "step4: u" cor1_u w
    semi_w <- get' "step4: semi_w" semi w
    semi_u <- get' "step4: semi_u" semi u
    if semi_w==semi_u then
      set' idom w =<< get' "step4: idom_semi_w" vertex semi_w
    else
      set' idom w =<< get' "step4: idom_u" idom u

  uses idom flipMap

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

get' :: Ord a => String -> Lens' (DS v ) (Map a b) -> a -> Dom v b
get' s f x = lookupMapLensNoteM s x f

set' :: Ord a => Lens' (DS v) (Map a b) -> a -> b -> Dom v ()
set' f x y = f %= M.insert x y

