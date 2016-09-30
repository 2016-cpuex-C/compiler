{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

import AllTypes (runCamlDefault, Error)
import Lexer    (lex)
import Parser   (parse)
import Typing   (typing)
import KNormal  (kNormalize)
import Alpha    (alpha)
import Optimise (optimise)
import Closure  (closureConvert)
import Virtual  (virtualCode)
import RegAlloc (regAlloc)
import Simm     (simm)
import Emit     (emit)

import Prelude hiding (lex)
import Control.Monad (forM_, when)
import System.IO (readFile, withFile, IOMode(..))
import qualified Shelly as Sh
import Shelly (shelly, run, silently, rm, fromText, (</>), (<.>), liftIO, Sh)
import Data.Text (Text, pack)
import qualified Data.Text.IO as TIO
default (Text)

targets :: [FilePath]
targets = [
    "ack"
--  , "adder"
--  , "cls-bug2"
--  , "cls-bug"
--  , "cls-rec"
--  , "cls-reg-bug"
--  , "even-odd"
--  , "fib"
--  , "funcomp"
--  , "gcd"
--  , "inprod"
--  , "inprod-int"
--  , "inprod-rec"
--  , "inprod-loop"
--  , "join-reg"
--  , "join-reg2"
--  , "join-stack"
--  , "join-stack2"
--  , "join-stack3"
--  , "matmul"
--  , "matmul-flat"
--  , "non-tail-if"
--  , "non-tail-if2"
--  , "print"
--  , "shuffle"
--  , "spill"
--  , "spill2"
--  , "spill3"
--  , "sum"
--  , "sum-tail"
  ]

main :: IO ()
main = do
  error "not implemented"
  --mapM_ test targets
  --putStrLn $ "\n\tcompleted " ++ show (length targets) ++ " tests"

test :: FilePath -> IO ()
test f = do
  putStrLn $ "[[" ++ f ++ "]]"
  m <- unit $ "test/" ++ f
  case m of
    Right _ -> shelly $ do
      res <- exeMinCaml $ "test/" ++  f ++ "-res"
      ans <- exeOCaml   $ "test/" ++  f
      liftIO $ do
        putStr "result: " >> TIO.putStr res
        putStr "answer: " >> TIO.putStr ans
      when (res/=ans) $ error f
    Left e -> error $ f ++ ": " ++ show e

exeMinCaml :: FilePath -> Sh Text
exeMinCaml s = silently $ run "gcc" options >> (run outp [] <* rm outp)
  where
    options = ["-g", "-O2", "-Wall", "-m32"] ++ sources ++ ["-lm", "-o", out]
    sources = map pack [s ++ ".s", "libmincaml.S", "stub.c"]
    out  = pack s
    outp = "." </> s

exeOCaml :: FilePath -> Sh Text
exeOCaml s = silently $ run "ocamlc" options >> (run outp [] <* rm outp)
  where
    options = [source, "-o", out]
    source = pack $ s ++ ".ml"
    outp = "." </> s
    out  = pack s

unit :: FilePath -> IO (Either Error ())
unit f = do
  s <- readFile (f ++ ".ml")
  withFile (f ++ "-res.s") WriteMode $ \out ->
    runCamlDefault $ lex s
    >>= parse
    >>= typing
    >>= kNormalize
    >>= alpha
    >>= optimise
    >>= closureConvert
    >>= virtualCode
    >>= simm
    >>= regAlloc
    -- >>= (\e -> liftIO (print e) >> return e)
    >>= emit out

