{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.SSA_Deconstruction where

import Prelude hiding (log)

import Base hiding (unsafeLookup)
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring (Color)

import           Data.Map (Map)
import qualified Data.Map as M
import           Data.List (partition)
import           Control.Lens (view,use,uses,makeLenses)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Data.List.Extra (anySame)
import           Data.Maybe (fromMaybe)
import           Control.Arrow (second)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data SSAD = SSAD {
    _bmap  :: Map Label ABlock
  , _cmaps :: (Map Id Color,Map Id Color)
  }
makeLenses ''SSAD

type CamlSSA = StateT SSAD Caml

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

ssaDeconstruct :: (Map Id Color, Map Id Color) -> AFunDef -> Caml AFunDef
ssaDeconstruct colMaps f@(AFunDef _ _ _ blocks _) =
  bmapToFun . view bmap <$> execStateT (ssaDeconstructSub blocks) SSAD {
      _bmap  = blockMap f
    , _cmaps = colMaps
    }
  where
    bmapToFun m = f { aBody = map snd $ M.toList m }

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
--    + switchは放置(virtualで消しとこう)
--        * virtualで消すのはしんどい

deconstructBlock :: ABlock -> CamlSSA ()
deconstructBlock b = case snd (firstStmt b) of
  Do (APhiV phis) -> do
    let l = aBlockName b
    mapM_ (deconstructBlockSub l) phis
    ABlock _ stmts <- block l -- 更新されている
    addBlock l (tail stmts)
  _ -> return ()

-- lj -> l の合流
deconstructBlockSub :: Label -> (Label,[(Id,PhiVal)]) -> CamlSSA ()
deconstructBlockSub l (lj,xvs) = do
  colMaps <- use cmaps
  dePhiStmts <- lift $ deconstruct colMaps xvs
  bj@(ABlock _ stmts_j) <- block lj
  case lastStmt bj of
    s@(_, Do (ABr _))  -> do
        let stmts_j' = init stmts_j ++ dePhiStmts ++ [s]
        addBlock lj stmts_j'

    (id', Do (ACBr p lt lf)) -> do
        freshId <- lift freshInstId
        let lp = Label $ "phi_" ++ unLabel lj ++ "_" ++ unLabel l
            newCbr | l == lt   = (id', Do (ACBr p lp lf))
                   | l == lf   = (id', Do (ACBr p lt lp))
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

addBlock :: Label -> [Statement] -> CamlSSA ()
addBlock l contents = bmap %= M.insert l (ABlock l contents)

block :: Label -> CamlSSA ABlock
block = uses bmap . unsafeLookup

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

deconstruct :: (Map Id Color, Map Id Color)
            -> [(Id,PhiVal)] -> Caml [Statement]
deconstruct (colMap,colMapF) xvs = do
  let int   = [ (x,i) | (x, PVInt i) <- xvs ]
      float = [ (x,l) | (x, PVFloat l) <- xvs ]
      var   = [ (x,y) | (x, PVVar (y,t)) <- xvs, t /= TFloat ]
      varF  = [ (x,y) | (x, PVVar (y,t)) <- xvs, t == TFloat ]

      color  x = unsafeLookup x colMap
      colorF x = unsafeLookup x colMapF

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

-- map (color.snd) vars に重複があるとダメ
-- PhiLiftingを先にすること. (12/14時点で未実装)
resolveBy :: Eq a => (Id -> a)-> [(Id,Id)] -> [Action]
resolveBy color vars
  | anySame used = error "SSA_Deconstruction: resolveBy: invalid argument"
  | otherwise = concat [nop, mov, rest]
  where
    nop  = map Nop identical
    mov  = map Move safeCopy
    rest = resolvePerm perm

    used = map (color .snd) vars
    (identical, others) = partition (\(x,y)-> color x == color  y) vars
    (safeCopy, perm)    = partition (\(x,_)-> color x `notElem` used) others

    resolvePerm [] = []
    resolvePerm ((x,y):xys) =
      let f z | color z == color x = y
              | color z == color y = x
              | otherwise          = z
          xys' = map (second f) xys
      in  Swap (x,y) : resolveBy color xys'

data Action
  = Nop  (Id, Id)
  | Move (Id, Id)
  | Swap (Id, Id)
  deriving (Show,Eq,Ord)

actToInst :: Action -> Inst
actToInst (Nop  (_,_)) = Do ANop
actToInst (Move (x,y)) = x := AMove y
actToInst (Swap (x,y)) = Do (ASwap x y)

actToInstF :: Action -> Inst
actToInstF (Nop  (_,_)) = Do ANop
actToInstF (Move (x,y)) = x := AFMov y
actToInstF (Swap (x,y)) = Do (AFSwap x y)

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "SSA: unsafeLookup: "++ show key) $ M.lookup key dic

