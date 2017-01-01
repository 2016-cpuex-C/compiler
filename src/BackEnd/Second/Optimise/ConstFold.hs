{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.Optimise.ConstFold where

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis

import           Prelude hiding (log,Ordering(..))
import qualified Data.Map as M
import qualified Data.Set as S
import           Data.Bits
import           Data.Sequence (Seq,ViewR(..),(<|),viewr)
import qualified Data.Sequence as Seq

import Control.Lens (makeLenses,uses)
import Control.Lens.Operators hiding ((<|))
import Control.Monad.Trans.State
import Control.Monad.Extra (unlessM)
import Data.List (foldl')
import Data.List.Extra (allSame)
import Control.Monad (filterM)
import Data.Maybe (catMaybes)

-------------------------------------------------------------------------------
-- Types (State & Method)
-------------------------------------------------------------------------------

data Value = Top | Bot | CInt Integer | CFloat Float
           deriving (Show,Eq,Ord)

data CFState
  = CFState {
    _executable :: Set Label
  , _values     :: Map Id Value
  , _bmap       :: Map Label ABlock
  , _labelQ     :: Seq Label
  , _stmtQ      :: Seq Statement
  , _useSite    :: Map Id [Statement]
  }
makeLenses ''CFState

type CamlCF = StateT CFState Caml

isExecutable :: Label -> CamlCF Bool
isExecutable l = uses executable (S.member l)

getValue :: Id -> CamlCF Value
getValue x = uses values (M.lookup x) >>= \case
  Nothing -> return Bot
  Just v  -> return v

-- 2回以上queueにいれる必要はない
-- (むしろ停止しなくなるので入れてはいけない)
setLabel :: Label -> CamlCF ()
setLabel l = unlessM (isExecutable l) $ do
  {-lift.log $ "setLabel:" ++ show l-}
  labelQ %= (l<|)
  executable %= S.insert l

-- こちらは一つの変数につき高々2回
-- Bot -> Const, Const -> Topとリフトされる
setValue :: Id -> Value -> CamlCF ()
setValue x v = do
  getValue x >>= \case
    Top -> return ()
    _   -> do
      {-lift.log $ "setValue: " ++ show (x,v)-}
      values %= M.insert x v
      added <- uses useSite (M.findWithDefault [] x)
      mapM_ addStmt added

popStmt :: CamlCF (Maybe Statement)
popStmt = uses stmtQ viewr >>= \case
  EmptyR -> return Nothing
  q :> x -> stmtQ .= q >> return (Just x)

popLabel :: CamlCF (Maybe Label)
popLabel = uses labelQ viewr >>= \case
  EmptyR -> return Nothing
  q :> x -> labelQ .= q >> return (Just x)

addStmt :: Statement -> CamlCF ()
addStmt s = stmtQ %= (s<|)

getBlock :: Label -> CamlCF ABlock
getBlock l = uses bmap (fromJustNote msg . M.lookup l)
  where msg = "getBlock: " ++ show l

-------------------------------------------------------------------------------
-- Analysis
-------------------------------------------------------------------------------

-- rule 1,2 of tiger book
constFoldAnalysis :: AFunDef -> Caml (Set Label, Map Id Value)
constFoldAnalysis f = do
  let s = CFState {
          _executable = S.empty
        , _values     = M.empty
        , _bmap       = blockMap f
        , _labelQ     = Seq.empty
        , _stmtQ      = Seq.empty
        , _useSite    = useSiteMap f
        }
  s' <- flip execStateT s $ do
          setLabel (entryBlockName f)
          mapM_ (`setValue`Top) $ aArgs f ++ aFArgs f
          loopBlock
  return (s'^.executable, s'^.values)

loopBlock :: CamlCF ()
loopBlock = popLabel >>= \case
  Nothing -> return ()
  Just l  -> do
    b <- getBlock l
    {-lift.log $ "loopBlock:" ++ show l-}
    mapM_ addStmt (aStatements b)
    loopStmt

loopStmt :: CamlCF ()
loopStmt = popStmt >>= \case
  Nothing -> loopBlock
  Just (_id,i) -> do
    case i of
      Do e   -> do' e
      x := e -> bind' x e
    loopStmt

-- rule 3,6,8,9,10,11 of tiger book
do' :: AExpr -> CamlCF ()
do' = \case
  ABr l -> setLabel l
  ACBr x lt lf -> getValue x >>= \case
    CInt 1 -> setLabel lt
    CInt~0 -> setLabel lf
    Top    -> setLabel lt >> setLabel lf
    _      -> return ()
  APhiV phis -> mapM_ processPhi (transpose phis)
  ASwitch x l ils -> getValue x >>= \case
    CInt i -> case lookup i ils of
      Just l' -> setLabel l'
      Nothing -> setLabel l
    Top -> setLabel l >> mapM_ (setLabel.snd) ils
    _   -> return ()
  ACmpBr{}  -> error "ConstFold: Not Implemented"
  AFCmpBr{} -> error "ConstFold: Not Implemented"
  _ -> return ()

  where
    transpose :: [(Label,[(Id,PhiVal)])] -> [(Id,[(Label,PhiVal)])]
    transpose phis = M.toList $ foldl' f M.empty phis
      where
        f acc (l,xvs) = foldl' (g l) acc xvs
        g l acc' (x,p) = insertAppend x (l,p) acc'

-- rule 4,5,7
bind' :: Id -> AExpr -> CamlCF ()
bind' x = \case -- {{{
  ASet  i -> setValue x (CInt i)
  ASetF l -> setValue x =<< CFloat <$> lift (labelFloat l)
  AMove y -> int1   id y
  AFMov y -> float1 id y

  AAdd y (V z) -> int2 (+) y z
  ASub y (V z) -> int2 (-) y z
  AMul y (V z) -> int2 (*) y z
  ADiv y (V z) -> int2 div y z
  AAdd y (C m) -> int1 (+m)      y
  ASub y (C m) -> int1 (\n->n-m) y
  AMul y (C m) -> int1 (*m)      y
  ADiv y (C m) -> int1 (`div`m)  y
  AFAdd y z    -> float2 (+) y z
  AFSub y z    -> float2 (-) y z
  AFMul y z    -> float2 (*) y z
  AFDiv y z    -> float2 (/) y z

  AAnd y (V z) -> int2 (.&.) y z
  AOr  y (V z) -> int2 (.|.) y z
  AXor y (V z) -> int2 xor   y z
  AAnd y (C m) -> int1 (.&.m)   y
  AOr  y (C m) -> int1 (.|.m)   y
  AXor y (C m) -> int1 (`xor`m) y

  ASll y (V z) -> int2 sll y z
  ASrl y (V z) -> int2 srl y z
  ASll y (C m) -> int1 (`sll`m) y
  ASrl y (C m) -> int1 (`srl`m) y

  ACmp p y (V z) -> int2   (cmp p) y z
  ACmp p y (C m) -> int1   (flip (cmp p) m) y
  AFCmp p y z    -> float2 (cmp p) y z

  _ -> setValue x Top
-- }}}
  where -- {{{
    -- lift functions
    int1 :: (Integer -> Integer) -> Id -> CamlCF ()
    int1 = lift1 . (\f (CInt n) -> CInt (f n))
    int2 :: (Integer -> Integer -> Integer) -> Id -> Id -> CamlCF ()
    int2 = lift2 . (\f (CInt n) (CInt m) -> CInt (f n m))

    float1 :: (Float -> Float) -> Id -> CamlCF ()
    float1 = lift1 . (\f (CFloat n) -> CFloat (f n))
    float2 :: (Float -> Float -> Float) -> Id -> Id -> CamlCF ()
    float2 = lift2 . (\f (CFloat s) (CFloat t) -> CFloat (f s t))

    -- main
    lift1 :: (Value -> Value) -> Id -> CamlCF ()
    lift1 f y = getValue y >>= \case
      Top -> setValue x Top
      Bot -> return ()
      c   -> setValue x (f c)
    lift2 :: (Value -> Value -> Value) -> Id -> Id -> CamlCF ()
    lift2 f y z = do
      vy <- getValue y
      vz <- getValue z
      case (vy,vz) of
        (Top,_) -> setValue x Top
        (_,Top) -> setValue x Top
        (Bot,_) -> return ()
        (_,Bot) -> return ()
        (c1,c2) -> setValue x (f c1 c2)

    sll n m = n `shift` fromIntegral m
    srl n m = n `shift` fromIntegral (-m)
    cmp p n m = case p of
      EQ -> b $ n==m
      NE -> b $ n/=m
      LE -> b $ n<=m
      GE -> b $ n>=m
      LT -> b $ n< m
      GT -> b $ n> m
      where b True = 1
            b False = 0

-- }}}

-- rule 6,8,9
processPhi :: (Id,[(Label,PhiVal)]) -> CamlCF ()
processPhi (x,lps) = do
  lps_e <- filterM (isExecutable.fst) lps
  vs_e  <- mapM (toVal.snd) lps_e
  if| null vs_e                           -> return ()
    | Top `elem` vs_e                     -> setValue x Top
    | not $ allSame $ filter (/=Bot) vs_e -> setValue x Top
    | otherwise                           -> setValue x (head vs_e)
  where
    toVal (PVInt n)     = return (CInt n)
    toVal (PVVar y _ _) = getValue y
    toVal (PVFloat l)   = CFloat <$> lift (labelFloat l)

-------------------------------------------------------------------------------
-- Const Fold
-------------------------------------------------------------------------------

constFold :: AProg -> Caml AProg
constFold (AProg fs) = AProg <$> mapM constFoldFun fs

constFoldFun :: AFunDef -> Caml AFunDef
constFoldFun f = do
  log $ "constFoldFun: " ++ show (aFunName f)
  a@(executable',_) <- constFoldAnalysis f
  blocks <- mapM (constFoldBlock a)
              [ b | b <- aBody f, aBlockName b `S.member` executable' ]
  return $ f { aBody = blocks }

constFoldBlock :: (Set Label, Map Id Value) -> ABlock -> Caml ABlock
constFoldBlock a b = do
  stmts <- catMaybes <$> mapM (constFoldStmt a) (aStatements b)
  return $ b { aStatements = stmts }

-- TODO
-- 本来は定数定義を除去したいところだが `ASt Id Id IdOrImm` のように
-- 定数をオペランドにとれない命令が存在するため今は除去していない
constFoldStmt :: (Set Label, Map Id Value) -> Statement -> Caml (Maybe Statement)
constFoldStmt a@(_,vals) (n,i) = case i of
  Do e -> do
    e' <- constFoldExpr a e
    return $ Just (n,Do e')
  x:=e -> case M.findWithDefault Bot x vals of
    Top -> do
      e' <- constFoldExpr a e
      return $ Just (n,x:=e')
    CInt m ->
      return $ Just (n,x:=ASet m)
    CFloat f -> do
      l <- floatLabel f
      return $ Just (n,x:=ASetF l)
    Bot -> do
      log $ "constFold: unused variable" ++ show (n,i)
      {-return Nothing-}
      error $ "にゃん.."

-- 定数畳み込み
constFoldExpr :: (Set Label, Map Id Value) -> AExpr -> Caml AExpr
constFoldExpr (exes,vals) e =
  let val x = M.lookup x vals
  in  case e of-- {{{
  -- non terminator
  ------------------
    -- AAdd x (C m) で val x = CInt n ならばconstFoldStmtで
    -- 置き換えられるはずなので, そのケースは無視して良い
    -- 同様にAFAddなども無視してよく, 残るケースは以下の十数個だけ
  AAdd x (V y) -> case val y of
    Just (CInt m) -> return $ AAdd x (C m)
    _ -> return e
  ASub x (V y) -> case val y of
    Just (CInt m) -> return $ ASub x (C m)
    _ -> return e
  AMul x (V y) -> case val y of
    Just (CInt m) -> return $ AMul x (C m)
    _ -> return e
  ADiv x (V y) -> case val y of
    Just (CInt m) -> return $ ADiv x (C m)
    _ -> return e
  ASll x (V y) -> case val y of
    Just (CInt m) -> return $ ASll x (C m)
    _ -> return e
  ASrl x (V y) -> case val y of
    Just (CInt m) -> return $ ASrl x (C m)
    _ -> return e
  AAnd x (V y) -> case val y of
    Just (CInt m) -> return $ AAnd x (C m)
    _ -> return e
  AOr  x (V y) -> case val y of
    Just (CInt m) -> return $ AOr  x (C m)
    _ -> return e
  AXor x (V y) -> case val y of
    Just (CInt m) -> return $ AXor x (C m)
    _ -> return e
  ACmp p x (V y) -> case val y of
    Just (CInt m) -> return $ ACmp p x (C m)
    _ -> return e

  ALd x (V y) -> case (val x, val y) of
    (Just (CInt n), Just (CInt m)) -> return $ ALdi (n+m)
    (_,             Just (CInt m)) -> return $ ALd x (C m)
    _ -> return e
  ASt x y (V z) -> case (val y, val z) of
    (Just (CInt n), Just (CInt m)) -> return $ ASti x (n+m)
    (_,             Just (CInt m)) -> return $ ASt x y (C m)
    _ -> return e
  AFLd x (V y) -> case (val x, val y) of
    (Just (CInt n), Just (CInt m)) -> return $ AFLdi (n+m)
    (_,             Just (CInt m)) -> return $ AFLd x (C m)
    _ -> return e
  AFSt x y (V z) -> case (val y, val z) of
    (Just (CInt n), Just (CInt m)) -> return $ AFSti x (n+m)
    (_,             Just (CInt m)) -> return $ AFSt x y (C m)
    _ -> return e

  -- terminator
  --------------
  ACBr _ lt lf
    | lt `S.notMember` exes -> return $ ABr lf
    | lf `S.notMember` exes -> return $ ABr lt

  _ -> return e
-- }}}



