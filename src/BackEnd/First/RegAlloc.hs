{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BackEnd.First.RegAlloc where

import Prelude hiding (exp,log)

import Base
import BackEnd.First.Asm

import qualified Data.Map as M
import qualified Data.Set as S
import           Data.Vector (Vector, (!))
import           Data.Foldable (foldlM)
import           Control.Monad.Trans.Except
import           Control.Exception.Base (assert)
import qualified Data.Foldable as F

-------------------------------------------------------------------------------
-- Main Function
-------------------------------------------------------------------------------

regAlloc :: AProg -> Caml AProg
regAlloc (AProg fdata fundefs e) = do
  $(logInfo) $
    "register allocation: may take some time " <>
    "(up to a few minutes, depending on the size of functions)"
  m <- runExceptT $ do
    fundefs' <- mapM h fundefs
    tmp <- lift $ genTmp TUnit
    (e',_regenv) <- g (tmp,TUnit) (AsmAns ANop) M.empty e
    return $ AProg fdata fundefs' e'
  case m of
    Right prog -> return prog
    Left  err  -> throwError $ Failure $ show err

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data AllocError = NoReg Id Type
                deriving Show

type CamlRA = ExceptT AllocError Caml

-------------------------------------------------------------------------------
-- Register Targeting
-------------------------------------------------------------------------------

target' :: Id -> (Id,Type) -> AExpr -> (Bool, [Id])
target' src (dest,t) = \case
  AMov x
    | x==src && isReg dest -> case t of
        TUnit  -> error $ "RegAlloc.target' AMov " ++ x ++ " TUnit"
        TFloat -> error $ "RegAlloc.target' AMov " ++ x ++ " TFloat"
        _ -> (False, [dest])
  AFMovD x
    | x==src && isReg dest -> case t of
        TFloat -> (False, [dest])
        _ -> error "RegAlloc.target' AFMovD"

  AIfEq  _ _ e1 e2 ->
      let (c1,rs1) = target src (dest,t) e1
          (c2,rs2) = target src (dest,t) e2
      in  (c1&&c2, rs1++rs2)
  AIfLe  _ _ e1 e2 ->
      let (c1,rs1) = target src (dest,t) e1
          (c2,rs2) = target src (dest,t) e2
      in  (c1&&c2, rs1++rs2)
  AIfGe  _ _ e1 e2 ->
      let (c1,rs1) = target src (dest,t) e1
          (c2,rs2) = target src (dest,t) e2
      in  (c1&&c2, rs1++rs2)
  AIfFEq _ _ e1 e2 ->
      let (c1,rs1) = target src (dest,t) e1
          (c2,rs2) = target src (dest,t) e2
      in  (c1&&c2, rs1++rs2)
  AIfFLe _ _ e1 e2 ->
      let (c1,rs1) = target src (dest,t) e1
          (c2,rs2) = target src (dest,t) e2
      in  (c1&&c2, rs1++rs2)

  ACallCls x ys zs ->
      (True, targetArgs src  regs 0 ys ++
             targetArgs src fregs 0 zs ++
             [regCl | x == src])

  ACallDir _ ys zs ->
      (True, targetArgs src  regs 0 ys ++
             targetArgs src fregs 0 zs)

  _ -> (False, [])

target :: Id -> (Id, Type) -> Asm -> (Bool, [Id])
target src destt = \case
  AsmAns exp -> target' src destt exp
  AsmLet xt exp e ->
    let (c1,rs1) = target' src xt exp
    in  if c1 then (True, rs1)
              else let (c2,rs2) = target src destt e
                   in  (c2, rs1++rs2)

targetArgs :: Id -> Vector Id -> Int -> [Id] -> [Id]
targetArgs src regs' n = \case
  [] -> []
  y:ys
    | y == src  -> regs'!n : targetArgs src regs' (n+1) ys
    | otherwise -> targetArgs src regs' (n+1) ys

-------------------------------------------------------------------------------
-- Allocation
-------------------------------------------------------------------------------

data AllocResult = Alloc Id
                 | Spill Id

alloc' :: (Id,Type) -> Asm -> Map Id Id -> Id -> Type -> CamlRA AllocResult
alloc' destt cont regenv x t = --assert (M.notMember x regenv) $
  let allregs = case t of
              TUnit -> []
              TFloat -> allFRegs
              _ -> allRegs
  in if | null allregs -> return $ Alloc "%unit"
        | isReg x      -> return $ Alloc x
        | otherwise    ->
            let free = fv cont
                tmpf l y
                  | isReg y   = S.insert y l
                  | otherwise = S.insert (M.findWithDefault y y regenv) l
                live = foldl' tmpf S.empty free
                (_c,prefer) = target x destt cont
            in case F.find (`S.notMember` live) (prefer++allregs) of
                 Just r  -> return $ Alloc r
                 Nothing -> do
                  lift.($logInfo) $ "register allocation failed for " <> pack x
                  let Just y = F.find p (reverse free)
                            where p y' = case M.lookup y' regenv of
                                          Just r -> not (isReg y') && r`elem`allregs
                                          Nothing -> False
                      msg = "spilling " <> pack y <>
                            " from " <> show' (lookupMapNote "alloc'" y regenv)
                  lift ($logInfo msg) >> return (Spill y)

-------------------------------------------------------------------------------
-- RegEnv Operations
-------------------------------------------------------------------------------

add :: Id -> Id -> Map Id Id -> Map Id Id
add x r regenv
  | isReg x   = assert (x==r) regenv
  | otherwise = M.insert x r regenv

find :: Id -> Type -> Map Id Id -> CamlRA Id
find x t regenv
  | isReg x           = return x
  | M.member x regenv = return (lookupMapNote "" x regenv)
  | otherwise         = throwError (NoReg x t)

find' :: IdOrImm -> Map Id Id -> CamlRA IdOrImm
find' (V x) regenv = V <$> find x TInt regenv
find' c _ = return c

-------------------------------------------------------------------------------
-- Main Routine
-------------------------------------------------------------------------------

g :: (Id,Type) -> Asm -> Map Id Id -> Asm -> CamlRA (Asm, Map Id Id)
g destt cont regenv = \case
  AsmAns exp -> g'_and_restore destt cont regenv exp
  AsmLet xt@(x,t) exp e -> assert (M.notMember x regenv) $ do
    let cont' = concat' e destt cont
    (e1',regenv1) <- g'_and_restore xt cont' regenv exp
    alloc' destt cont' regenv1 x t >>= \case
      Spill y -> do
          let r = lookupMapNote "RegAlloc: g" y regenv1
          (e2',regenv2) <- g destt cont (add x r (M.delete y regenv1)) e
          let save = case M.lookup y regenv of
                       Just r'  -> ASave r' y
                       Nothing -> ANop
          e' <- lift $ seq' (save, concat' e1' (r,t) e2')
          return (e', regenv2)
      Alloc r -> do
          (e2', regenv2) <- g destt cont (add x r regenv1) e
          return (concat' e1' (r, t) e2', regenv2)

g' :: (Id,Type) -> Asm -> Map Id Id -> AExpr -> CamlRA (Asm, Map Id Id)
g' destt cont regenv exp = case exp of
  ANop       -> return (AsmAns exp, regenv)
  ASet{}     -> return (AsmAns exp, regenv)
  ASetF{}    -> return (AsmAns exp, regenv)
  ASetL{}    -> return (AsmAns exp, regenv)
  AComment{} -> return (AsmAns exp, regenv)
  ARestore{} -> return (AsmAns exp, regenv)

  AMov x -> do
      rx <- find x TInt regenv
      return (AsmAns (AMov rx), regenv)
  ANeg x -> do
      rx <- find x TInt regenv
      return (AsmAns (ANeg rx), regenv)
  AF2I x -> do
      rx <- find x TFloat regenv
      return (AsmAns (AF2I rx), regenv)
  AI2F x -> do
      rx <- find x TInt regenv
      return (AsmAns (AI2F rx), regenv)

  AAdd x y' -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      return (AsmAns (AAdd rx ry'), regenv)
  ASub x y' -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      return (AsmAns (ASub rx ry'), regenv)
  AMul x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (AMul rx ry'), regenv)
  ADiv x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (ADiv rx ry'), regenv)
  AAnd x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (AAnd rx ry'), regenv)
  AOr x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (AOr rx ry'), regenv)
  AXor x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (AXor rx ry'), regenv)
  ASrl x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (ASrl rx ry'), regenv)
  ASll x y' -> do
      rx <- find  x  TInt regenv
      ry' <- find' y' regenv
      return (AsmAns (ASll rx ry'), regenv)

  ALd x y' -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      return (AsmAns (ALd rx ry'), regenv)
  ASt x y z' -> do
      rx <- find  x  TInt regenv
      ry <- find  y  TInt regenv
      rz'<- find' z' regenv
      return (AsmAns (ASt rx ry rz'), regenv)

  AFMovD x -> do
      rx <- find x TFloat regenv
      return (AsmAns (AFMovD rx), regenv)
  AFNegD x -> do
      rx <- find x TFloat regenv
      return (AsmAns (AFNegD rx), regenv)

  AFAddD x y -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      return (AsmAns (AFAddD rx ry), regenv)
  AFSubD x y -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      return (AsmAns (AFSubD rx ry), regenv)
  AFMulD x y -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      return (AsmAns (AFMulD rx ry), regenv)
  AFDivD x y -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      return (AsmAns (AFDivD rx ry), regenv)

  ALdDF x y' -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      return (AsmAns (ALdDF rx ry'), regenv)

  AStDF x y z' -> do
      rx <- find  x  TFloat regenv
      ry <- find  y  TInt   regenv
      rz'<- find' z' regenv
      return (AsmAns (AStDF rx ry rz'), regenv)

  AIfEq x y' e1 e2 -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      g'_if destt cont regenv exp (AIfEq rx ry') e1 e2
  AIfLe x y' e1 e2 -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      g'_if destt cont regenv exp (AIfLe rx ry') e1 e2
  AIfGe x y' e1 e2 -> do
      rx <- find  x  TInt regenv
      ry'<- find' y' regenv
      g'_if destt cont regenv exp (AIfGe rx ry') e1 e2

  AIfFEq x y e1 e2 -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      g'_if destt cont regenv exp (AIfFEq rx ry) e1 e2
  AIfFLe x y e1 e2 -> do
      rx <- find x TFloat regenv
      ry <- find y TFloat regenv
      g'_if destt cont regenv exp (AIfFLe rx ry) e1 e2

  ACallCls x ys zs -> do
    if | length ys > maxArgs || length zs > length allFRegs - 1 ->
            lift.throwError $ Failure $ "cannot allocate registers for arugments to " ++ x
       | otherwise -> do
            rx <- find x TInt regenv
            g'_call destt cont regenv exp (ACallCls rx) ys zs

  ACallDir l ys zs -> do
    if | length ys > maxArgs || length zs > length allFRegs - 1 ->
            lift.throwError $ Failure $ "cannot allocate registers for arugments to " ++ show l
       | otherwise ->
            g'_call destt cont regenv exp (ACallDir l) ys zs

  ASave{} -> assert False undefined

g'_and_restore :: (Id,Type) -> Asm -> Map Id Id -> AExpr -> CamlRA (Asm, Map Id Id)
g'_and_restore destt cont regenv exp =
  g' destt cont regenv exp `catchError` \(NoReg x t) -> do
      lift.($logInfo) $ "restoring " <> pack x
      g destt cont regenv (AsmLet (x, t) (ARestore x) (AsmAns exp))

g'_if :: (Id,Type) -> Asm -> Map Id Id -> AExpr
      -> (Asm -> Asm -> AExpr) -> Asm -> Asm -> CamlRA (Asm, Map Id Id)
g'_if destt cont regenv _exp constr e1 e2 = do
  (e1',regenv1) <- g destt cont regenv e1
  (e2',regenv2) <- g destt cont regenv e2
  let regenv' = foldl' func M.empty (fv cont) --共通部分
          where func env x =
                  if isReg x then env else
                  case (M.lookup x regenv1, M.lookup x regenv2) of
                    (Just r1, Just r2) | r1 /= r2  -> env
                    _ -> env
      f e x | x == fst destt || M.notMember x regenv || M.member x regenv' = return e
            | otherwise = lift $ seq' (ASave (lookupMapNote "g'_if" x regenv) x, e)
  e <- foldlM f (AsmAns $ constr e1' e2') (fv cont)
  return (e, regenv')

g'_call :: (Id,Type) -> Asm -> Map Id Id -> AExpr
        -> ([Id] -> [Id] -> AExpr) -> [Id] -> [Id] -> CamlRA (Asm, Map Id Id)
g'_call destt cont regenv _exp constr ys zs = do
  let f e x | x == fst destt || M.notMember x regenv = return e
            | otherwise = lift $ seq' (ASave (lookupMapNote "g'_call" x regenv) x, e)
  rys <- mapM (\y -> find y TInt   regenv) ys
  rzs <- mapM (\z -> find z TFloat regenv) zs
  e <- foldlM f (AsmAns $ constr rys rzs) (fv cont)
  return (e, M.empty)

h :: AFunDef -> CamlRA AFunDef
h (AFunDef (Label x) ys zs e t) = do
  let regenv = M.insert x regCl M.empty
      (_i,argRegs,regenv') = foldl' func (0,[],regenv) ys
          where func (i,argRegs_,regenv_) y =
                  let r = regs!i
                  in  (i+1, argRegs_++[r], M.insert y r regenv_)
      (_f,fargRegs,regenv'') = foldl' func (0,[],regenv') zs
          where func (d,fargRegs_,regenv_) z =
                  assert (not (isReg z)) $
                  let fr = fregs!d
                  in  (d+1, fargRegs_++[fr], M.insert z fr regenv_)
  a <- case t of
         TUnit -> lift $ genTmp TUnit
         TFloat -> return $ fregs!0
         _ -> return $ regs!0
  (e',_regenv''') <- g (a,t) (AsmAns (AMov a)) regenv'' e
  return $ AFunDef (Label x) argRegs fargRegs e' t

