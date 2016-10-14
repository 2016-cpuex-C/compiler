{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module ML where

import           Prelude hiding (lex)
import           Control.Monad.IO.Class (liftIO)
import           Control.Monad (when)
import           Shelly (shelly, run, silently, Sh)
import           Data.Text (Text, pack)
import qualified Data.Text.IO as TIO
import           System.FilePath.Posix ((</>), (<.>))

import Common

default (Text)

targets :: [FilePath]
targets = [
    "ack"
  , "adder"
  , "cls-bug"
  , "cls-bug2"
  , "cls-rec"
  , "cls-reg-bug"
  , "even-odd"
  , "fib"
  , "funcomp"
  , "gcd"
  , "inprod"
  , "inprod-rec"
  , "inprod-loop"
  , "join-reg"
  , "join-reg2"
  , "join-stack"
  , "join-stack2"
  , "join-stack3"
  , "print"
  , "shuffle"
  , "spill"
  , "spill2"
  , "spill3"
  , "sum"
  , "sum-tail"
  , "non-tail-if"
  , "non-tail-if2"
  , "matmul"
  , "matmul-flat"
  ]

useSim :: Bool
useSim = False

onlyCompile :: Bool
onlyCompile = False

test :: IO ()
test = mapM_ hoge $ targets

hoge :: FilePath -> IO ()
hoge f = do
  putStrLn $ "[[" ++ f ++ "]]"
  m <- compile $ "test" </> f <.> "ml"
  case m of
    Right () -> shelly $ do
      res <- (if useSim then exeSim else exeMars) $ "test" </> f <.> "s"
      ans <- read' $ "test" </> f <.> "ans"
      liftIO $ do
        putStr "result: " >> TIO.putStr res
        putStr "answer: " >> TIO.putStr ans
      when (res/=ans && not onlyCompile) $ error f
    Left e -> error $ f ++ ":" ++ show e
  where
    read' file = pack <$> liftIO (readFile file)

-- 使うときは適修正してください
-- Marsのインストールが必要です
exeMars :: FilePath -> Sh Text
exeMars s = silently $ run "java" ["-jar", "/home/hogeyama/apps/Mars4_5.jar", "me", pack s]
exeSim :: FilePath -> Sh Text
exeSim s = silently $ run "./simulator/sim" ["<", pack s]

