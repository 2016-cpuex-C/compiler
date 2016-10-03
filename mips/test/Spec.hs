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
import Control.Monad (when)
import Shelly (shelly, run, silently, Sh)
import System.FilePath.Posix ((</>), (<.>))
import Data.Text (Text, pack)
import qualified Data.Text.IO as TIO
default (Text)

targets :: [FilePath]
targets = [
    "inprod"        -- !!!
  , "inprod-rec"    -- !!!
  , "inprod-loop"   -- !!!
  , "cls-bug2"      -- !!!
  , "matmul"        -- !!!
  , "matmul-flat"   -- !!!
  , "non-tail-if2"  -- !!!
  , "spill2"        -- !!!
  ]

ugoitargets :: [FilePath]
ugoitargets = [
    "ack"
  , "adder"
  , "cls-bug"
  , "cls-rec"
  , "cls-reg-bug"
  , "even-odd"
  , "fib"
  , "funcomp"
  , "gcd"
  , "inprod-int"
  , "join-reg"
  , "join-reg2"
  , "join-stack"
  , "join-stack2"
  , "join-stack3"
  , "non-tail-if"
  , "print"
  , "shuffle"
  , "spill"
  , "spill3"
  , "sum"
  , "sum-tail"
  ]

main :: IO ()
main = do
  mapM_ test targets

test :: FilePath -> IO ()
test f = do
  putStrLn $ "[[" ++ f ++ "]]"
  m <- compile $ "test" </> f
  case m of
    Right () -> shelly $ do
      res <- exe   $ "test" </> f <.> "s"
      ans <- read' $ "test" </> f <.> "ans"
      liftIO $ do
        putStr "result: " >> TIO.putStr res
        putStr "answer: " >> TIO.putStr ans
      when (res/=ans) $ error f
    Left e -> error $ f ++ ":" ++ show e
  where
    read' file = pack <$> liftIO (readFile file)

-- 使うときは適宜修正してください
-- Marsのインストールが必要です
exe :: FilePath -> Sh Text
exe s = silently $ run "java" options
  where
    options = ["-jar", "/home/hogeyama/apps/Mars4_5.jar", "me", src]
    src = pack s

compile :: FilePath -> IO (Either Error ())
compile f = do
  s <- readFile (f <.> "ml")
  withFile (f <.> "s") WriteMode $ \out ->
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
      >>= emit out


