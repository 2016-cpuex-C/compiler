{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TupleSections #-}
-- LProg -> AProg

module BackEnd.Second.FromLProg where

import Base
import MiddleEnd.LLVM.BackEnd.Expr
import BackEnd.Second.Asm

import Control.Lens (use,uses)
import Control.Lens.Operators
import Control.Monad.Trans.State
import Data.List (partition)
import Prelude hiding (log)
import Control.Monad (forM_)

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
  (aterminator,s) <- flip runStateT [] $ do
    mapM_ toNamedAInst nlinsts
    toATerminator lterminator
  return $ ABlock b (reverse s) aterminator

-------------------------------------------------------------------------------
-- 中くらい
-------------------------------------------------------------------------------

type CamlV = StateT [Named AInst] Caml

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

  LPhi yls      -> APhi <$> mapM (\(y,l) -> toId y <&> (,l)) yls
  LSelect y z w -> ASelect <$> toId y <*> toII z <*> toII w
  LCall f xs    -> ACallDir (opeLabel f) <$> mapM toId ys <*> mapM toId zs
                   where (ys,zs) = splitOpes xs

  LLoad x
    | isVar x   -> ALd <$> toId x <*> return (C 0)
    | isPtr x   -> ALdi <$> opePtrM x
    | otherwise -> error' "toAInst: " linst

  LStore x y
    | isVar y   -> ASt <$> toId x <*> toId y <*> return (C 0)
    | isPtr y   -> ASti <$> toId x <*> opePtrM y
    | otherwise -> error' "toAInst: " linst

  -- not alocated
  LGetPtr p [ix] -> APtr <$> toId p <*> toII ix
  -- alocated
  LGetPtr p [ix1,ix2]
    | opeInt ix2 == 0 -> APtrG <$> toId p <*> toII ix1
  -- error
  LGetPtr{} -> error' "toAInst: " linst

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


toATerminator :: LTerminator -> CamlV ATerminator
toATerminator lterm = case lterm of
  LRet x          -> ARet <$> mapM toII x
  LCBr x lt lf    -> ACBr  <$> toId x <*> return lt <*> return lf
  LBr  l          -> return $ ABr l
  LSwitch x l cls -> ASwitch <$> toId x <*> return l <*>
                     mapM (\(c,l') -> constToII c <&> (,l')) cls

-----------------------
-- Support Functions --
-----------------------

bind :: Id -> AInst -> CamlV ()
bind x ainst = modify ((x:=ainst):)

do' :: AInst -> CamlV ()
do' ainst    = modify (Do ainst:)

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
  x <- lift $ genId "x"
  bind x $ ASet n
  return x

setFloat :: Float -> CamlV Id
setFloat f = do
  x <- lift $ genId "x"
  fdata <- lift $ use constFloats
  l <- case lookupRev f fdata of
    Nothing -> do
      l <- Label <$> lift (genId "l")
      lift $ constFloats .= (l,f):fdata
      return l
    Just l -> return l
  bind x $ ASetF l
  return x

-- これだけ抽象度が低くて嫌だなあ
setConstTuple :: [LConst] -> CamlV Id
setConstTuple cs = do
  x <- lift $ genId "const_tuple"
  bind x $ AMove regHp
  forM_ (zip cs [0..]) $ \(c',i) -> do
    cv <- constToId c'
    if hasFloatType (LConstOpe c')
      then do' $ AFSt cv regHp (C i)
      else do' $ ASt  cv regHp (C i)
  bind regHp $ AAdd regHp (C (fromIntegral $ length cs))
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
hasFloatType (LVar (_,TFloat)) = True
hasFloatType x = isFloat x

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

opeConst :: LOperand -> LConst
opeConst ~(LConstOpe c) = c

opeLabel :: LOperand -> Label
opeLabel ~(LConstOpe (LGlobal (x,_))) = Label x

opeInt :: LOperand -> Integer
opeInt ~(LConstOpe (LInt n)) = n

opeFloat :: LOperand -> Float
opeFloat ~(LConstOpe (LFloat f)) = f

opePtrM :: LOperand -> CamlV Integer
opePtrM ~(LConstOpe (LGetPtrC c cs)) = do
  let ~(LGlobal (arr,_)) = c
      ~[LInt n, LInt 0] = cs
  (addr,_,_) <- lift $ uses globalHeap (unsafeLookup arr)
  return $ addr+n

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

error' :: Show a => String -> a -> b
error' s x = error $ s ++ show x

