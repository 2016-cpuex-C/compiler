{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.SSA_Deconstruction where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring (Color)

import qualified Data.Map as M
import           Data.List (delete, partition)
import           Data.List.Extra (anySame)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Arrow (first, second)
import           Control.Monad.Extra (concatMapM)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data SSAD = SSAD {
    _blockMap_  :: Map Label ABlock
  , _colorMap_ :: Map Id Color
  }
makeLenses ''SSAD

type CamlSSA = StateT SSAD Caml

data Dest = Reg Color | Mem
  deriving (Ord,Show)
instance Eq Dest where
  Reg n == Reg m = n==m
  _ == _ = False

addBlock :: Label -> [Statement] -> CamlSSA ()
addBlock l contents = blockMap_ %= M.insert l (ABlock l contents)

modifyBlock :: Label -> ([Statement] -> [Statement]) -> CamlSSA ()
modifyBlock l f = addBlock l . f =<< aStatements <$> block l

block :: Label -> CamlSSA ABlock
block l = lookupMapLensNoteM "SSA_Deconstruction: block: no block" l blockMap_

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

ssaDeconstruct :: Map Id Color -> AFunDef -> Caml AFunDef
ssaDeconstruct colMap f@(AFunDef _ _ _ blocks _) =
  blockMapToFun . view blockMap_ <$> execStateT (ssaDeconstructSub labels) SSAD {
      _blockMap_  = blockMap f
    , _colorMap_ = colMap
    }
  where
    labels = map aBlockName blocks
    blockMapToFun m = f { aBody = map snd $ M.toList m }

ssaDeconstructSub :: [Label] -> CamlSSA ()
ssaDeconstructSub ls = do
  mapM_ deconstructAPhiV ls
  mapM_ deconstructAPhiS ls

-------------------------------------------------------------------------------
-- APhiV
-------------------------------------------------------------------------------

--ブロックlの先頭のAPhiV [(Label,[(Id,PhiVal)])]
--  各(lj, [(ai,aji)]) について
--    + reg(ai) = reg(aji) なるものは無視
--    + reg(ai) /= reg(aji') (forall i') なるものをその次に
--    + 残ったものについてはpermutationを計算して配置
--  こうして求めた命令列をIとする
--  Ij: ljからlへの移動時に
--  ブロックljからlへの遷移が,
--    + brならばその手前にIを追加する
--    + cbr _ lj lk ならば
--        * 新たにブロックlj'を作り上のljをlj'に書き換える.
--        * lj'の中身は以下とする.
--            I
--            br l
--    + 的な

deconstructAPhiV :: Label -> CamlSSA ()
deconstructAPhiV l = firstStmt <$> block l >>= \case
  (_, Do (APhiV phis)) -> do
    modifyBlock l tail -- APhiVを削除
    mapM_ (deconstructAPhiVSub l) phis
  _ -> return ()

-- lj -> l の合流
deconstructAPhiVSub :: Label -> (Label,[(Id,PhiVal)]) -> CamlSSA ()
deconstructAPhiVSub l (lj,xvs) = do
  colMaps' <- use colorMap_
  dePhiStmts <- lift $ deconstruct colMaps' xvs
  bj@(ABlock _ stmts_j) <- block lj
  case lastStmt bj of
    s@(_, Do (ABr _))  -> do
        let stmts_j' = init stmts_j ++ dePhiStmts ++ [s]
        addBlock lj stmts_j'

    (id', branch) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newBranch = case branch of
              Do (ACBr x lt lf)
                | l == lt   -> Do (ACBr x lp lf)
                | l == lf   -> Do (ACBr x lt lp)
              Do (ACmpBr p x y lt lf)
                | l == lt   -> Do (ACmpBr p x y lp lf)
                | l == lf   -> Do (ACmpBr p x y lt lp)
              Do (AFCmpBr p x y lt lf)
                | l == lt   -> Do (AFCmpBr p x y lp lf)
                | l == lf   -> Do (AFCmpBr p x y lt lp)
              Do (ASwitch x ldef ils)
                | ldef == l -> Do (ASwitch x lp   ils)
                | otherwise -> Do (ASwitch x ldef ils')
                where ils' = map (second f) ils
                      f l' | l==l'     = lp
                           | otherwise = l'
              _ -> error $ "SSA_Deconstruction: Impossible: " ++ show branch
            stmts_p  = dePhiStmts   ++ [(freshId, Do (ABr l))]
            stmts_j' = init stmts_j ++ [(id', newBranch)]
        addBlock lj stmts_j'
        addBlock lp stmts_p

-------------------------------------------------------------------------------
-- APhiS
-------------------------------------------------------------------------------

deconstructAPhiS :: Label -> CamlSSA ()
deconstructAPhiS l = do
  stmts <- aStatements <$> block l
  colMap' <- use colorMap_
  let f s@(_,i) = case i of
        Do (APhiS xvs) -> deconstruct colMap' xvs
        _ -> return [s]
  addBlock l =<< lift (concatMapM f stmts)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

deconstruct :: Map Id Color
            -> [(Id,PhiVal)] -> Caml [Statement]
deconstruct colMap xvs = do
  let int   = [ (x,i) | (x, PVInt i) <- xvs ]
      float = [ (x,l) | (x, PVFloat l) <- xvs ]
      var   = [ ((x,False), (y,b)) | (x, PVVar y t b) <- xvs, t /= TFloat ]
      varF  = [ ((x,False), (y,b)) | (x, PVVar y t b) <- xvs, t == TFloat ]
              -- memory上にあればTrue, registerにあればFalse

      locate  (x,False) = Reg $ lookupMapNote "color" x colMap
      locate  _         = Mem

      insts = concat [
          map actToInst  $ resolveBy' locate var
        , map actToInstF $ resolveBy' locate varF
        , map (\(x,i) -> x := ASet  i) int
        , map (\(x,l) -> x := ASetF l) float
        ]

  mapM assignInstId insts

-------------------------------------------------------------------------------
-- are
-------------------------------------------------------------------------------

data Action a
  = Nop  (a,a)
  | Move (a,a)
  | Swap (a,a)
  deriving (Show,Eq,Ord)

-----------
-- Check --
-----------

resolveBy' :: (Show a, Eq a, Ord a) => (a -> Dest)-> [(a,a)] -> [Action a]
resolveBy' f xys
  | null err  = result
  | otherwise = errorShow "resolveBy': bug: " (xys, map (both f) xys,result,m,err)
  where
    result  = resolveBy f xys
    m       = runPerm f xys result
    p (x,y) = expected === returned
      where expected = f y
            returned = lookupMapNote "resolveBy'" (f x) m
    err     = filter (not.p) xys

    (===) v1 v2 = case (v1,v2) of
      (Mem,Mem) -> True
      _ -> v1 == v2

-- 得られた結果(::[Action a])を実際に行ってみる
runPerm :: (Show a, Eq a, Ord a) => (a -> Dest)-> [(a,a)] -> [Action a] -> Map Dest Dest
runPerm f xys result =  execState (mapM_ exec result) s0
  where
    msg = "runPerm"
    allVars = uncurry (++) $ unzip xys
    s0 = foldl' g M.empty allVars
      where g m x = M.insert (f x) (f x) m
    exec (Move (x,y)) = do
      vy <- gets $ lookupMapNote msg (f y)
      modify $ M.insert (f x) vy
    exec (Swap (x,y)) = do
      vx <- gets $ lookupMapNote msg (f x)
      vy <- gets $ lookupMapNote msg (f y)
      modify $ M.insert (f x) vy
      modify $ M.insert (f y) vx
    exec Nop{} = return ()

-------------------
-- Main Resolver --
-------------------

-- TODO + PhiLifting (map (classify.snd) perm に重複があるとダメなので必要)
--      + 本来(Mem,Mem)はsafeCopyだがpermになってしまっている
--        (今のところは左側にMemが来ることはないので大丈夫)
resolveBy :: (Show a, Eq a) => (a -> Dest)-> [(a,a)] -> [Action a]
resolveBy f vars
  | anySame (lefts  vars) = errorShow "resolveBy: bug in RegAlloc"  (vars, map (both f) vars)
  | anySame (rights perm) = errorShow "resolveBy: invalid argument" (vars, map (both f) vars)
  | otherwise = ans
  where
    ans  = concat [nop, mov, rest]
    nop  = map Nop identical
    mov  = map Move safeCopy
    rest = resolvePerm perm

    rights = map (f.snd)
    lefts  = map (f.fst)

    (identical, tmp) =
      let g (x,y) = f x == f y
      in  partition g vars
    (safeCopy, perm) =
      let g (safe,yet) (x,y)
            | f x `elem` rights yet = (safe, yet)
            | otherwise             = ((x,y):safe, delete (x,y) yet)
      in  first reverse $ foldl' g ([],tmp) tmp

    resolvePerm [] = []
    resolvePerm ((x,y):xys) =
      let g z | f z == f x = y
              | f z == f y = x
              | otherwise  = z
          xys' = map (second g) xys
      in  Swap (x,y) : resolveBy f xys'

actToInst :: Action (Id,Bool) -> Inst
actToInst (Nop  (_,_)) = Do ANop
actToInst (Move ((x,_), (y,True ))) = x := ARestore y
actToInst (Move ((x,_), (y,False))) = x := AMove y
actToInst (Swap ((x,_), (y,_)))     = Do (ASwap x y)

actToInstF :: Action (Id,Bool) -> Inst
actToInstF (Nop  (_,_))              = Do ANop
actToInstF (Move ((x,_), (y,True)))  = x := AFRestore y
actToInstF (Move ((x,_), (y,False))) = x := AFMov y
actToInstF (Swap ((x,_), (y,_)))     = Do (AFSwap x y)

