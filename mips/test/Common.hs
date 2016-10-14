
module Common where

import Base
import FrontEnd.Lexer        (lex)
import FrontEnd.Parser       (parse)
import FrontEnd.Typing       (typing)
import MiddleEnd.KNormal     (kNormalize)
import MiddleEnd.Alpha       (alpha)
import MiddleEnd.Optimise    (optimise)
import MiddleEnd.Closure     (closureConvert)
import BackEnd.Mips.Virtual  (virtualCode)
import BackEnd.Mips.RegAlloc (regAlloc)
import BackEnd.Mips.Simm     (simm)
import BackEnd.Mips.Emit     (emit)

import           Prelude hiding (lex)
import           System.IO (withFile, IOMode(..))
import           System.FilePath.Posix ({-(</>),-} (<.>))

compile :: FilePath -> IO (Either Error ())
compile f = do
  s <- readFile f
  withFile (take (length f - 3) f <.> "s") WriteMode $ \out ->
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
      >>= emit out

