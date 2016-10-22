{-# LANGUAGE LambdaCase #-}

module Common where

import Base
import FrontEnd.Lexer              (lex)
import FrontEnd.Parser             (parse)
import FrontEnd.Typing             (typing)
import MiddleEnd.KNormal           (kNormalize)
import MiddleEnd.Alpha             (alpha)
import MiddleEnd.Optimise          (optimise)
import MiddleEnd.Closure           (closureConvert)
import BackEnd.FirstArch.Virtual   (virtualCode)
import BackEnd.FirstArch.RegAlloc  (regAlloc)
import BackEnd.FirstArch.Simm      (simm)
import BackEnd.FirstArch.Emit      (emit)

import Prelude              hiding (lex)
import System.IO                   (openFile, withFile, IOMode(..))
import System.Process
import System.FilePath.Posix       ((<.>))
import Control.Lens                ((&),(.~))

-- compile "*.ml" file into "*.s"
compile :: FilePath -> IO (Either Error ())
compile ml = do
  s <- readFile ml
  devnull <- openFile "/dev/null" WriteMode
  withFile (mlToS ml) WriteMode $ \out ->
    (`runCaml` (initialState&logfile.~devnull)) $ lex s
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

