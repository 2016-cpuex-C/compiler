{-# LANGUAGE LambdaCase #-}

import ML
import Unit

import Test.Hspec

main :: IO ()
main = do
  hspec Unit.spec

