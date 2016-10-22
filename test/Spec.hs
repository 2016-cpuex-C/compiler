{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}

import ML
import Unit
import Common

import Test.Hspec
import Text.XFormat.Show

main :: IO ()
main = do
  putStrLn $ "test is not implemented. "
          ++ "only compile ./test/*.ml"
  mapM_ compile $ map (\f -> "./test/"++f++".ml") targets

