{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleContexts #-}

module Base where

import                Data.IORef
import                Control.Lens
import                Data.Map                        (Map)
import qualified      Data.Map as M
import                Data.Maybe                      (fromMaybe)
import                Control.Monad.Trans as T        (MonadTrans,lift)
import                Control.Monad.Trans.Except
import                Control.Monad.Trans.State.Lazy
import qualified      Control.Monad.IO.Class as IOC
import                Control.Monad.Except            (throwError, catchError)
import                Control.Monad.Error.Class       (MonadError)
import                System.IO                       (Handle, stdout, hPutStrLn)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

type Id = String
newtype Label = Label String
              deriving (Show,Eq,Ord)

data Type = TUnit
          | TBool
          | TInt
          | TFloat
          | TFun   [Type] Type
          | TTuple [Type]
          | TArray Integer Type
          | TPtr   Type
          | TVar   TV
          deriving (Show, Eq, Ord)

type TyEnv = Map Id Type

data TV = TV Int (IORef (Maybe Type))
          deriving (Eq)

instance Show TV where
  show (TV n _) = "tv" ++ show n
instance Ord TV where
  compare (TV n _) (TV m _) = compare n m

data S = S { _idCount       :: Int             -- for Id module
           , _tvCount       :: Int             -- for Typing module
           , _threshold     :: Int             -- max inline size
           , _optimiseLimit :: Int             -- max number of optimise iter
           , _extTyEnv      :: TyEnv           -- type of ext functions
           , _constFloats   :: [(Label,Float)] -- floating constant
           , _globalHeap    :: Map Id (Integer,Integer,Type)
                                               -- global array and its address
                                               -- (address,size,type)
           , _startGP       :: Integer         -- sum of global array size
           , _logfile       :: Handle          -- file to log to
           , _instCount    :: Int
           }
           deriving (Show,Eq)
makeLenses ''S

type Caml = StateT S (ExceptT Error IO)
data Error = Failure String
           deriving (Show,Eq,Ord)

data Predicate = EQ | NE | LE | GE | LT | GT
               deriving (Show,Eq,Ord)

data Named a = Id := a | Do a
    deriving (Show,Eq,Ord)

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-- Type --
genType :: Caml Type
genType = do
  ref <- liftIO $ newIORef Nothing
  n   <- tvCount <+= 1
  return $ TVar $ TV n ref

-- Id --
ppList :: [Id] -> Id
ppList = \case
  []  -> ""
  [x] -> x
  x:xs -> x ++ " " ++ ppList xs

genId :: String -> Caml Id
genId s = do
  n <- idCount <+= 1
  return $ s ++ "." ++ show n

genTmp :: Type -> Caml Id
genTmp ty = do
  n <- idCount <+= 1
  return $ "T" ++ idOfType ty ++ show n

idOfType :: Type -> String
idOfType = \case
  TUnit      -> "u"
  TBool      -> "b"
  TInt       -> "i"
  TFloat     -> "d"
  TFun _ _   -> "f"
  TTuple _   -> "t"
  TArray n _ -> "a" ++ show n
  TPtr _     -> "p"
  TVar _     -> error "idOfType: TVar"

-- env --
globalArrayEnv :: Caml TyEnv
globalArrayEnv = uses globalHeap $ M.map (\(_,_,t) -> t)

externalEnv :: Caml TyEnv
externalEnv = uses extTyEnv $ M.mapKeys ("min_caml_"++)

-- Caml initialState --
initialState :: S
initialState = S { _idCount       = 0
                 , _tvCount       = 0
                 , _extTyEnv      = initialExtTyEnv
                 , _threshold     = 0
                 , _constFloats   = []
                 , _globalHeap    = M.empty
                 , _startGP       = 10000 -- !! stackの最大値を超えないように
                 , _optimiseLimit = 100
                 , _logfile       = stdout
                 , _instCount     = 0
                 }
maxArgs :: Int
maxArgs = 25

initialExtTyEnv :: TyEnv
initialExtTyEnv = M.fromList
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
  , ("print_float"  , TFun [TFloat         ] TUnit  )
  , ("print_char"   , TFun [TInt           ] TUnit  )
  , ("print_newline", TFun [TUnit          ] TUnit  )
  , ("int_of_float" , TFun [TFloat         ] TInt   )
  , ("float_of_int" , TFun [TInt           ] TFloat )
  , ("create_int_array"   , TFun [TInt,TInt] (TPtr TInt))
  , ("create_float_array" , TFun [TInt,TFloat] (TPtr TFloat))
  , ("init_int_array"     , TFun [TInt,TInt] (TPtr TInt))
  , ("init_float_array"   , TFun [TInt,TFloat] (TPtr TFloat))
  ]

-- log --
log :: String -> Caml ()
log s = do
  l <- use logfile
  liftIO $ hPutStrLn l s

-- runner --
runCamlDefault :: Caml a -> IO (Either Error a)
runCamlDefault c = runExceptT $ evalStateT c initialState

runCaml :: Caml a -> S -> IO (Either Error a)
runCaml c s = runExceptT $ evalStateT c s

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

lift :: (MonadTrans t, Monad m) => m a -> t m a
lift = T.lift

liftIO :: IOC.MonadIO m => IO a -> m a
liftIO = IOC.liftIO

catch :: MonadError e m => m a -> (e -> m a) -> m a
catch = catchError

throw :: MonadError e m => e -> m a
throw = throwError

lookupRev :: Eq a => a -> [(b,a)] -> Maybe b
lookupRev i = let f (p,q) = (q,p) in lookup i . map f

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "Base: unsafeLookup: "++ show key) $ M.lookup key dic

insertList :: Ord key => [(key,a)] -> Map key a -> Map key a
insertList xts = M.union (M.fromList xts)

toGlobalId :: Id -> Id
toGlobalId = ("G"++)

both :: (a -> b) -> (a,a) -> (b,b)
both f = bimap f f

