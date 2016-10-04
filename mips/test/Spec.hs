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

useSim :: Bool
useSim = False

onlyCompile :: Bool
onlyCompile = True

targets :: [FilePath]
targets = [
    "inprod-rec"
  , "inprod-loop"
  , "matmul"
  , "matmul-flat"
  , "non-tail-if2"
  , "spill2"
  , "cls-bug2"
  ]

-- simで動いかないやつ
-- non-tail-if l.sが原因
-- inprod      同上
-- shuffle     no label found?
-- funcomp     わからず

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
  , "inprod"
  , "join-reg"
  , "join-reg2"
  , "join-stack"
  , "join-stack2"
  , "join-stack3"
  , "print"
  , "shuffle"
  , "spill"
  , "spill3"
  , "sum"
  , "sum-tail"
  , "non-tail-if"
  ]

main :: IO ()
main = do
  mapM_ test $ ugoitargets -- ++ targets

test :: FilePath -> IO ()
test f = do
  putStrLn $ "[[" ++ f ++ "]]"
  m <- compile $ "test" </> f
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


