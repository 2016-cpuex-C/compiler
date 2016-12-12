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
import MiddleEnd.LLVM.FrontEnd.Prog
import MiddleEnd.LLVM.MiddleEnd
import MiddleEnd.LLVM.BackEnd.Expr
import BackEnd.FirstArch.Virtual        (virtualCode)
import BackEnd.FirstArch.RegAlloc       (regAlloc)
import BackEnd.FirstArch.Simm           (simm)
import BackEnd.FirstArch.Emit           (emit)
import BackEnd.Second.Asm
import BackEnd.Second.FromLProg         (toAProg)
import BackEnd.Second.Virtual           (virtual)
{-import BackEnd.Second.RegAlloc.LivenessAnalysis-}
{-import BackEnd.Second.RegAlloc.Dominator-}
import BackEnd.Second.RegAlloc.Coloring (colorFun)
import BackEnd.Second.RegAlloc.SSA_Deconstruction

import           Prelude hiding         (lex, log, mod)
import           System.IO              (stdout, withFile, IOMode(..))
import           Data.FileEmbed
import qualified Data.ByteString.Char8  as BC
import           Control.Lens           (use)
import           Control.Lens.Operators
import           Options.Applicative
import           System.FilePath.Posix  ((-<.>))
import qualified Data.Map as M
import qualified Data.Set as S
import Control.Monad (forM, forM_, unless)

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
    in lg $ \h -> mapM_ (compile' s{_logfile=h}) (args opts)

-------------------------------------------------------------------------------
-- compile method
-------------------------------------------------------------------------------

compile' :: S -> FilePath -> IO ()
compile' s f = do
  input <- readFile f
  m <- flip runCaml s $ lex (libmincamlML ++ input)
        >>= parse
        >>= typing
        >>= kNormalize
        >>= alpha
        >>= optimise
        >>= lambdaLift
        >>= closureConvert
        >>= toLLVM
        >>= optimiseLLVM
        >>= return . toLProg
        >>= toAProg
        >>= virtual
        >>= \(AProg fs) -> forM (filter (not.isEmptyFun) fs) (\f -> do
                colorFun f
              )
  case m of
    Right x  -> writeFile "result.hs" $ show $ x
    Left err -> error $ f ++ ": " ++ show err



chromaticNum :: [M.Map Int (S.Set Id)] -> Int
chromaticNum = maximum . concatMap (map (S.size.snd) . M.toList)

compile :: S -> FilePath -> IO ()-- {{{
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
-- }}}

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

