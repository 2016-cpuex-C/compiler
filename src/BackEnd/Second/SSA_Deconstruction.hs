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
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Data.List.Extra (anySame)
import           Control.Arrow (first, second)


-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data SSAD = SSAD {
    _blockMap_  :: Map Label ABlock
  , _colorMaps_ :: Map Id Color
  }
makeLenses ''SSAD

type CamlSSA = StateT SSAD Caml

data Dest = Reg Color | Mem
  deriving (Ord,Show)
instance Eq Dest where
  Reg n == Reg m = n==m
  _ == _ = False

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

ssaDeconstruct :: Map Id Color -> AFunDef -> Caml AFunDef
ssaDeconstruct colMap f@(AFunDef _ _ _ blocks _) =
  blockMapToFun . view blockMap_ <$> execStateT (ssaDeconstructSub blocks) SSAD {
      _blockMap_  = blockMap f
    , _colorMaps_ = colMap
    }
  where
    blockMapToFun m = f { aBody = map snd $ M.toList m }

ssaDeconstructSub :: [ABlock] -> CamlSSA ()
ssaDeconstructSub = mapM_ deconstructBlock

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

--ブロックlの先頭のAPhiV [(Label,[(Id,PhiVal)])]
--  各(lj, [(ai,aji)]) について
--    + reg(ai) = reg(aji) なるものは無視
--    + reg(ai) /= reg(aji') (forall i') なるものをその次に
--    + 残ったものについてはpermutationを計算して配置
--  こうして求めた命令列をIとする
--  ブロックljからlへの遷移が,
--    + brならばその手前にIを追加する
--    + cbr _ lj lk ならば
--        * 新たにブロックlj'を作り上のljをlj'に書き換える.
--        * lj'の中身は以下とする.
--            I
--            br l
--    + 的な

deconstructBlock :: ABlock -> CamlSSA ()
deconstructBlock b = case snd (firstStmt b) of
  Do (APhiV phis) -> do
    let l = aBlockName b
    mapM_ (deconstructBlockSub l) phis
    ABlock _ stmts <- block l -- 更新されている
    addBlock l (tail stmts)
  _ -> return ()

-- lj -> l の合流
-- TODO 抽象化
deconstructBlockSub :: Label -> (Label,[(Id,PhiVal)]) -> CamlSSA ()
deconstructBlockSub l (lj,xvs) = do-- {{{
  colMaps <- use colorMaps_
  dePhiStmts <- lift $ deconstruct colMaps xvs
  bj@(ABlock _ stmts_j) <- block lj
  case lastStmt bj of
    s@(_, Do (ABr _))  -> do
        let stmts_j' = init stmts_j ++ dePhiStmts ++ [s]
        addBlock lj stmts_j'

    (id', Do (ACBr x lt lf)) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newCbr | l == lt   = (id', Do (ACBr x lp lf))
                   | l == lf   = (id', Do (ACBr x lt lp))
                   | otherwise = error "impossible"
            stmts_p  = dePhiStmts ++ [(freshId, Do (ABr l))]
            stmts_j' = init stmts_j ++ [newCbr]
        addBlock lj stmts_j'
        addBlock lp stmts_p

    (id', Do (ACmpBr p x y lt lf)) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newCbr | l == lt   = (id', Do (ACmpBr p x y lp lf))
                   | l == lf   = (id', Do (ACmpBr p x y lt lp))
                   | otherwise = error "impossible"
            stmts_p  = dePhiStmts ++ [(freshId, Do (ABr l))]
            stmts_j' = init stmts_j ++ [newCbr]
        addBlock lj stmts_j'
        addBlock lp stmts_p

    (id', Do (AFCmpBr p x y lt lf)) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newCbr | l == lt   = (id', Do (AFCmpBr p x y lp lf))
                   | l == lf   = (id', Do (AFCmpBr p x y lt lp))
                   | otherwise = error "impossible"
            stmts_p  = dePhiStmts ++ [(freshId, Do (ABr l))]
            stmts_j' = init stmts_j ++ [newCbr]
        addBlock lj stmts_j'
        addBlock lp stmts_p

    (id', Do (ASwitch x ldef ils)) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newSwitch
              | ldef==l   = (id', Do (ASwitch x lp   ils))
              | otherwise = (id', Do (ASwitch x ldef ils'))
              where ils' = map (second f) ils
                    f l' | l==l'     = lp
                         | otherwise = l'
            stmts_p = dePhiStmts ++ [(freshId, Do (ABr l))]
            stmts_j' = init stmts_j ++ [newSwitch]
        addBlock lj stmts_j'
        addBlock lp stmts_p

    s -> error $ "SSA_Deconstruction: Impossible: " ++ show s
-- }}}

addBlock :: Label -> [Statement] -> CamlSSA ()
addBlock l contents = blockMap_ %= M.insert l (ABlock l contents)

block :: Label -> CamlSSA ABlock
block = uses blockMap_ . lookupMapNote "SSA_Deconstruction: block: Impossible"

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

deconstruct :: Map Id Color
            -> [(Id,PhiVal)] -> Caml [Statement]
deconstruct colMap xvs = do
  let int   = [ (x,i) | (x, PVInt i) <- xvs ]
      float = [ (x,l) | (x, PVFloat l) <- xvs ]
      var   = [ ((x,False), (y,b)) | (x, PVVar y t b) <- xvs, t /= TFloat ]
      varF  = [ ((x,False), (y,b)) | (x, PVVar y t b) <- xvs, t == TFloat ]
              -- memory上にあればTrue, registerにあればFalse

      color  (x,False) = Reg $ lookupMapNote "color" x colMap
      color  _         = Mem
      colorF (x,False) = Reg $ lookupMapNote "colorF" x colMap
      colorF _         = Mem

      insts = concat [
          map actToInst  $ resolveBy color  var
        , map actToInstF $ resolveBy colorF varF
        , map (\(x,i) -> x := ASet  i) int
        , map (\(x,l) -> x := ASetF l) float
        ]

  mapM assignInstId insts

-------------------------------------------------------------------------------
-- are
-------------------------------------------------------------------------------

-- TODO PhiLifting (map (classify.snd) vars に重複があるとダメなので必要)
--      本来(Mem,Mem)はsafeCopyだがpermになってしまっている
--      (今のところは左側にMemが来ることはないので大丈夫)
resolveBy :: (Show a, Show b, Eq a, Eq b) => (a -> b)-> [(a,a)] -> [Action a]
resolveBy classify vars
  | anySame (rights vars) = errorShow "resolveBy: invalid argument" (vars, map (both classify) vars)
  | otherwise = concat [nop, mov, rest]
  where
    nop  = map Nop identical
    mov  = map Move safeCopy
    rest = resolvePerm perm

    rights = map (classify.snd)

    (identical, tmp) =
      let f (x,y) = classify x == classify y
      in  partition f vars
    (safeCopy, perm) =
      let f (safe,yet) (x,y)
            | classify x `elem` rights yet = (safe, yet)
            | otherwise                    = ((x,y):safe, delete (x,y) yet)
      in  first reverse $ foldl' f ([],vars) tmp

    resolvePerm [] = []
    resolvePerm ((x,y):xys) =
      let f z | classify z == classify x = y
              | classify z == classify y = x
              | otherwise                = z
          xys' = map (second f) xys
      in  Swap (x,y) : resolveBy classify xys'

data Action a
  = Nop  (a,a)
  | Move (a,a)
  | Swap (a,a)
  deriving (Show,Eq,Ord)

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

