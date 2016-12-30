{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
-- LProg -> AProg

module BackEnd.Second.FromLProg where

import Base
import MiddleEnd.LLVM.BackEnd
import BackEnd.Second.Asm

import           Prelude             hiding (log)
import           Control.Lens               (use,uses,_1,_2)
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Data.List                  (isPrefixOf, partition)
import           Control.Monad              (forM_)
import qualified Data.Map as M

-------------------------------------------------------------------------------
-- 大きい
-------------------------------------------------------------------------------

-- LLVMを通すために作った create_array.*** などの関数は
-- 不要なので filter (not.isEmptyFun) で除去する
toAProg :: LProg -> Caml AProg
toAProg = fmap (AProg . filter (not.isEmptyFun)) . mapM toAFundef

toAFundef :: LFunDef -> Caml AFunDef
toAFundef (LFunDef ~(x,TFun _ rett) yts' blocks) = do
  let (yts,zts) = splitIdTys yts'
  fid <- genId ""
  blocks' <- mapM (toABlock fid) blocks
  return $ AFunDef x (map fst yts) (map fst zts) blocks' rett

toABlock :: FuncId -> LBlock -> Caml ABlock
toABlock fid (LBlock b nlinsts lterminator) = do
  s <- flip execStateT ([],fid) $ do
    mapM_ toStatements nlinsts
    toATerminator lterminator
  return $ ABlock (addFID b fid) (reverse (fst s))

-------------------------------------------------------------------------------
-- 中くらい
-------------------------------------------------------------------------------

type CamlV = StateT ([Statement],FuncId) Caml
type FuncId = String
    -- LLVMのアルファ変換は関数単位なので，関数間で重複するラベルがありうる
    -- そこで関数ごとにフレッシュなIDを渡してあれする

toStatements :: Named LInst -> CamlV ()
toStatements (x:=linst) = toAExpr linst >>= bind x
toStatements (Do linst) = toAExpr linst >>= do'

toAExpr :: LInst -> CamlV AExpr
toAExpr linst = case linst of
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

  LPhi yls      -> APhi <$> mapM (\(y,l) -> (,) <$> label l <*> toPhiVal y) yls
  -- TODO
  LSelect y z w -> ASelect (typeOfLOpe z) <$> toId y <*> toId z <*> toId w
  LCall f xs
    | "init_array." `isPrefixOf` fname -> do
          let init_array
                | hasFloatArg = Label "min_caml_float_array_init"
                | otherwise   = Label "min_caml_array_init"
          [arr,e] <- mapM toId xs
          Just (addr,size,_) <- lift $ uses globalHeap (M.lookup arr)
          addrv <- setInt addr
          sizev <- setInt size
          if hasFloatArg
            then return $ ACall rett init_array [addrv,sizev] [e]
            else return $ ACall rett init_array [addrv,sizev,e] []
    | "create_array." `isPrefixOf` fname -> do
          let create_array
                | hasFloatArg = Label "min_caml_create_float_array"
                | otherwise   = Label "min_caml_create_array"
          ACall rett create_array <$> mapM toId ys <*> mapM toId zs

    | otherwise -> ACall rett l <$> mapM toId ys <*> mapM toId zs

    where
      l@(Label fname) = opeLabel f
      (ys,zs) = splitOpes xs
      hasFloatArg = not (null zs)
      rett = case typeOfLOpe f of
         TFun _ t -> t
         TPtr (TFun _ t) -> t
         _ -> error $ show (f,xs)

  LLoad x
    | isVar x && tx == TPtr TFloat -> AFLd  <$> toId x <*> return (C 0)
    | isVar x && otherwise         -> ALd   <$> toId x <*> return (C 0)
    | isPtr x && tx == TPtr TFloat -> AFLdi <$> opePtrM x
    | isPtr x && otherwise         -> ALdi  <$> opePtrM x
    | otherwise -> error' linst
    where tx = typeOfLOpe x

  LStore x y
    | isVar y && tx == TFloat -> AFSt  <$> toId x <*> toId y <*> return (C 0)
    | isVar y && otherwise    -> ASt   <$> toId x <*> toId y <*> return (C 0)
    | isPtr y && tx == TFloat -> AFSti <$> toId x <*> opePtrM y
    | isPtr y && otherwise    -> ASti  <$> toId x <*> opePtrM y
    | otherwise -> error' linst
    where tx = typeOfLOpe x

  LGetPtr p ixs@(~(ix1:_)) -> do
    heap <- lift $ use globalHeap
    pv <- toId p
    case M.lookup pv heap of
      Nothing -> APtr <$> toId p <*> mapM toII ixs
      Just _
        | opeInt ix1 == 0 -> APtrG <$> (Label <$> toId p) <*> mapM toII (tail ixs)
        | otherwise -> error' linst

  -- TODO
  LSetTupleElem tpl i val -> do
    let TTuple ts = typeOfLOpe tpl
    tplv <- toId tpl
    case ts !! fromIntegral i of
      TFloat -> do' =<< AFSt <$> toId val <*> return tplv <*> return (C i)
      _      -> do' =<< ASt  <$> toId val <*> return tplv <*> return (C i)
    return $ AMove tplv

  LGetTupleElem tpl i ->
    let TTuple ts = typeOfLOpe tpl in
    case ts !! fromIntegral i of
      TFloat -> AFLd <$> toId tpl <*> return (C i)
      _      -> ALd  <$> toId tpl <*> return (C i)

  where
    idii :: (Id -> IdOrImm -> AExpr) -> LOperand -> LOperand -> CamlV AExpr
    idii o x y = o <$> toId x <*> toII y

    -- 可換な場合(add,mul)
    idii':: (Id -> IdOrImm -> AExpr) -> LOperand -> LOperand -> CamlV AExpr
    idii' o x y
      | isVar x   = return $ o (opeId x) (opeII y)
      | isVar y   = return $ o (opeId y) (opeII x)
      | otherwise = idii o x y -- TODO
      | otherwise = errorShow "idii'" (x,y)

    ff :: (Id -> Id -> AExpr) -> LOperand -> LOperand -> CamlV AExpr
    ff o x y = o <$> toId x <*> toId y

    error' = errorShow "toAExpr: "

toATerminator :: LTerminator -> CamlV ()
toATerminator lterm = do' =<< case lterm of
  LRet Nothing    -> return $ ARet TUnit Nothing
  LRet (Just x)   -> ARet (typeOfLOpe x) <$> (Just <$> toII x)
  LCBr x lt lf    -> ACBr  <$> toId x <*> label lt <*> label lf
  LBr  l          -> ABr <$> label l
  LSwitch x l cls -> ASwitch <$> toId x <*> label l <*>
                       mapM (\(LInt i,l') -> (i,) <$> label l') cls

-----------------------
-- Support Functions --
-----------------------

bind :: Id -> AExpr -> CamlV ()
bind x ainst = do
  n <- lift $ instCount <+= 1
  {-modify ((n, x:=ainst):)-}
  _1 %= ((n, x:=ainst):)

do' :: AExpr -> CamlV ()
do' ainst    = do
  n <- lift $ instCount <+= 1
  {-modify ((n,Do ainst):)-}
  _1 %= ((n,Do ainst):)

label :: Label -> CamlV Label
label l = do
  fid <- use _2
  return $ addFID l fid

addFID :: Label -> FuncId -> Label
addFID (Label x) fid = Label (x++fid)

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
  | otherwise = errorShow "toId: " x

toII :: LOperand -> CamlV IdOrImm
toII x
  | isInt x   = C <$> return (opeInt x)
  | otherwise = V <$> toId x

toPhiVal :: LOperand -> CamlV PhiVal
toPhiVal x
  | isInt   x = return $ PVInt (opeInt x)
  | isVar   x = return $ PVVar (opeId x) (typeOfLOpe x) False
  | isFloat x = PVFloat <$> lift (floatLabel (opeFloat x))
  | otherwise = errorShow "toPhiVal" x

constToId :: LConst -> CamlV Id
constToId = \case
  LInt n   -> setInt n
  LFloat f -> setFloat f
  LGlobal (x,_) -> return x
  LConstTuple cs-> setConstTuple cs

  LUndef t -> case t of
    TTuple ts -> do x <- lift $ genId "tuple"
                    bind x AGetHP
                    do' $ AIncHP (C $ fromIntegral $ length ts)
                    return x
    TFloat    -> setFloat 0.00001
    _         -> setInt   32767
  c@LGetPtrC{} -> setInt =<< opePtrM (LConstOpe c)

constToII :: LConst -> CamlV IdOrImm
constToII = \case
  LInt n -> C <$> return n
  c      -> V <$> constToId c

----------------------------
-- Set and Return Id --
----------------------------

setInt :: Integer -> CamlV Id
setInt n = do
  x <- lift $ genId "tmpInt"
  bind x $ ASet n
  return x

setFloat :: Float -> CamlV Id
setFloat f = do
  x <- lift $ genId "tmpFloat"
  l <- lift (floatLabel f)
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
-- Other Functions
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

---------------------
-- Coerce (unsafe) --
---------------------

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
  lift.log $ show (c,cs)
  let ~(LGlobal (arr,_)) = c
      n = case cs of
        [LInt 0, LInt m] -> m
        _ -> error $ "opePtrM: " ++ show (c,cs)
  Just (addr,_,_) <- lift $ uses globalHeap (M.lookup arr)
  return $ addr+n

