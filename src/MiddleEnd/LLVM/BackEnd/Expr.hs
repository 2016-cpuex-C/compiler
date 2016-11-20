{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE RecordWildCards #-}

module MiddleEnd.LLVM.BackEnd.Expr where
-- 作りかけ --

import Prelude hiding (div, EQ)

import Base
import MiddleEnd.LLVM.FrontEnd.Base

import qualified Data.Map (Map)
import qualified Data.Map as M
import           Data.Word
import           Control.Lens
import           Control.Monad.Trans.Class (lift)

import           LLVM.General.AST hiding (Type)
import qualified LLVM.General.AST as AST
import           LLVM.General.AST.Global
import qualified LLVM.General.AST.Global as G
import qualified LLVM.General.AST.IntegerPredicate as IP
import qualified LLVM.General.AST.CallingConvention as CC
import qualified LLVM.General.AST.FloatingPointPredicate as FP

import Control.Monad (forM, forM_, when)
import Data.Maybe    (catMaybes, mapMaybe)

data LProg = LProg [LFunDef] LInst
           deriving (Show,Eq)
data LInst = LInt Integer
           | LBool Bool
           | LFloat Float
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
           deriving (Show,Eq)
data LTerminator = LRet Id

data Bind a = Id ::= a | Do a

data LBlock = LBlock [Bind LInst] LTerminator

foo :: Instruction -> LInst
foo = undefined

foo' :: Terminator -> LTerminator
foo' = undefined

bar :: AST.Named Instruction -> Bind LInst
bar = undefined

baz :: BasicBlock -> LBlock
baz = undefined

-- あとオペランドの処理
--   + intはwordで帰ってくるので気をつけて 42億 -> 負の数

test :: Module -> [LFunDef]
test = mapMaybe globalFunction . globals

globals :: Module -> [Global]
globals mod = [ x | GlobalDefinition x <- moduleDefinitions mod ]

data LFunDef = LFunDef {
    lname :: (Label, Type)
  , largs :: [(Id,Type)]
  , lbody :: [BasicBlock] -- TODO
  } deriving (Show,Eq)

globalFunction :: Global -> Maybe LFunDef
globalFunction Function{..} = Just LFunDef {
    lname = (Label f, TFun argtys retty)
  , largs = map toArg $ fst parameters
  , lbody = basicBlocks
  }
  where
    Name f = name
    argtys = [ ty' t | Parameter t _ _ <- fst parameters ]
    retty  = TFun argtys (ty' returnType)
    toArg (Parameter t name' _) =
      case name' of Name x   -> (x,ty' t)
                    UnName n -> (show n, ty' t)
function _ = Nothing

globalArray :: Global -> Maybe LFunDef
globalArray = undefined

ty' :: AST.Type -> Type
ty' = \case
  VoidType                    -> TUnit
  IntegerType 1               -> TBool
  IntegerType 32              -> TInt
  FloatingPointType 32 IEEE   -> TFloat
  PointerType t _             -> TPtr (ty' t)
  ArrayType n t               -> TArray (fromIntegral n) (ty' t)
  StructureType _ ts          -> TTuple $ map ty' ts
  FunctionType retty argtys _ -> TFun (map ty' argtys) (ty' retty)
  t -> error $ "ty': " ++ show t

