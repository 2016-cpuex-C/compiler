{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}

module Common where

import Base
import FrontEnd.Lexer                 (lex)
import FrontEnd.Parser                (parse)
import FrontEnd.Typing                (typing)
import MiddleEnd.KNormal              (kNormalize)
import MiddleEnd.Alpha                (alpha)
import MiddleEnd.Optimise             (optimise)
import MiddleEnd.LambdaLifting        (lambdaLift)
import MiddleEnd.Closure              (closureConvert)

import MiddleEnd.LLVM.FrontEnd.Prog   (toLLVM)
import MiddleEnd.LLVM.MiddleEnd       (optimiseLLVM)
import MiddleEnd.LLVM.BackEnd         (toLProg)
import BackEnd.Second.FromLProg       (toAProg)
import BackEnd.Second.Virtual         (virtual)
import BackEnd.Second.SaveAndRestore  (saveAndRestore)
import BackEnd.Second.Optimise        (optimiseA)
import BackEnd.Second.Emit            (emitProg)

import Prelude                        hiding (lex)
import System.IO                      (openFile, withFile, IOMode(..))
import System.Process
import System.FilePath.Posix          ((<.>))
import Control.Lens                   ((&),(.~))

import           Data.FileEmbed
import qualified Data.ByteString.Char8 as BC

-- compile "*.ml" file into "*.s"
compile :: FilePath -> IO (Either Error ())
compile ml = do
  s <- readFile ml
  devnull <- openFile "/dev/null" WriteMode
  withFile (mlToS ml) WriteMode $ \out ->
    (`runCaml` (initialState&logfile.~devnull
                            &threshold.~50))
    $ lex (libmincamlML ++ s)
      >>= parse
      >>= typing
      >>= kNormalize
      >>= alpha
      >>= optimise
      >>= lambdaLift
      >>= closureConvert
      >>= toLLVM
      >>= optimiseLLVM
      >>= toLProg
      >>= toAProg
      >>= virtual
      >>= optimiseA
      >>= saveAndRestore
      >>= emitProg out

-- first
--compile :: FilePath -> IO (Either Error ())-- {{{
--compile ml = do
--  s <- readFile ml
--  devnull <- openFile "/dev/null" WriteMode
--  withFile (mlToS ml) WriteMode $ \out ->
--    (`runCaml` (initialState&logfile.~devnull
--               )
--    )   $ lex (libmincamlML ++ s)
--      >>= parse
--      >>= typing
--      >>= kNormalize
--      >>= alpha
--      >>= optimise
--      >>= lambdaLift
--      >>= closureConvert
--      >>= virtualCode
--      >>= simm
--      >>= regAlloc
--      >>= emit out-- }}}

runML :: FilePath -> IO String
runML ml = compile ml >>= \case
    Right _ -> runSim $ mlToS ml
    Left e -> error $ "compile error: " ++ ml ++ ": " ++ show e

runSim :: FilePath -> IO String
runSim s = readProcess "../simulator/sim" [s] ""

sim :: (Read a) => String -> IO a
sim str = writeFile tmpML str >> read <$> runML tmpML

tmpML :: FilePath
tmpML = "/tmp/min-caml-hs.ml"

mlToS :: FilePath -> FilePath
mlToS ml = take (length ml - 3) ml <.> "s"

libmincamlML :: String
libmincamlML = BC.unpack $(embedFile "src/libmincaml.ml")

