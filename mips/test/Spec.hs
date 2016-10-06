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

ugokanakattargets :: [FilePath]
ugokanakattargets = [
  ]

-- spill2 と funcomp と non-tail-if2 がうごかなくなった
ugoitargets :: [FilePath]
ugoitargets = [
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
  , "sum" -- nが大きいとkernel領域に入ってしまうので注意 (on Mars)
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

main :: IO ()
main = do
  mapM_ test $ ugoitargets
  mapM_ test $ ugokanakattargets

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
      {->>= \e -> liftIO (print e) >> return e-}
      >>= emit out


