{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.LLVM.FrontEnd.Expr where
{- [BasicBlock] -> -}

import Prelude hiding (div, EQ)

import Base
import MiddleEnd.Closure
import MiddleEnd.LLVM.FrontEnd.Base

import qualified Data.Map (Map)
import qualified Data.Map as M
import           Data.Word
import           Control.Lens
import           Control.Monad.Trans.Class (lift)

import           LLVM.General.AST hiding (Type)
import qualified LLVM.General.AST.IntegerPredicate as IP
import qualified LLVM.General.AST.CallingConvention as CC
import qualified LLVM.General.AST.FloatingPointPredicate as FP
import Control.Monad (forM, forM_, when)
import Data.List (zip4)

--まずは効率度外視でいってみよう
data LProg = LProg [LFunDef] LExpr
           deriving (Show,Eq)
data LFunDef = LFunDef {
    lname :: (Label, Type)
  , largs :: [(Id,Type)]
  , lbody :: LExpr
  }
data LExpr = LInt Integer
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
           | CIfEq     Id Id     CExpr CExpr
           | CIfLe     Id Id     CExpr CExpr
           | CLet      (Id,Type) CExpr CExpr
           | CVar      Id
           | CMakeCls  (Id,Type) Closure CExpr
           | CAppCls   Id [Id]
           | CAppDir   Label [Id]
           | CTuple    [Id]
           | CArray    Id Id
           | CArrayInit Label Id
           | CLetTuple [(Id,Type)] Id CExpr
           | CGet      Id Id
           | CPut      Id Id Id

