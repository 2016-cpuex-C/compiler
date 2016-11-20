{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.LLVM.FrontEnd.Prog where

import Base
import MiddleEnd.Closure
import MiddleEnd.LLVM.FrontEnd.Base
import MiddleEnd.LLVM.FrontEnd.Expr

import qualified Data.Map as M
import           LLVM.General.AST hiding (Type)

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

llvm :: CProg -> Caml Module
llvm = runLLVM initialLLVMState . llvmProg

-------------------------------------------------------------------------------
-- Prog
-------------------------------------------------------------------------------

llvmProg :: CProg -> LLVM ()
llvmProg (CProg fundefs e) = do
    extEnv       <- M.toList <$> lift externalEnv
    glblArrayEnv <- M.toList <$> lift globalArrayEnv
    mapM_ defExternal    extEnv
    mapM_ defGlobalArray glblArrayEnv
    let glblEnv = extEnv ++ glblArrayEnv ++ glblFunEnv
    mapM_ (llvmFunDef glblEnv) (main':fundefs)
  where
    main' = CFunDef (Label "main", TFun [] TUnit) [] [] e
    glblFunEnv = map (\(CFunDef (Label x,t) _ _ _) -> (x,t)) fundefs

-------------------------------------------------------------------------------
-- FunDef
-------------------------------------------------------------------------------

llvmFunDef :: [(Id,Type)] -> CFunDef -> LLVM ()
llvmFunDef glblEnv (CFunDef (Label x, t) yts [] body) = do
    let env = (x,t) : yts ++ glblEnv
    blks <- exprToBlocks env body
    defFunction (x,t) yts blks

llvmFunDef _ fundef = error $ "Closure dame: " ++ show fundef

