{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Base
import FrontEnd.Lexer               (lex)
import FrontEnd.Parser              (parse)
import FrontEnd.Typing              (typing)
import MiddleEnd.KNormal            (kNormalize)
import MiddleEnd.Alpha              (alpha)
import MiddleEnd.Optimise           (optimise)
import MiddleEnd.Closure            (closureConvert)
import MiddleEnd.LambdaLifting      (lambdaLift)
import MiddleEnd.LLVM.FrontEnd.Prog
import MiddleEnd.LLVM.MiddleEnd
import BackEnd.FirstArch.Virtual    (virtualCode)
import BackEnd.FirstArch.RegAlloc   (regAlloc)
import BackEnd.FirstArch.Simm       (simm)
import BackEnd.FirstArch.Emit       (emit)

import           Prelude hiding        (lex, log, mod)
import           System.IO             (stdout, withFile, IOMode(..))
import           Data.FileEmbed
import qualified Data.ByteString.Char8 as BC
import           Control.Lens          (use)
import           Control.Lens.Operators
import           Options.Applicative
import           System.FilePath.Posix ((-<.>))

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = execParser (info (helper <*> parseOpt) fullDesc) >>= \opts ->
    let s = initialState & threshold     .~ inline opts
                         & optimiseLimit .~ iter opts
        lg = case logf opts of
          Nothing -> ($ stdout)
          Just f  -> withFile f WriteMode
    in lg $ \h -> mapM_ (toLLVM s{_logfile=h}) (args opts)

-------------------------------------------------------------------------------
-- compile method
-------------------------------------------------------------------------------

toLLVM :: S -> FilePath -> IO ()
toLLVM s f = do
  input <- readFile f
  m <- flip runCaml s $ lex (libmincamlML ++ input)
        >>= parse
        >>= typing
        >>= kNormalize
        >>= alpha
        >>= optimise
        >>= \e -> use globalHeap >>= log.show >> return e
        >>= lambdaLift
        >>= closureConvert
        -- >>= \e -> do {
        --               use globalHeap >>= log.show;
        --               use extTyEnv >>= log.show;
        --               log (show e);
        --               return e
        --               }
        >>= llvm
        -- >>= \ast -> log (show ast) >> return ast
        >>= optimiseLLVM
  case m of
    Right _mod -> return ()
    Left e -> error $ f ++ ": " ++ show e

compile :: S -> FilePath -> IO ()
compile s f = do
  input <- readFile f
  withFile (f -<.> "s") WriteMode $ \h -> do
    m <- (`runCaml` s) $ lex (libmincamlML ++ input)
      >>= parse
      >>= typing
      >>= kNormalize
      >>= alpha
      >>= optimise
      >>= lambdaLift
      >>= \e -> (use globalHeap >>= log.show) >> return e
      >>= closureConvert
      >>= virtualCode
      -- >>= \e -> do {
      --              {-use globalHeap >>= log.show;-}
      --              {-use extTyEnv >>= log.show;-}
      --              log (show e);
      --              return e
      --              }
      >>= simm
      >>= regAlloc
      >>= emit h
    case m of
      Right _ -> return ()
      Left e -> error $ f ++ ": " ++ show e

-------------------------------------------------------------------------------
-- library
-------------------------------------------------------------------------------

libmincamlML :: String
libmincamlML = BC.unpack $(embedFile "src/libmincaml.ml")

-------------------------------------------------------------------------------
-- command line options parser
-------------------------------------------------------------------------------

data MinCamlOptions = MinCamlOptions
                    { inline  :: Int
                    , iter    :: Int
                    , logf    :: Maybe String
                    , args    :: [String]
                    }

parseOpt :: Parser MinCamlOptions
parseOpt = pure MinCamlOptions
  <*> option auto
    $$  long "inline"
    <=> metavar "N"
    <=> help "maximum size of functions inlined"
    <=> value 0
    <=> showDefault
  <*> option auto
    $$  long "iter"
    <=> metavar "N"
    <=> help "maximum number of optimizations iterated"
    <=> value 100
    <=> showDefault
  <*> option (Just <$> str)
    $$  long "log"
    <=> metavar "FILE"
    <=> help "file to log to"
    <=> value Nothing
    <=> showDefaultWith (const "stdout")
  <*> some (argument str (metavar "FILES.."))
  where
    infixr 7 $$
    infixr 8 <=>
    ($$) :: (a -> b) -> a -> b
    ($$) = ($)
    (<=>) :: Monoid m => m -> m -> m
    (<=>) = (<>)

