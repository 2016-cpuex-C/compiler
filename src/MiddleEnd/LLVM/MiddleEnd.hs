{-# LANGUAGE LambdaCase #-}
module MiddleEnd.LLVM.MiddleEnd where

import Base (Caml, liftIO)
import Control.Monad.Except (void, runExceptT)

import LLVM.General.AST as AST hiding (FunctionAttributes)
import LLVM.General.Module
import LLVM.General.Context
import LLVM.General.Analysis
import LLVM.General.PassManager
import LLVM.General.Transforms

optimiseLLVM :: AST.Module -> Caml AST.Module
optimiseLLVM ast = liftIO $ do
  m <- withContext $ \ctx ->
    runExceptT $ withModuleFromAST ctx ast $ \m ->
      runExceptT (verify m) >>= \case
        Left e -> error $ "LLVM.MiddleEnd.optimise: verify: " ++ e
        Right _ ->
          withPassManager passSpec $ \pm -> do
          {-withPassManager passSpec' $ \pm -> do-}
            void $ runPassManager pm m
            writeFile "result.ll" =<< moduleLLVMAssembly m
            moduleAST m
  case m of
    Left e -> error $ "LLVM.MiddleEnd.optimise: " ++ e
    Right optast -> return optast

passSpec' :: PassSetSpec
passSpec' = defaultCuratedPassSetSpec {
    optLevel = Just 3
  , loopVectorize = Just True
  , unitAtATime = Just True
  , superwordLevelParallelismVectorize = Just False
  , useInlinerWithThreshold = Just 750
  }

passSpec :: PassSetSpec
passSpec = defaultPassSetSpec {
    transforms = [
        AggressiveDeadCodeElimination
      , BreakCriticalEdges
      , ConstantPropagation
      , CorrelatedValuePropagation
      , DeadCodeElimination
      , DeadInstructionElimination
      , DeadStoreElimination
      --, DemoteRegisterToMemory -- dame
      , EarlyCommonSubexpressionElimination
      , GlobalValueNumbering {
          noLoads = True
        }
      , InductionVariableSimplify
      , InstructionCombining
      , JumpThreading
      , LoopClosedSingleStaticAssignment
      , LoopInvariantCodeMotion
      , LoopDeletion
      , LoopIdiom
      , LoopInstructionSimplify
      , LoopRotate
      , LoopStrengthReduce
      , LoopUnroll {
          loopUnrollThreshold = Just 1000
        , count = Nothing
        , allowPartial = Nothing
        }
      , LoopUnswitch {
          optimizeForSize = True
        }
      , LowerAtomic
      , LowerInvoke
      , LowerSwitch
      , LowerExpectIntrinsic
      , MemcpyOptimization
      , PromoteMemoryToRegister
      , Reassociate
      , ScalarReplacementOfAggregates {
            requiresDominatorTree = True
        }
      , OldScalarReplacementOfAggregates {
            oldScalarReplacementOfAggregatesThreshold = Nothing
          , useDominatorTree      = True
          , structMemberThreshold = Nothing
          , arrayElementThreshold = Nothing
          , scalarLoadThreshold   = Nothing
        }
      , SparseConditionalConstantPropagation
        --, SimplifyLibCalls
      , SimplifyControlFlowGraph
      , Sinking
      , TailCallElimination

      -- here begin the Interprocedural passes
      , AlwaysInline {
          insertLifetime = True
        }
      , ArgumentPromotion
      , ConstantMerge
      , FunctionAttributes
      , FunctionInlining {
          functionInliningThreshold = 1000
        }
      , GlobalDeadCodeElimination
        --, InternalizeFunctions { exportList :: [String] }
      , InterproceduralConstantPropagation
      , InterproceduralSparseConditionalConstantPropagation
      , MergeFunctions
      --, PartialInlining -- Alloca
        --, PruneExceptionHandling
        --, StripDeadDebugInfo
        --, StripDebugDeclare
        --, StripNonDebugSymbols
        --, StripSymbols { onlyDebugInfo :: Bool }
    ]
  }

