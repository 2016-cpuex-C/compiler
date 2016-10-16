{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Unit where

import Common
import XFormat.Util

import Prelude hiding (lex, (^))
import Text.Printf
import Text.XFormat.Show
import System.Process
import System.FilePath.Posix ((<.>))

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Monadic

spec :: Spec
spec = do
  let equal1 f g' = equal1' f (showf g')
      equal1' f g x = monadicIO $ do
        y <- run $ sim $ g x
        assert $ y == f x

      equal2 f g' = equal2' f (showf g')
      equal2' f g x y = monadicIO $ do
        z <- run $ sim $ g x y
        assert $ z == f x y

  describe "sim float_of_int" $ do
    it "is equal to fromIntegral" $ property $
      equal1 (fromIntegral::Int->Float) ("print_float(float_of_int(".%dd^"))".@0)
  describe "sim int_of_float" $ do
    it "is equal to truncate" $ property $
      equal1 (truncate::Float->Int)  ("print_int(int_of_float(".%ff^"))".@0)

  describe "sim sin" $ do
    it "is equal to Prelude.sin" $ property $
      equal1 sin ("print_float(sin(".%ff^"))".@0)
  describe "sim cos" $ do
    it "is equal to Prelude.cos" $ property $
      equal1 cos ("print_float(cos(".%ff^"))".@0)
  describe "sim atan" $ do
    it "is equal to Prelude.atan" $ property $
      equal1 atan ("print_float(atan(".%ff^"))".@0)

  describe "sim truncate" $ do
    it "is equal to truncate" $ property $
      equal1 (truncate::Float->Int) ("print_int(truncate(".%ff^"))".@0)

  describe "sim fneg" $ do
    it "is equal to \\x->(-x)" $ property $
      equal1 (\x->(-x)) ("print_float(fneg(".%ff^"))".@0)
  describe "sim fabs" $ do
    it "is equal to abs" $ property $
      equal1 abs ("print_float(fabs(".%ff^"))".@0)
  describe "sim floor" $ do
    it "is equal to floor" $ property $
      equal1 floorFF ("print_float(floor(".%ff^"))".@0)

  describe "sim (*)" $ do
    it "is equal to (*)" $ property $
      equal2 (*) ("print_int((".%dd^") * (".%dd^"))".@0)

  describe "sim xor" $ do
    let w x y = printf "if xor %s %s then print_int 1 else print_int 0" x y
    it "is equal to xor" $ do
      sim (w "true"  "true" ) `shouldReturn` (0::Int)
      sim (w "true"  "false") `shouldReturn` (1::Int)
      sim (w "false" "true" ) `shouldReturn` (1::Int)
      sim (w "false" "false") `shouldReturn` (0::Int)

floorFF :: Float -> Float
floorFF = fromIntegral . (floor::Float->Int)

sim :: (Read a) => String -> IO a
sim str = writeFile tmpML str >> read <$> runTmpML

runTmpML :: IO String
runTmpML = do
  compile tmpML >>= \case
    Right _ -> readProcess "./simulator/sim" [tmpS] ""
    Left e -> error $ show e

tmpHead, tmpML, tmpS :: FilePath
tmpHead = "/tmp/min-caml-hs"
tmpML   = tmpHead <.> "ml"
tmpS    = tmpHead <.> "s"

