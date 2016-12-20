{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Base
import FrontEnd.Lexer                   (lex)
import FrontEnd.Parser                  (parse)
import FrontEnd.Typing                  (typing)
import MiddleEnd.KNormal                (kNormalize)
import MiddleEnd.Alpha                  (alpha)
import MiddleEnd.Optimise               (optimise)
import MiddleEnd.Closure                (closureConvert)
import MiddleEnd.LambdaLifting          (lambdaLift)
import MiddleEnd.LLVM.FrontEnd.Prog     (toLLVM)
import MiddleEnd.LLVM.MiddleEnd         (optimiseLLVM)
import MiddleEnd.LLVM.BackEnd           (toLProg)
import BackEnd.Second.FromLProg         (toAProg)
import BackEnd.Second.Virtual           (virtual)
import BackEnd.Second.Emit              (emitProg)

import BackEnd.First.Virtual            (virtualCode)
import BackEnd.First.RegAlloc           (regAlloc)
import BackEnd.First.Simm               (simm)
import BackEnd.First.Emit               (emit)

import           Prelude hiding         (lex, log)
import           System.IO              (stdout, withFile, IOMode(..))
import           Data.FileEmbed         (embedFile)
import qualified Data.ByteString.Char8  as BC
import           Control.Lens           (use)
import           Control.Lens.Operators
import           Options.Applicative
import           System.FilePath.Posix  ((-<.>))

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = execParser (info (helper <*> parseOpt) fullDesc) >>= \opts ->
  let s = initialState & threshold     .~ inline opts
                       & optimiseLimit .~ iter opts
      withLogFile = case logf opts of
        Nothing -> ($ stdout)
        Just f  -> withFile f WriteMode
      compiler
        | first opts = compile1
        | otherwise  = compile2
  in withLogFile $ \h -> mapM_ (compiler s{_logfile=h}) (args opts)

-------------------------------------------------------------------------------
-- compile method
-------------------------------------------------------------------------------

-- 2nd compiler
compile2 :: S -> FilePath -> IO ()
compile2 s f = do
  input <- readFile f
  withFile (f -<.> "s") WriteMode $ \h -> do
    m <- flip runCaml s $ lex (libmincamlML ++ input)
          >>= parse
          >>= typing
          >>= kNormalize
          >>= alpha
          >>= optimise
          >>= \e -> do
                heap <- use globalHeap
                (log.show) heap
                return e
          >>= lambdaLift
          >>= closureConvert
          >>= toLLVM
          >>= optimiseLLVM
          >>= toLProg
          {->>= \e -> do-}
                {-log.show $ e-}
                {-return e-}
          >>= toAProg
          >>= virtual
          >>= \e -> do
                floats <- use constFloats
                (log.show) floats
                return e
          >>= emitProg h
    case m of
      Right _x  -> return()
      Left err -> error $ f ++ ": " ++ show err

-- 1st compiler
compile1 :: S -> FilePath -> IO ()-- {{{
compile1 s f = do
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
---- }}}

-------------------------------------------------------------------------------
-- library
-------------------------------------------------------------------------------

libmincamlML :: String
libmincamlML = BC.unpack $(embedFile "src/libmincaml.ml")

-------------------------------------------------------------------------------
-- command line options parser
-------------------------------------------------------------------------------

data MinCamlOptions
  = MinCamlOptions {
    inline  :: Int
  , iter    :: Int
  , logf    :: Maybe String
  , first   :: Bool
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
  <*> switch
    $$ short '1'
    <=> long "first"
    <=> help ("use first compiler")
  <*> some (argument str (metavar "FILES.."))
  where
    infixr 7 $$
    infixr 8 <=>
    ($$) :: (a -> b) -> a -> b
    ($$) = ($)
    (<=>) :: Monoid m => m -> m -> m
    (<=>) = (<>)

