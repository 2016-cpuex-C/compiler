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
import System.IO (withFile, IOMode(..))
import Control.Monad.IO.Class (liftIO)
--import Control.Monad (forM_, when)
--import qualified Shelly as Sh
--import Shelly (shelly, run, silently, rm, fromText, (</>), (<.>), liftIO, Sh)
--import Data.Text (Text, pack)
--import qualified Data.Text.IO as TIO
--default (Text)

main :: IO ()
main =
  unit "test/test" >>= \case
    Right () -> return ()
    Left e -> print e


unit :: FilePath -> IO (Either Error ())
unit f = do
  s <- readFile (f ++ ".ml")
  withFile (f ++ ".s") WriteMode $ \out ->
    runCamlDefault $ do
      tks <- lex s
      e <- parse tks
      e <- typing e
      e <- kNormalize e
      e <- alpha e
      e <- optimise e
      e <- closureConvert e
      {-liftIO $ putStrLn "" >> print e-}
      e <- virtualCode e
      {-liftIO $ putStrLn "" >> print e-}
      e <- simm e
      {-liftIO $ putStrLn "" >> print e-}
      e <- regAlloc e
      {-liftIO $ putStrLn "" >> print e-}
      emit out e


targets :: [FilePath]
targets = [
    "ack"
  , "adder"
  , "cls-bug2"
  , "cls-bug"
  , "cls-rec"
  , "cls-reg-bug"
  , "even-odd"
  , "fib"
  , "funcomp"
  , "gcd"
  , "inprod"
  , "inprod-int"
  , "inprod-rec"
  , "inprod-loop"
  , "join-reg"
  , "join-reg2"
  , "join-stack"
  , "join-stack2"
  , "join-stack3"
  , "matmul"
  , "matmul-flat"
  , "non-tail-if"
  , "non-tail-if2"
  , "print"
  , "shuffle"
  , "spill"
  , "spill2"
  , "spill3"
  , "sum"
  , "sum-tail"
  ]
