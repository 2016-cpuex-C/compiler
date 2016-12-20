{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE RecordWildCards #-}

module MiddleEnd.LLVM.BackEnd where

import Prelude hiding (div, Ordering(..))

import Base

import           Data.Maybe (mapMaybe)
import           LLVM.General.AST hiding (Type,Named(..))
import qualified LLVM.General.AST as AST
import           LLVM.General.AST.Global
import qualified LLVM.General.AST.Float as F
import qualified LLVM.General.AST.Constant as C
import qualified LLVM.General.AST.IntegerPredicate as IP
import qualified LLVM.General.AST.FloatingPointPredicate as FP

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type LProg = [LFunDef]

data LFunDef = LFunDef {
    lname :: (Label, Type)
  , largs :: [(Id,Type)]
  , lbody :: [LBlock]
  } deriving (Show,Eq)

data LBlock = LBlock Label [Named LInst] LTerminator
            deriving (Show,Eq)

data LInst
  = LAdd      LOperand LOperand
  | LSub      LOperand LOperand
  | LMul      LOperand LOperand
  | LDiv      LOperand LOperand
  | LFAdd     LOperand LOperand
  | LFSub     LOperand LOperand
  | LFMul     LOperand LOperand
  | LFDiv     LOperand LOperand
  | LSll      LOperand LOperand
  | LSrl      LOperand LOperand
  | LAnd      LOperand LOperand
  | LOr       LOperand LOperand
  | LXor      LOperand LOperand
  | LLoad     LOperand
  | LStore    LOperand LOperand
  | LICmp     Predicate LOperand LOperand
  | LFCmp     Predicate LOperand LOperand
  | LPhi      [(LOperand,Label)]
  | LSelect   LOperand LOperand LOperand
  | LCall     LOperand [LOperand]
  | LSetTupleElem LOperand Integer LOperand -- LSetTuple t i x == t&_i.~x
  | LGetTupleElem LOperand Integer          -- LGetTuple t i   == t^._i
  | LGetPtr   LOperand [LOperand]
  deriving (Show,Eq)

data LTerminator
  = LRet    (Maybe LOperand)
  | LCBr    LOperand Label Label
  | LBr     Label
  | LSwitch LOperand Label [(LConst, Label)]
  deriving (Show,Eq)

data LOperand
  = LVar (Id, Type)
  | LConstOpe LConst
  deriving (Show,Eq)

data LConst
  = LInt Integer
  | LFloat Float
  | LGetPtrC LConst [LConst]
  | LGlobal (Id, Type)
  | LConstTuple [LConst]
  | LUndef Type
  deriving (Show, Eq)

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

toLProg :: AST.Module -> Caml LProg
toLProg = return . mapMaybe globalFunction . globals

-------------------------------------------------------------------------------
-- 大
-------------------------------------------------------------------------------

globals :: AST.Module -> [Global]
globals m = [ x | GlobalDefinition x <- moduleDefinitions m ]

globalFunction :: Global -> Maybe LFunDef
globalFunction Function{..} = Just LFunDef {
    lname = (Label f, TFun argtys retty)
  , largs = map toArg $ fst parameters
  , lbody = map basicBlock basicBlocks
  }
  where
    Name f = name
    argtys = [ ty' t | Parameter t _ _ <- fst parameters ]
    retty  = ty' returnType
    toArg (Parameter t name' _) = (fromName name' ,ty' t)
globalFunction _ = Nothing

basicBlock :: AST.BasicBlock -> LBlock
basicBlock ~(AST.BasicBlock n ninsts (AST.Do term)) =
  LBlock (nameToLabel n) (map (named inst) ninsts) (terminator term)

-------------------------------------------------------------------------------
-- 中
-------------------------------------------------------------------------------

inst :: Instruction -> LInst
inst e | not (null (metadata e)) = error $ "inst: " ++ show e
       | otherwise = case e of
  -- binary operations
  ----------------------
  Add _ _ x y _ -> LAdd  (op x) (op y)
  Sub _ _ x y _ -> LSub  (op x) (op y)
  Mul _ _ x y _ -> LMul  (op x) (op y)
  SDiv _  x y _ -> LDiv  (op x) (op y)
  FAdd _  x y _ -> LFAdd (op x) (op y)
  FSub _  x y _ -> LFSub (op x) (op y)
  FMul _  x y _ -> LFMul (op x) (op y)
  FDiv _  x y _ -> LFDiv (op x) (op y)
  LShr _  x y _ -> LSrl  (op x) (op y) -- TODO
  Shl _ _ x y _ -> LSll  (op x) (op y)
  And     x y _ -> LAnd  (op x) (op y)
  Or      x y _ -> LOr   (op x) (op y)
  Xor     x y _ -> LXor  (op x) (op y)
  ICmp  p x y _ -> LICmp (ipred p) (op x) (op y)
  FCmp  p x y _ -> LFCmp (fpred p) (op x) (op y)

  -- others
  -----------
  Load _ addr _ _ _           -> LLoad (op addr)
  Store _ addr val _ _ _      -> LStore (op val) (op addr)
  Select cond vt vf _         -> LSelect (op cond) (op vt) (op vf)
  Phi _ xls _                 -> LPhi [(op x, Label (fromName l)) | (x,l) <- xls ]
  Call _ _ _ (Right f) xs _ _ -> LCall (op f) (map (op.fst) xs)

  GetElementPtr _ addr ixs _ -> LGetPtr (op addr) (map op ixs)
  InsertValue tpl val [ix] _ -> LSetTupleElem (op tpl) (fromIntegral ix) (op val)
  ExtractValue tpl [ix] _    -> LGetTupleElem (op tpl) (fromIntegral ix)

  _ -> error'
  where error' = error $ "inst: " ++ show e

terminator :: Terminator -> LTerminator
terminator = \case
  Ret x   [] -> LRet (op <$> x)
  Br dest [] -> LBr (nameToLabel dest)
  CondBr x dest_t dest_f [] ->
    LCBr (op x) (nameToLabel dest_t) (nameToLabel dest_f)
  Switch x dn cds [] ->
    LSwitch (op x) (nameToLabel dn) [(const' c, nameToLabel d)| (c,d) <- cds ]
  e -> error $ show e

ipred :: IP.IntegerPredicate -> Predicate
ipred = \case
  IP.EQ  -> EQ
  IP.NE  -> NE
  IP.UGT -> GT
  IP.SGT -> GT
  IP.UGE -> GE
  IP.SGE -> GE
  IP.ULT -> LT
  IP.SLT -> LT
  IP.ULE -> LE
  IP.SLE -> LE

fpred :: FP.FloatingPointPredicate -> Predicate
fpred = \case
  FP.OEQ -> EQ
  FP.UEQ -> EQ
  FP.ONE -> NE
  FP.UNE -> NE
  FP.OGT -> GT
  FP.UGT -> GT
  FP.OGE -> GE
  FP.UGE -> GE
  FP.OLT -> LT
  FP.ULT -> LT
  FP.OLE -> LE
  FP.ULE -> LE
  FP.UNO   -> error "fpred: UNO"
  FP.ORD   -> error "fpred: ORD"
  FP.False -> error "fpred: False"
  FP.True  -> error "fpred: True"

op :: AST.Operand -> LOperand
op = \case
  LocalReference t name -> LVar (fromName name, ty' t)
  ConstantOperand c -> LConstOpe (const' c)
  e -> error $ "ope: " ++ show e

typeOfLOpe :: LOperand -> Type
typeOfLOpe (LVar (_,t)) = t
typeOfLOpe (LConstOpe c) = typeOfLConst c

typeOfLConst :: LConst -> Type
typeOfLConst = \case
  LInt{} -> TInt
  LFloat{} -> TFloat
  LGlobal(_,t) -> t
  LConstTuple cs -> TTuple $ map typeOfLConst cs
  LUndef t -> t
  LGetPtrC c cs -> f (typeOfLConst c) cs
    where
      f t [] = TPtr t
      f t (_:is) = case t of
        TPtr t'     -> f t' is
        TArray _ t' -> f t' is
        _ -> error "223"

const' :: C.Constant -> LConst
const' c = case c of
  C.Int _ i -> LInt (toSigned32 i)
  C.Float (F.Single f) -> LFloat f

  C.GetElementPtr _ c' cs -> LGetPtrC (const' c') (map const' cs)
  C.GlobalReference t n   -> LGlobal (fromName n, ty' t)
  C.Struct _ _ cs -> LConstTuple (map const' cs)
  C.Undef t -> LUndef (ty' t)
  C.Null _t -> error'
  _ -> error'
  where
    error' = error $
      "MiddleEnd.LLVM.BackEnd.Expr: const': not implemented: " ++ show c

ty' :: AST.Type -> Type
ty' = \case
  VoidType                    -> TUnit
  IntegerType 1               -> TBool
  IntegerType 32              -> TInt
  FloatingPointType 32 IEEE   -> TFloat
  PointerType t _             -> TPtr (ty' t)
  ArrayType n t               -> TArray (fromIntegral n) (ty' t)
  StructureType _ ts          -> TTuple (map ty' ts)
  FunctionType retty argtys _ -> TFun (map ty' argtys) (ty' retty)
  t -> error $ "ty': " ++ show t

-------------------------------------------------------------------------------
-- 小
-------------------------------------------------------------------------------

toSigned32 :: Integer -> Integer
toSigned32 n
  | n >= 2^(31::Int) = - (2^(32::Int) - n)
  | otherwise        = n

fromName :: AST.Name -> Id
fromName (Name x) = x
fromName (UnName n) = show n

named :: (a -> b) -> AST.Named a -> Named b
named f (n AST.:= y) = fromName n := f y
named f (AST.Do y)   = Do (f y)

nameToLabel :: AST.Name -> Label
nameToLabel = Label . fromName

