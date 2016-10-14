{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Unit where

import Common

import           Prelude hiding (lex)
import           Text.Printf
import           System.Process
import           System.FilePath.Posix ({-(</>),-} (<.>))

test :: IO ()
test = do
  print =<< simSin 1.57
  print =<< simFtoi 1.57

simFF :: Read a => String -> Float -> IO a
simFF func f = do
  writeFile tmpML $ printf "print_float (%s %f)" func f
  read <$> runTmpML

simSin :: Float -> IO Float
simSin = simFF "sin"

simFtoi :: Float -> IO Float
simFtoi = simFF "int_of_float"

runTmpML :: IO String
runTmpML = compile tmpML >> readProcess "./simulator/sim" [tmpS] ""

tmpHead, tmpML, tmpS :: FilePath
tmpHead = "/tmp/min-caml-hs"
tmpML   = tmpHead <.> "ml"
tmpS    = tmpHead <.> "s"

