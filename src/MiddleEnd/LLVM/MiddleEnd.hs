{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.LLVM.MiddleEnd where

import Base (Caml, liftIO)
import Control.Monad.Except (void, runExceptT)

import LLVM.General.AST as AST
import LLVM.General.Module
import LLVM.General.Context
import LLVM.General.Analysis
import LLVM.General.PassManager

optimiseLLVM :: AST.Module -> Caml AST.Module
optimiseLLVM ast = liftIO $ do
  m <- withContext $ \ctx ->
    runExceptT $ withModuleFromAST ctx ast $ \m -> do
      writeFile "opt.ll" =<< moduleLLVMAssembly m
      runExceptT (verify m) >>= \case
        Left e -> error $ "LLVM.MiddleEnd.optimise: verify: " ++ e
        Right _ -> do
          withPassManager passes $ \pm -> do
            void $ runPassManager pm m
            writeFile "result.ll" =<< moduleLLVMAssembly m
            moduleAST m
  case m of
    Left e -> error $ "LLVM.MiddleEnd.optimise: " ++ e
    Right optast -> return optast

passes :: PassSetSpec
passes = defaultCuratedPassSetSpec { optLevel = Just 3 }


