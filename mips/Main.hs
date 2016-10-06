{-# LANGUAGE NoImplicitPrelude #-}

module Main where

import AllTypes
import Lexer    (lex)
import Parser   (parse)
import Typing   (typing)
import KNormal  (kNormalize)
import Alpha    (alpha)
import Optimise (optimise)
import Closure  (closureConvert)
import Virtual  (virtualCode)
import RegAlloc (regAlloc)
import Simm     (simm)
import Emit     (emit)

import           Prelude hiding (lex)
import           System.IO      (withFile, IOMode(..))
import qualified Data.Map as M
import           Options

main :: IO ()
main = runCommand $ \opts args -> do
  let s = initialState { _threshold     = inline opts
                       , _optimiseLimit = iter opts
                       , _extTyEnv      = minrtExtTyEnv
                       }
  mapM_ (compile s) args

compile :: S -> FilePath -> IO ()
compile s f = do
  str <- readFile (f ++ ".ml")
  withFile (f ++ ".s") WriteMode $ \out -> do
    m <-(`runCaml` s) $ lex str
          >>= parse
          >>= typing
          >>= kNormalize
          >>= alpha
          >>= optimise
          >>= closureConvert
          >>= virtualCode
          >>= simm
          >>= regAlloc
          {->>= \e -> liftIO (print e) >> return e-}
          >>= emit out
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
                    }
instance Options MinCamlOptions where
  defineOptions = pure MinCamlOptions
               <*> simpleOption "inline"
                   0 "maximum size of functions inlined"
               <*> simpleOption "iter"
                   100 "maximum number of optimizations iterated"

