
module Main where

import Base
import FrontEnd.Lexer             (lex)
import FrontEnd.Parser            (parse)
import FrontEnd.Typing            (typing)
import MiddleEnd.KNormal          (kNormalize)
import MiddleEnd.Alpha            (alpha)
import MiddleEnd.Optimise         (optimise)
import MiddleEnd.Closure          (closureConvert)
import MiddleEnd.LambdaLifting    (lambdaLift)
import BackEnd.FirstArch.Virtual  (virtualCode)
import BackEnd.FirstArch.RegAlloc (regAlloc)
import BackEnd.FirstArch.Simm     (simm)
import BackEnd.FirstArch.Emit     (emit)

import           Prelude hiding        (lex, log)
import           System.IO             (stdout, withFile, IOMode(..))
import qualified Data.Map as M
import           Control.Lens          (use)
import           Options.Applicative
import           System.FilePath.Posix ((-<.>))

main :: IO ()
main = execParser (info (helper <*> parseOpt) fullDesc) >>= \opts ->
    let s = initialState { _threshold     = inline opts
                         , _optimiseLimit = iter opts
                         , _extTyEnv      = minrtExtTyEnv
                         }
        lg = case logf opts of
          Nothing -> ($stdout)
          Just f  -> withFile f WriteMode
    in lg $ \h -> mapM_ (compile s{_logfile=h}) (args opts)

compile :: S -> FilePath -> IO ()
compile s f = do
  input <- readFile f
  withFile (f -<.> "s") WriteMode $ \h -> do
    m <-(`runCaml` s) $ lex input
          >>= parse
          >>= typing
          >>= kNormalize
          >>= alpha
          >>= optimise
          >>= lambdaLift
          >>= \e -> do { log . show =<< use globalHeap
                       ; return e}
          >>= closureConvert
          >>= virtualCode
          >>= simm
          >>= regAlloc
          >>= emit h
    case m of
      Right () -> return ()
      Left e -> error $ f ++ ": " ++ show e

minrtExtTyEnv :: TyEnv
minrtExtTyEnv = M.fromList
  [ ("fiszero"      , TFun [TFloat         ] TBool  )
  , ("fispos"       , TFun [TFloat         ] TBool  )
  , ("fisneg"       , TFun [TFloat         ] TBool  )
  , ("xor"          , TFun [TBool,  TBool  ] TBool  )
  , ("fless"        , TFun [TFloat, TFloat ] TBool  )
  , ("fneg"         , TFun [TFloat         ] TFloat )
  , ("fabs"         , TFun [TFloat         ] TFloat )
  , ("fsqr"         , TFun [TFloat         ] TFloat )
  , ("sqrt"         , TFun [TFloat         ] TFloat )
  , ("fhalf"        , TFun [TFloat         ] TFloat )
  , ("floor"        , TFun [TFloat         ] TFloat )
  , ("cos"          , TFun [TFloat         ] TFloat )
  , ("sin"          , TFun [TFloat         ] TFloat )
  , ("atan"         , TFun [TFloat         ] TFloat )
  , ("read_int"     , TFun [TUnit          ] TInt   )
  , ("read_float"   , TFun [TUnit          ] TFloat )
  , ("print_int"    , TFun [TInt           ] TUnit  )
  , ("print_char"   , TFun [TInt           ] TUnit  )
  , ("int_of_float" , TFun [TFloat         ] TInt   )
  , ("float_of_int" , TFun [TInt           ] TFloat )
  ]

data MinCamlOptions = MinCamlOptions
                    { inline  :: Int
                    , iter    :: Int
                    , logf    :: Maybe String
                    , args    :: [String]
                    }

parseOpt :: Parser MinCamlOptions
parseOpt = pure MinCamlOptions
  <*> option auto
    $$  long "inline"
    <=> metavar "N"
    <=> help "maximum size of functions inlined"
    <=> value 0
    <=> showDefault
  <*> option auto
    $$  long "iter"
    <=> metavar "N"
    <=> help "maximum number of optimizations iterated"
    <=> value 100
    <=> showDefault
  <*> option (Just <$> str)
    $$  long "log"
    <=> metavar "FILE"
    <=> help "file to log to"
    <=> value Nothing
    <=> showDefaultWith (const "stdout")
  <*> some (argument str (metavar "FILES.."))
  where
    infixr 7 $$
    infixr 8 <=>
    ($$) :: (a -> b) -> a -> b
    ($$) = ($)
    (<=>) :: Monoid m => m -> m -> m
    (<=>) = (<>)

