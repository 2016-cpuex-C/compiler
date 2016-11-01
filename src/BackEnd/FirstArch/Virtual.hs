{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module BackEnd.FirstArch.Virtual where
{- CProg -> AProg -}

import Base
import MiddleEnd.Closure
import BackEnd.FirstArch.Asm hiding (fv)

import           Data.Map (Map)
import qualified Data.Map as M
import qualified Data.Set as S
import           Control.Lens
import           Data.List (foldl')
--import           Data.Maybe (fromJust)
import           Data.Foldable (foldlM)

import           Data.Maybe (fromMaybe)
fromJust :: Maybe a -> a
fromJust = fromMaybe (error "Virtual.hs")

virtualCode :: CProg -> Caml AProg
virtualCode (CProg fundefs e) = do
  virtualData .= []
  fundefs' <- mapM h fundefs
  e' <- g M.empty e
  fdata <- use virtualData
  return $ AProg fdata fundefs' e'

h :: CFunDef -> Caml AFunDef
h (CFunDef (Label x,t) yts zts e) = do
  let (int, float) = separate yts
  (_offset, load) <- do
      e' <- g (M.insert x t (insertList yts $ insertList zts M.empty)) e
      let f1 z    offset load = AsmLet (z, TFloat) (ALdDF x (C offset)) load
          f2 z t' offset load = AsmLet (z,t')      (ALd   x (C offset)) load
      return $ expand zts (1,e') f1 f2
  case t of
    TFun _ t2 -> return $ AFunDef (Label x) int float load t2
    _ -> error "Virtual.h"

separate :: [(Id, Type)] -> ([Id], [Id])
separate xts =
  classify xts ([],[])
    (\(int,float) x   -> (int, float ++ [x]))
    (\(int,float) x _ -> (int ++ [x], float))

classify :: [(Id, Type)] -> a
         -> (a -> Id -> a)
         -> (a -> Id -> Type -> a)
         -> a
classify xts ini addf addi = foldl' func ini xts
  where func acc (x,t) = case t of
          TUnit   -> acc
          TFloat -> addf acc x
          _      -> addi acc x t

classifyM :: [(Id, Type)] -> a
          -> (a -> Id -> Caml a)
          -> (a -> Id -> Type -> Caml a)
          -> Caml a
classifyM xts ini addf addi = foldlM func ini xts
  where func acc (x,t) = case t of
          TUnit  -> return acc
          TFloat -> addf acc x
          _      -> addi acc x t

expand :: [(Id, Type)] -> (Integer, Asm)
       -> (Id -> Integer -> Asm -> Asm) -- float
       -> (Id -> Type -> Integer -> Asm -> Asm) -- other
       -> (Integer, Asm)
expand xts ini addf addi =
  classify xts ini
    (\(offset, acc) x ->
        let offset' = align offset in
        (offset' + 1, addf x offset' acc))
    (\(offset, acc) x t ->
      (offset + 1, addi x t offset acc))

expandM :: [(Id, Type)]
        -> (Integer, Asm)
        -> (Id -> Integer ->Asm-> Caml Asm)
        -> (Id -> Type -> Integer ->Asm-> Caml Asm)
        -> Caml (Integer, Asm)
expandM xts ini addf addi =
  classifyM xts ini
    (\(offset, acc) x -> do
        let offset' = align offset
        z <- addf x offset acc
        return (offset' + 1, z))
    (\(offset, acc) x t -> do
        z <- addi x t offset acc
        return (offset + 1, z))

----------
-- Util --
----------
insertList :: Ord key => [(key,a)] -> Map key a -> Map key a
insertList xts = M.union (M.fromList xts)

-- Prelude.lookupと比べて a,b が逆
lookupRev :: (Eq a) => a -> [(b,a)] -> Maybe b
lookupRev i = let f (p,q) = (q,p) in lookup i . map f

----------
-- Main --
----------

g :: Map Id Type -> CExpr -> Caml Asm
g env = \case
  CUnit -> return $ AsmAns ANop
  CInt i -> return $ AsmAns $ ASet i
  CFloat d -> do
    fdata <- use virtualData
    l <- case lookupRev d fdata of
           Just l -> return l
           _ -> do l <- Label <$> genId "l"
                   virtualData .= (l,d):fdata
                   return l
    return $ AsmAns (ASetF l)
    {-x <- genId "l"-}
    {-return $ AsmLet (x,TInt) (ASetL l) (AsmAns (ALdDF x (C 0)))-}

  CNeg x -> return $ AsmAns $ ANeg x
  CAdd x y -> return $ AsmAns $ AAdd x (V y)
  CSub x y -> return $ AsmAns $ ASub x (V y)
  CMul x y -> return $ AsmAns $ AMul x (V y)
  CDiv x y -> return $ AsmAns $ ADiv x (V y)

  CFNeg x -> return $ AsmAns $ AFNegD x
  CFAdd x y -> return $ AsmAns $ AFAddD x y
  CFSub x y -> return $ AsmAns $ AFSubD x y
  CFMul x y -> return $ AsmAns $ AFMulD x y
  CFDiv x y -> return $ AsmAns $ AFDivD x y

  CIfEq x y e1 e2 -> case M.lookup x env of
    Just TBool ->  AsmAns <$> (AIfEq  x (V y) <$> g env e1 <*> g env e2)
    Just TInt  ->  AsmAns <$> (AIfEq  x (V y) <$> g env e1 <*> g env e2)
    Just TFloat -> AsmAns <$> (AIfFEq x    y  <$> g env e1 <*> g env e2)
    _ -> throw $ Failure "equality supported only for bool, int, and float"
  CIfLe x y e1 e2 -> case M.lookup x env of
    Just TBool ->  AsmAns <$> (AIfLe  x (V y) <$> g env e1 <*> g env e2)
    Just TInt  ->  AsmAns <$> (AIfLe  x (V y) <$> g env e1 <*> g env e2)
    Just TFloat -> AsmAns <$> (AIfFLe x    y  <$> g env e1 <*> g env e2)
    _ -> throw $ Failure "equality supported only for bool, int, and float"

  CLet (x,t1) e1 e2 -> do
    e1' <- g env e1
    e2' <- g (M.insert x t1 env) e2
    return $ concat' e1' (x,t1) e2'

  CVar x -> case M.lookup x env of
    Just TUnit -> return $ AsmAns ANop
    Just TFloat -> return $ AsmAns $ AFMovD x
    _ -> return $ AsmAns $ AMov x

  -- 重要 よくわかってない
  CMakeCls (x,t) (Closure l ys) e2 -> do
    e2' <- g (M.insert x t env) e2
    let ts = [ fromJust (M.lookup y env) | y <- ys ]
    (offset,storeFv) <-
        let addf y   offset storeFv = seq' (AStDF y x (C offset), storeFv)
            addi y _ offset storeFv = seq' (ASt   y x (C offset), storeFv)
        in  expandM (zip ys ts) (1,e2') addf addi
    e1 <- do
        e2'' <- do
            z <- genId "l"
            AsmLet (z,TInt) (ASetL l) <$> seq' (ASt z x (C 0), storeFv)
        return $ AsmLet (regHp, TInt) (AAdd regHp (C $ align offset)) e2''
    return $ AsmLet (x,t) (AMov regHp) e1

  CAppCls x ys ->
    let (int,float) = separate [(y, fromJust (M.lookup y env)) | y <- ys]
    in  return $ AsmAns $ ACallCls x int float
  CAppDir (Label x) ys ->
    let (int,float) = separate [(y, fromJust (M.lookup y env)) | y <- ys]
    in  return $ AsmAns $ ACallDir (Label x) int float

  CTuple xs -> do
    y <- genId "t"
    let ts = [fromJust (M.lookup x env) | x <- xs]
    (offset,store) <-
        let addf x   offset store = seq' (AStDF x y (C offset), store)
            addi x _ offset store = seq' (ASt   x y (C offset), store)
        in expandM (zip xs ts) (0,AsmAns (AMov y)) addf addi
    return $ AsmLet (y,TTuple ts) (AMov regHp)
              (AsmLet (regHp,TInt) (AAdd regHp (C $ align offset)) store)

  CLetTuple xts y e2 -> do
    let s = fv e2
    (_offset, load) <- do
        let addf x offset load --名前逆では
                | S.member x s = fLetD (x, ALdDF y (C offset), load)
                | otherwise    = load
            addi x t offset load
                | S.member x s = AsmLet (x,t) (ALd y (C offset)) load
                | otherwise    = load
        e2' <- g (insertList xts env) e2
        return $ expand xts (0,e2') addf addi
    return load

  CGet x y -> genId "o" >>= \offset -> case M.lookup x env of
    Just (TArray TUnit)  ->
      return $ AsmAns ANop
    Just (TArray TFloat) ->
      return $ AsmLet (offset, TInt) (ASll y 2) (AsmAns (ALdDF x (V offset)))
    Just (TArray _)      ->
      return $ AsmLet (offset, TInt) (ASll y 2) (AsmAns (ALd x (V offset)))
    _ -> error "Virtual.g CGet"

  CPut x y z -> genId "o" >>= \offset -> case M.lookup x env of
    Just (TArray TUnit)  ->
      return $ AsmAns ANop
    Just (TArray TFloat) ->
      return $ AsmLet (offset, TInt) (ASll y 2) (AsmAns (AStDF z x (V offset)))
    Just (TArray _)      ->
      return $ AsmLet (offset, TInt) (ASll y 2) (AsmAns (ASt z x (V offset)))
    _ -> error "Virtual.g CPut"

  CExtArray (Label x) -> return $ AsmAns $ ASetL $ Label $ "min_caml_" ++ x

