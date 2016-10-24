{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}

import ML
import Unit
import Common

import Test.Hspec
import Text.XFormat.Show

main :: IO ()
main = do
  --hspec ML.spec
  hspec Unit.spec
  --putStrLn $ "test is not implemented. "
  --        ++ "only compile ./test/*.ml"
  --mapM_ compile $ map (\f -> "./test/"++f++".ml") targets

