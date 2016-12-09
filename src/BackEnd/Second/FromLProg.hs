{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
-- LProg -> AProg

module BackEnd.Second.FromLProg where

import Base
import MiddleEnd.LLVM.BackEnd.Expr
import BackEnd.Second.Asm

import Control.Lens (use,uses)
import Control.Lens.Operators
import Control.Monad.Trans.State
import Data.List (isPrefixOf, partition)
import Prelude hiding (log)
import Control.Monad (forM_)
import qualified Data.Map as M

-------------------------------------------------------------------------------
-- 大きい
-------------------------------------------------------------------------------

toAProg :: LProg -> Caml AProg
toAProg = fmap AProg . mapM toAFundef

toAFundef :: LFunDef -> Caml AFunDef
toAFundef (LFunDef ~(x,TFun _ rett) yts' blks) = do
  let (yts,zts) = splitIdTys yts'
  blks' <- mapM toABlock blks
  return $ AFunDef x (map fst yts) (map fst zts) blks' rett

toABlock :: LBlock -> Caml ABlock
toABlock (LBlock b nlinsts lterminator) = do
  (_,s) <- flip runStateT [] $ do
    mapM_ toNamedAInst nlinsts
    toATerminator lterminator
  return $ ABlock b (reverse s) --aterminator

-------------------------------------------------------------------------------
-- 中くらい
-------------------------------------------------------------------------------

type CamlV = StateT [(InstId, Named AInst)] Caml

toNamedAInst :: Named LInst -> CamlV ()
toNamedAInst (x:=linst) = toAInst linst >>= bind x
toNamedAInst (Do linst) = toAInst linst >>= do'

toAInst :: LInst -> CamlV AInst
toAInst linst = case linst of
  LAdd  y z -> idii' AAdd y z
  LSub  y z -> idii  ASub y z
  LMul  y z -> idii' AMul y z
  LDiv  y z -> idii  ADiv y z
  LSll  y z -> idii  ASll y z
  LSrl  y z -> idii  ASrl y z
  LAnd  y z -> idii  AAnd y z
  LOr   y z -> idii  AOr  y z
  LXor  y z -> idii  AXor y z

  LFAdd y z -> ff AFAdd y z
  LFSub y z -> ff AFSub y z
  LFMul y z -> ff AFMul y z
  LFDiv y z -> ff AFDiv y z

  LICmp p y z -> idii (ACmp  p) y z
  LFCmp p y z -> ff   (AFCmp p) y z

  LPhi yls      -> return $ APhi $ map (\(y,l) -> (l,opePhiVal y)) yls
  LSelect y z w -> ASelect (typeOfLOpe z) <$> toId y <*> toII z <*> toII w
  LCall f xs
    | "init_array." `isPrefixOf` fname -> do
          let isfloat = not (null zs)
              init_array
                | isfloat   = Label "min_caml_float_array_init"
                | otherwise = Label "min_caml_array_init"
          [arr,e] <- mapM toId xs
          Just (addr,size,_) <- lift $ uses globalHeap (M.lookup arr)
          addrv <- setInt addr
          sizev <- setInt size
          if isfloat
            then return $ ACallDir rett init_array [addrv,sizev] [e]
            else return $ ACallDir rett init_array [addrv,sizev,e] []

    | otherwise -> ACallDir rett l <$> mapM toId ys <*> mapM toId zs

    where
      l@(Label fname) = opeLabel f
      (ys,zs) = splitOpes xs
      rett = case typeOfLOpe f of
         TFun _ t -> t
         TPtr (TFun _ t) -> t
         _ -> error $ show (f,xs)

  LLoad x
    | isVar x && tx == TPtr TFloat -> AFLd  <$> toId x <*> return (C 0)
    | isVar x && otherwise         -> ALd   <$> toId x <*> return (C 0)
    | isPtr x && tx == TPtr TFloat -> AFLdi <$> opePtrM x
    | isPtr x && otherwise         -> ALdi  <$> opePtrM x
    | otherwise -> error' "toAInst: " linst
    where tx = typeOfLOpe x

  LStore x y
    | isVar y && tx == TFloat -> AFSt  <$> toId x <*> toId y <*> return (C 0)
    | isVar y && otherwise    -> ASt   <$> toId x <*> toId y <*> return (C 0)
    | isPtr y && tx == TFloat -> AFSti <$> toId x <*> opePtrM y
    | isPtr y && otherwise    -> ASti  <$> toId x <*> opePtrM y
    | otherwise -> error' "toAInst: " linst
    where tx = typeOfLOpe x

  LGetPtr p ixs@(~(ix1:_)) -> do
    heap <- lift $ use globalHeap
    pv <- toId p
    case M.lookup pv heap of
      Nothing -> APtr <$> toId p <*> mapM toII ixs
      Just _
        | opeInt ix1 == 0 -> APtrG <$> (Label <$> toId p) <*> mapM toII (tail ixs)
        | otherwise -> error' "toAInst: " linst

  LSetTupleElem tpl i val ->
    let ~(TTuple ts) = typeOfLOpe tpl in
    case ts !! fromIntegral i of
      TFloat -> AFSt <$> toId val <*> toId tpl <*> return (C i)
      _      -> ASt  <$> toId val <*> toId tpl <*> return (C i)

  LGetTupleElem tpl i ->
    let ~(TTuple ts) = typeOfLOpe tpl in
    case ts !! fromIntegral i of
      TFloat -> AFLd <$> toId tpl <*> return (C i)
      _      -> ALd  <$> toId tpl <*> return (C i)
  where
    -- assert x,y :: Int (this function doesn't check it)
    idii :: (Id -> IdOrImm -> AInst) -> LOperand -> LOperand -> CamlV AInst
    idii o x y = o <$> toId x <*> toII y

    -- assert x,y :: Int: 可換な場合((+)や(*))
    idii':: (Id -> IdOrImm -> AInst) -> LOperand -> LOperand -> CamlV AInst
    idii' o x y
      | isVar x   = return $ o (opeId x) (opeII y)
      | isVar y   = return $ o (opeId y) (opeII x)
      | otherwise = error' "idii'" (x,y)

    -- assert x,y :: Float
    ff :: (Id -> Id -> AInst) -> LOperand -> LOperand -> CamlV AInst
    ff o x y = o <$> toId x <*> toId y

toATerminator :: LTerminator -> CamlV ()--(Indexed (Named AInst))
toATerminator lterm = do' =<< case lterm of
  LRet Nothing    -> return $ ARet TUnit Nothing
  LRet (Just x)   -> ARet (typeOfLOpe x) <$> (Just <$> toII x)
  LCBr x lt lf    -> ACBr  <$> toId x <*> return lt <*> return lf
  LBr  l          -> return $ ABr l
  LSwitch x l cls -> ASwitch <$> toId x <*> return l <*>
                     mapM (\(LInt i,l') -> return (i,l')) cls

-----------------------
-- Support Functions --
-----------------------

bind :: Id -> AInst -> CamlV ()
bind x ainst = do
  n <- lift $ instCount <+= 1
  modify ((n, x:=ainst):)

do' :: AInst -> CamlV ()
do' ainst    = do
  n <- lift $ instCount <+= 1
  modify ((n,Do ainst):)

-------------------------------------------------------------------------------
-- 小さい
-------------------------------------------------------------------------------

----------
-- to系 --
----------

toId :: LOperand -> CamlV Id
toId x
  | isVar x   = return   (opeId x)
  | isInt x   = setInt   (opeInt x)
  | isFloat x = setFloat (opeFloat x)
  | isConst x = constToId (opeConst x)
  | otherwise = error' "toId: " x

toII :: LOperand -> CamlV IdOrImm
toII x
  | isInt x   = C <$> return (opeInt x)
  | otherwise = V <$> toId x

constToId :: LConst -> CamlV Id
constToId = \case
  LInt n   -> setInt n
  LFloat f -> setFloat f
  LGlobal (x,_) -> return x
  LConstTuple cs-> setConstTuple cs

  -- TODO どうするのがいいんだろう
  LUndef t -> case t of
    TFloat -> setFloat 0.001
    _      -> setInt 114514
  c@LGetPtrC{} -> setInt =<< opePtrM (LConstOpe c)

constToII :: LConst -> CamlV IdOrImm
constToII = \case
  LInt n -> C <$> return n
  c      -> V <$> constToId c

-----------------------
-- Set and Return Id --
-----------------------

setInt :: Integer -> CamlV Id
setInt n = do
  x <- lift $ genId "tmpInt"
  bind x $ ASet n
  return x

setFloat :: Float -> CamlV Id
setFloat f = do
  x <- lift $ genId "tmpFloat"
  fdata <- lift $ use constFloats
  l <- case lookupRev f fdata of
    Nothing -> do
      l <- Label <$> lift (genId "l")
      lift $ constFloats .= (l,f):fdata
      return l
    Just l -> return l
  bind x $ ASetF l
  return x

setConstTuple :: [LConst] -> CamlV Id
setConstTuple cs = do
  x <- lift $ genId "const_tuple"
  bind x AGetHP
  forM_ (zip cs [0..]) $ \(c',i) -> do
    cv <- constToId c'
    if hasFloatType (LConstOpe c')
      then do' $ AFStHP cv (C i)
      else do' $ AStHP  cv (C i)
  do' $ AIncHP (C (fromIntegral $ length cs))
  return x

-------------------------------------------------------------------------------
-- もっと小さい
-------------------------------------------------------------------------------

splitIdTys :: [(Id,Type)] -> ([(Id,Type)],[(Id,Type)])
splitIdTys = partition p
  where
    p (_,TFloat) = False
    p _ = True

splitOpes :: [LOperand] -> ([LOperand], [LOperand])
splitOpes = partition (not . hasFloatType)

hasFloatType :: LOperand -> Bool
hasFloatType x = typeOfLOpe x == TFloat

----------
-- Bool --
----------

isVar :: LOperand -> Bool
isVar LVar{} = True
isVar _ = False

isConst :: LOperand -> Bool
isConst LConstOpe{} = True
isConst _ = False

isLabel :: LOperand -> Bool
isLabel (LConstOpe LGlobal{}) = True
isLabel _ = False

isInt :: LOperand -> Bool
isInt (LConstOpe LInt{}) = True
isInt _ = False

isFloat :: LOperand -> Bool
isFloat (LConstOpe LFloat{}) = True
isFloat _ = False

isPtr :: LOperand -> Bool
isPtr (LConstOpe LGetPtrC{}) = True
isPtr _ = False

------------
-- Coerce --
------------

opeII :: LOperand -> IdOrImm
opeII = \case
  LVar (x,_) -> V x
  LConstOpe (LInt i) -> C i
  o -> error $ "opeII: " ++ show o

opeId :: LOperand -> Id
opeId ~(LVar (x,_)) = x

opeIdTy :: LOperand -> Type
opeIdTy ~(LVar (_,t)) = t

opeConst :: LOperand -> LConst
opeConst ~(LConstOpe c) = c

opeLabel :: LOperand -> Label
opeLabel ~(LConstOpe (LGlobal (x,_))) = Label x

opeInt :: LOperand -> Integer
opeInt ~(LConstOpe (LInt n)) = n

opeFloat :: LOperand -> Float
opeFloat ~(LConstOpe (LFloat f)) = f

opePhiVal :: LOperand -> PhiVal
opePhiVal x
  | isInt x   = PVInt (opeInt x)
  | isVar x   = PVVar (opeId  x, opeIdTy x)
  | isFloat x = PVFloat (opeFloat x)
  | otherwise = error' "opePhiVal" x

opePtrM :: LOperand -> CamlV Integer
opePtrM ~(LConstOpe (LGetPtrC c cs)) = do
  let ~(LGlobal (arr,_)) = c
      ~[LInt 0, LInt n] = cs
  (addr,_,_) <- lift $ uses globalHeap (unsafeLookup arr)
  return $ addr+n

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

error' :: Show a => String -> a -> b
error' s x = error $ s ++ show x

