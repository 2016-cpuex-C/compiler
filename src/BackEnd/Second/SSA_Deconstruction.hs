{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.SSA_Deconstruction where

import Prelude hiding (log)

import Base
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring (Color(..))

import qualified Data.Map as M
import           Data.List ((\\), delete, partition)
import           Data.List.Extra (anySame)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Control.Arrow (second)
import           Control.Monad.Extra (concatMapM)
--import Debug.Trace (trace, traceM)

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
block = uses blockMap_ . lookupMapNote "SSA_Deconstruction: block: no block"

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
--  ブロックljからlへの遷移が,
--    + brならばその手前にIを追加する
--    + cbr _ lj lk ならば
--        * 新たにブロックlj'を作り上のljをlj'に書き換える.
--        * lj'の中身は以下とする.
--            I
--            br l
--    + 的な

deconstructAPhiV :: Label -> CamlSSA ()
deconstructAPhiV l = snd . firstStmt <$> block l >>= \case
  Do (APhiV phis) -> do
    modifyBlock l tail -- APhiVを削除
    mapM_ (deconstructAPhiVSub l) phis
  _ -> return ()

-- lj -> l の合流
-- TODO 抽象化
deconstructAPhiVSub :: Label -> (Label,[(Id,PhiVal)]) -> CamlSSA ()
deconstructAPhiVSub l (lj,xvs) = do-- {{{
  colMaps' <- use colorMap_
  dePhiStmts <- lift $ deconstruct colMaps' xvs
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
-- Main?
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
          map actToInst  $ resolveBy locate var
        , map actToInstF $ resolveBy locate varF
        , map (\(x,i) -> x := ASet  i) int
        , map (\(x,l) -> x := ASetF l) float
        ]

  --traceM $ unlines [
  --      "===="
  --    , show var
  --    , show $ map (both color) var
  --    , show hoge
  --    , show varF
  --    , show $ map (both color) varF
  --    , show hogeF
  --    ]

  mapM assignInstId insts

-------------------------------------------------------------------------------
-- are
-------------------------------------------------------------------------------

-- verifierを書こうな

-- TODO + PhiLifting (map (classify.snd) perm に重複があるとダメなので必要)
--      + 本来(Mem,Mem)はsafeCopyだがpermになってしまっている
--        (今のところは左側にMemが来ることはないので大丈夫)
resolveBy :: (Show a, Show b, Eq a, Eq b) => (a -> b)-> [(a,a)] -> [Action a]
resolveBy classify vars
  | anySame (lefts  vars) = errorShow "resolveBy: regAllocのバグ\n" (vars, map (both classify) vars)
  | anySame (rights perm) = errorShow "resolveBy: invalid argument" (vars, map (both classify) vars)
  | otherwise = ans
  where
    ans  = concat [nop, mov, rest]
    nop  = [] --map Nop identical
    mov  = map Move safeCopy
    rest = resolvePerm perm

    rights = map (classify.snd)
    lefts  = map (classify.fst)

    (identical, tmp) =
      let f (x,y) = classify x == classify y
      in  partition f vars
    (safeCopy, perm) = -- TODO もっと簡潔にできないものか
      let f (safe,yet) (x,y)
            | classify x `elem` rights yet = (safe, yet)
            | otherwise                    = ((x,y):safe, delete (x,y) yet)
      in  bimap reverse (\\identical) $ foldl' f ([],tmp) tmp

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

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------


--resolveBy' :: (Show a, Show b, Eq a, Eq b, Ord a) => (a -> b)-> [(a,a)] -> [Action a]
--resolveBy' :: (Show a, Eq a, Ord a) => (a -> Dest)-> [(a,a)] -> [Action a]
resolveBy' :: ((Id,Bool) -> Dest)-> [((Id,Bool),(Id,Bool))] -> [Action (Id,Bool)]
resolveBy' f vars
  | null err  = result
  | otherwise = errorShow "resolveBy: bug: " (vars, map (both f) vars,result,m,err)
  where
    result = resolveBy f vars
    m = verify f vars result
    (_ok,err) = partition (\(x,y) -> lookupMapNote "" (f x) m === f y ) vars

    --err' = map (bimap (\x->lookupMapNote "" x m) f) err


    (===) v1 v2 = case (v1,v2) of
      (Mem,Mem) -> True
      _ -> v1 == v2

-- ぜんぜんだめ
--verify :: (Show a, Eq a, Ord a) => (a -> Dest)-> [(a,a)] -> [Action a] -> Map a Dest
verify :: ((Id,Bool) -> Dest)-> [((Id,Bool),(Id,Bool))] -> [Action (Id,Bool)] -> Map Dest Dest
verify f vars result =  execState (mapM_ exec result) s0
  where

    s0 = foldl' g M.empty $ uncurry (++) $ unzip vars
      where g m x = M.insert (f x) (f x) m

    exec (Move (x,y)) = do
      vy <- gets $ lookupMapNote "" (f y)
      modify $ M.insert (f x) vy
    exec (Swap (x,y)) = do
      vx <- gets $ lookupMapNote "" (f x)
      vy <- gets $ lookupMapNote "" (f y)
      modify $ M.insert (f x) vy
      modify $ M.insert (f y) vx
      --traceM $ show (x,y,vx,vy)
    exec Nop{} = return ()

-- {{{
--main :: IO ()
--main = do undefined
--  let p = [(Reg (F 2),Reg (F 4))
--          ,(Reg (F 4),Reg (F 0))
--          ,(Reg (F 0),Reg (F 5))
--          ,(Reg (F 5),Reg (F 0))
--          ]
--      result = resolveBy id p
--  print $ verify id p result
-- }}}

