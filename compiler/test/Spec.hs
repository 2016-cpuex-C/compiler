{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}

import ML
import Unit
import Common

import Test.Hspec
import Text.XFormat.Show

main :: IO ()
main = do
  hspec ML.spec
  hspec Unit.spec

