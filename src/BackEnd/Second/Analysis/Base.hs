{-# LANGUAGE LambdaCase #-} {-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Analysis.Base where

import Base
import BackEnd.Second.Asm

import           Prelude hiding(Ordering(..))
import qualified Data.Map as M
import qualified Data.Set as S
import           Data.Tree
import           Data.List.Extra (groupSort)

------------
-- FunDef --
------------

dfsBlock :: AFunDef -> Tree ABlock
dfsBlock f = toBlock <$> dfsBlockName f
  where toBlock l = lookupMapNote "dfsBlock" l (blockMap f)

dfsBlockName :: AFunDef -> Tree Label
dfsBlockName f = dfsMap (entryBlockName f) (succBlockMap f)

-- TODO 名前がblockMapとかぶってる
succBlockMap :: AFunDef -> Map Label [Label]
succBlockMap f = M.fromList
  [ (aBlockName b,ls) | b <- aBody f, let ls = nextBlockNames b ]

-- entryBlockNameにはpredがないので M.insert (entryBlockName f) [] が必要
predBlockMap :: AFunDef -> Map Label [Label]
predBlockMap f = M.insert (entryBlockName f) [] $ M.fromList $ groupSort $ concat
  [ zip ls (repeat (aBlockName b)) | b <- aBody f, let ls = nextBlockNames b ]

defSiteMap :: AFunDef -> Map Id Statement
defSiteMap (AFunDef _ _ _ blocks _) = M.unions $ map defSiteMapB blocks

useSiteMap :: AFunDef -> Map Id [Statement]
useSiteMap (AFunDef _ _ _ blocks _) =
  foldl' (M.foldWithKey insertAppendList) M.empty $ map useSiteMapB blocks

-----------
-- Block --
-----------

nextBlockNames :: ABlock -> [Label]
nextBlockNames (ABlock _ contents) = f $ toExpr $ last contents
  where
    toExpr (_,Do i) = i
    toExpr (_,_:=i) = i
    f = \case
      ATailCall{}         -> []
      ARet{}              -> []
      AExit               -> []
      ABr l               -> [l]
      ACBr _ l1 l2        -> [l1,l2]
      ACmpBr  _ _ _ l1 l2 -> [l1,l2]
      AFCmpBr _ _ _ l1 l2 -> [l1,l2]
      ASwitch _ l ils     -> l : map snd ils
      i -> errorShow "nextBlockNames: non-terminator: " i

defSiteMapB :: ABlock -> Map Id Statement
defSiteMapB (ABlock _ stmts) = M.fromList $ concat
  [ zip (xs++ys) (repeat s) | s <- stmts, let (xs,ys) = toList2 $ defInst (snd s) ]

useSiteMapB :: ABlock -> Map Id [Statement]
useSiteMapB (ABlock _ stmts) = M.fromList $ groupSort $ concat
  [ zip (xs++ys) (repeat s) | s <- stmts, let (xs,ys) = toList2 $ useInst (snd s) ]

----------
-- Inst --
----------

defInst :: Inst -> (Set Id, Set Id)
defInst (Do (APhiV ps)) =
    (S.fromList [ x | (x,v) <- concatMap snd ps, not (isFloat v)]
    ,S.fromList [ x | (x,v) <- concatMap snd ps, isFloat v])
  where
    isFloat PVFloat{}          = True
    isFloat (PVVar _ TFloat _) = True
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
      ACall TFloat _ _ _ -> True
      ASelect TFloat _ _ _ -> True
      APrim _ (TFun _ TFloat) _ _ -> True
      _ -> False
-- }}}

useInst :: Inst -> (Set Id, Set Id)
useInst = \case
    (Do i) -> fromList2 $ g i
    (_:=i) -> fromList2 $ g i
  where
    h C{} = [] -- {{{
    h (V x) = [x]
    g :: AExpr -> ([Id],[Id])
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

      ASwap  x y       -> ([x,y],[])
      AFSwap x y       -> ([],[x,y])

      APtr x y'        -> (x : concatMap h y', [])
      APtrG _ y'       -> (concatMap h y', [])

      AGetHP      -> ([],[])
      AStHP x y'  -> (x : h y',[])
      AFStHP x y' -> (h y', [x])
      AIncHP x'   -> (h x',[])

      ACall _ _ xs ys -> (xs,ys)
      ATailCall _ _ xs ys -> (xs,ys)

      ASelect TFloat x y z -> ([x], [y,z])
      ASelect _      x y z -> ([x,y,z], [])
      ARet _ Nothing         -> ([],[])
      ARet TFloat (Just x')  -> ([],h x')
      ARet _      (Just x')  -> (h x',[])
      ACmpBr  _ x y' _ _     -> (x : h y',[])
      AFCmpBr _ x y  _ _     -> ([],[x,y])

      APhi lvs -> ([ y | (_, PVVar y t _) <- lvs, t/=TFloat ]
                  ,[ y | (_, PVVar y t _) <- lvs, t==TFloat ])
      APhiV ps -> ([ y | (_, PVVar y t _) <- concatMap snd ps, t/=TFloat ]
                  ,[ y | (_, PVVar y t _) <- concatMap snd ps, t==TFloat ])

      -- TODO
      ASave x     -> ([x],[])
      AFSave x    -> ([],[x])
      ARestore{}  -> ([],[])
      AFRestore{} -> ([],[])
      AExit       -> ([],[])

      APrim _ _ xs' ys -> (concatMap h xs',ys)
      --}}}

