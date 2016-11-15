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
  void $ return ()
  m <- withContext $ \ctx -> do
    print ()
    runExceptT $ withModuleFromAST ctx ast $ \m -> do
      print ()
      writeFile "opt.ll" =<< moduleLLVMAssembly m
      runExceptT (verify m) >>= \case
        Left e -> error $ "LLVM.MiddleEnd.optimise: verify: " ++ e
        Right _ ->
          withPassManager passes $ \pm -> do
            void $ runPassManager pm m
            writeFile "opt.ll" =<< moduleLLVMAssembly m
            moduleAST m
  case m of
    Left e -> error $ "LLVM.MiddleEnd.optimise: " ++ e
    Right optast -> return optast

passes :: PassSetSpec
passes = defaultCuratedPassSetSpec { optLevel = Just 3 }


