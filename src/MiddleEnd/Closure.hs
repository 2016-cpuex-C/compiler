{-# LANGUAGE LambdaCase #-}{-# LANGUAGE NoImplicitPrelude #-}
{- KExpr -> CExpr -}

module MiddleEnd.Closure (
  CExpr(..),
  CProg(..),
  CFunDef(..),
  Closure(..),
  closureConvert,
  fv
) where

import Prelude hiding (log)

import Base              hiding (liftIO)
import MiddleEnd.KNormal hiding (fv)

import           Data.Map       (Map)
import qualified Data.Map as M
import           Data.Set       (Set, toList, fromList, (\\))
import qualified Data.Set as S
import qualified Data.List as L
import           Control.Lens
import           Control.Monad.Trans.State.Lazy
import           Control.Monad.Trans.Class (lift)

import           Data.Maybe (fromMaybe)

data CExpr = CUnit
           | CInt      Integer
           | CFloat    Float
           | CNeg      Id
           | CAdd      Id Id
           | CSub      Id Id
           | CMul      Id Id
           | CDiv      Id Id
           | CFNeg     Id
           | CFAdd     Id Id
           | CFSub     Id Id
           | CFMul     Id Id
           | CFDiv     Id Id
           | CIfEq     Id Id     CExpr CExpr
           | CIfLe     Id Id     CExpr CExpr
           | CLet      (Id,Type) CExpr CExpr
           | CVar      Id
           | CMakeCls  (Id,Type) Closure CExpr
           | CAppCls   Id [Id]
           | CAppDir   Label [Id]
           | CTuple    [Id]
           | CLetTuple [(Id,Type)] Id CExpr
           | CGet      Id Id
           | CPut      Id Id Id
           | CExtArray Label
           deriving Show
data Closure = Closure { _entry    :: Label
                       , _actualFV :: [Id]}
             deriving Show
data CProg = CProg [CFunDef] CExpr
           deriving Show
data CFunDef = CFunDef { _cname     :: (Label,Type)
                       , _cargs     :: [(Id,Type)]
                       , _cFormalFV :: [(Id,Type)]
                       , _cbody     :: CExpr}
              deriving Show
{-makeLenses ''CFunDef-}
type CamlCls = StateT [CFunDef] Caml

closureConvert :: KExpr -> Caml CProg
closureConvert e = evalStateT (f e) []

f :: KExpr -> CamlCls CProg
f e = do
  e' <- g M.empty S.empty e
  toplevel <- get
  return $ CProg (reverse toplevel) e'

fv :: CExpr -> Caml (Set Id)
fv e = do
  stArrays <- uses globalHeap (map fst . M.toList)
  case e of
    CUnit       -> return S.empty
    CInt{}      -> return S.empty
    CFloat{}    -> return S.empty
    CExtArray{} -> return S.empty

    CNeg  x -> return $ S.singleton x
    CFNeg x -> return $ S.singleton x
    CVar  x -> return $ S.singleton x

    CAdd  x y -> return $ S.fromList [x,y]
    CSub  x y -> return $ S.fromList [x,y]
    CMul  x y -> return $ S.fromList [x,y]
    CDiv  x y -> return $ S.fromList [x,y]
    CFAdd x y -> return $ S.fromList [x,y]
    CFSub x y -> return $ S.fromList [x,y]
    CFMul x y -> return $ S.fromList [x,y]
    CFDiv x y -> return $ S.fromList [x,y]

    CIfEq x y e1 e2 -> S.insert x . S.insert y <$> (S.union <$> fv e1 <*> fv e2)
    CIfLe x y e1 e2 -> S.insert x . S.insert y <$> (S.union <$> fv e1 <*> fv e2)

    CLet (x,_t) e1 e2 -> S.union <$> fv e1 <*> (S.delete x <$> fv e2)

    CMakeCls (x,_t) (Closure _l ys) e' -> S.delete x . S.union (S.fromList ys) <$> fv e'

    CAppCls x ys -> return $ S.fromList $ x:ys
    CAppDir _ xs -> return $ S.fromList xs

    CTuple xs -> return $ S.fromList xs

    CLetTuple xts y e' -> S.insert y . (S.\\ S.fromList (map fst xts)) <$> fv e'

    CGet x y
      | (`isPrefixOf` x) `any` stArrays -> return $ S.singleton y
      | otherwise                       -> return $ S.fromList [x,y]
    CPut x y z
      | (`isPrefixOf` x) `any` stArrays -> return $ S.fromList [y,z]
      | otherwise                       -> return $ S.fromList [x,y,z]

  where
    isPrefixOf x y = take (length x) y == x


-- known = known to be able to apply directly
g :: Map Id Type -> Set Id -> KExpr -> CamlCls CExpr
g env known = \case
  KUnit    -> return $ CUnit
  KInt i   -> return $ CInt i
  KFloat d -> return $ CFloat d

  KNeg  x -> return $ CNeg x
  KFNeg x -> return $ CFNeg x

  KAdd  x y -> return $ CAdd  x y
  KSub  x y -> return $ CSub  x y
  KMul  x y -> return $ CMul  x y
  KDiv  x y -> return $ CDiv  x y
  KFAdd x y -> return $ CFAdd x y
  KFSub x y -> return $ CFSub x y
  KFMul x y -> return $ CFMul x y
  KFDiv x y -> return $ CFDiv x y

  KIfEq x y e1 e2 -> CIfEq x y <$> g env known e1 <*> g env known e2
  KIfLe x y e1 e2 -> CIfLe x y <$> g env known e1 <*> g env known e2

  KLet (x,t) e1 e2 -> CLet (x,t) <$> g env known e1 <*> g (M.insert x t env) known e2

  KVar x -> return $ CVar x

  KLetRec (KFunDef (x,t) yts e1) e2 -> do
    -- xは自由変数を持たないと仮定してとりあえずやってみる
    -- だめだったらやり直す
    toplevelBackup <- get
    let env'     = M.insert x t env
        env''    = M.union (M.fromList yts) env'
        known'   = S.insert x known
        (ys,_ts) = unzip yts
    e1' <- g env'' known' e1

    fve1' <- lift $ fv e1'
    (known'', e1'') <- case toList $ fve1' \\ fromList ys of
        [] -> return (known', e1')   -- OK
        zs -> do lift.log $
                      "free variable(s) " ++ ppList zs ++ " " ++
                      "found in function " ++ x ++ "\n" ++
                      "function " ++ x ++ " cannot be directly applied in fact"
                 put toplevelBackup
                 e1'' <- g env'' known e1
                 return (known, e1'')
    fve1'' <- lift $ fv e1''
    let zs'  = toList fve1'' L.\\ (x:ys)
        zts' = [(z, fromMaybe (error $ "Closure.g: " ++ z) (M.lookup z env')) | z <- zs']
    modify (CFunDef (Label x, t) yts zts' e1'' :) -- 追加
    e2' <- g env' known'' e2
    fve2' <- lift $ fv e2'
    if S.member x fve2' then -- やや賢い->賢い
        return $ CMakeCls (x,t) (Closure (Label x) zs') e2'
    else do
        lift.log $ "eliminating closure(s) " ++ x
        return e2'

  KApp x ys
    | S.member x known -> do
        lift.log $ "directly applying " ++ x
        return $ CAppDir (Label x) ys
    | otherwise ->
        return $ CAppCls x ys

  KTuple xs -> return $ CTuple xs
  KArray x y -> return $ CAppDir (Label "min_caml_create_array") [x,y]
  KFArray x y -> return $ CAppDir (Label "min_caml_create_float_array") [x,y]

  KLetTuple xts y e -> CLetTuple xts y <$> g (M.union (M.fromList xts) env) known e

  KGet x y        -> return $ CGet x y
  KPut x y z      -> return $ CPut x y z
  KExtArray x     -> return $ CExtArray (Label x)
  KExtFunApp x ys -> return $ CAppDir   (Label ("min_caml_" ++ x)) ys

