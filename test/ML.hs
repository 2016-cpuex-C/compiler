{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module ML where

import Common

import           Prelude hiding (lex)
import           Control.Monad (forM_)
import           System.FilePath.Posix ((</>), (<.>))

import Test.Hspec

spec :: Spec
spec = describe "sim" $ forM_ targets $ \f -> do
  let ml  = "test" </> f <.> "ml"
      ans = "test" </> f <.> "ans"
  it ("passed " ++ ml) $ do
    x1 <- runML ml
    x2 <- readFile ans
    x1 `shouldBe` init x2 --最後の改行文字消す

targets :: [FilePath]
targets = [
    "ack"
  , "cls-rec"
  , "cls-reg-bug"
  , "even-odd"
  , "fib"
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
  , "non-tail-if"
  , "matmul"
  , "matmul-flat"
  , "spill2"
  , "non-tail-if2"

  -- closure 放置
  --, "adder"
  --, "cls-bug"
  --, "cls-bug2"
  --, "funcomp"

  -- spill 未実装
  -- , "spill"    spill
  -- , "spill3"

  -- llvmがZExtとかいう命令を使ってくる
  -- 桁が大きいからかな？ 放置
  --, "sum"
  --, "sum-tail"

  ]

