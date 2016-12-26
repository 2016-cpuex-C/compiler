{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleContexts #-}

module Base where

import           Data.IORef
import           Control.Lens                     (makeLenses,use,uses,bimap)
import           Control.Lens.Operators
import           Data.Map                         (Map)
import qualified Data.Map                         as M
import           Data.Set                         (Set)
import qualified Data.Set                         as S
import           Data.Maybe                       (fromMaybe)
import           Data.Tree
import           Control.Monad.Trans as T         (MonadTrans,lift)
import           Control.Monad.Trans.Except
import           Control.Monad.Trans.State.Lazy
import qualified Control.Monad.IO.Class           as IOC
import           Control.Monad.Except             (throwError, catchError)
import           Control.Monad.Error.Class        (MonadError)
import           System.IO                        (Handle, stdout, hPutStrLn)

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
               deriving (Show,Eq,Ord,Enum)

data Named a = Id := a | Do a
    deriving (Show,Eq,Ord)

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-- Label --
unLabel :: Label -> String
unLabel (Label x) = x

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

toGlobalId :: Id -> Id
toGlobalId = ("G"++)

-- env --
globalArrayEnv :: Caml TyEnv
globalArrayEnv = uses globalHeap $ M.map (\(_,_,t) -> t)

externalEnv :: Caml TyEnv
externalEnv = uses extTyEnv $ M.mapKeys ("min_caml_"++)

-- float --
floatLabel :: Float -> Caml Label
floatLabel f =
  uses constFloats (lookupRev f) >>= \case
    Nothing -> do
      l <- Label <$> genId "l"
      constFloats %= ((l,f):)
      return l
    Just l -> return l

labelFloat :: Label -> Caml Float
labelFloat l =
  uses constFloats (lookup l) >>= \case
    Nothing -> error "Base: labelFloat: Not Found"
    Just f  -> return f

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
  , ("create_array"   , TFun [TInt,TInt] (TPtr TInt))
  , ("create_float_array" , TFun [TInt,TFloat] (TPtr TFloat))
  , ("init_array"     , TFun [TInt,TInt] (TPtr TInt))
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

errorShow :: Show a => String -> a -> b
errorShow s x = error $ s ++ show x

lookupRev :: Eq a => a -> [(b,a)] -> Maybe b
lookupRev i = let f (p,q) = (q,p) in lookup i . map f

both :: (a -> b) -> (a,a) -> (b,b)
both f = bimap f f

---------
-- Map --
---------

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "Base: unsafeLookup: "++ show key) $ M.lookup key dic

insertList :: Ord key => [(key,a)] -> Map key a -> Map key a
insertList xts = M.union (M.fromList xts)

insertAppend :: Ord a => a -> b -> Map a [b] -> Map a [b]
insertAppend x y = M.alter f x
  where f Nothing   = Just [y]
        f (Just ys) = Just (y:ys)

flipMap :: (Ord a, Ord b) => Map a b -> Map b [a]
flipMap = M.foldlWithKey f M.empty
  where f m x y = insertAppend y x m

-- 後退辺があると無限ループする
mapToTree :: Ord a => a -> Map a [a] -> Tree a
mapToTree root m = f root
  where f n = case M.lookup n m of
          Just es -> Node n (map f es)
          Nothing -> Node n []

mapToDFSTree :: Ord a => a -> Map a [a] -> Tree a
mapToDFSTree root m = f S.empty root
  where f s n = case M.lookup n m of
          Just es ->
            let s'  = S.insert n s
                es' = filter (`S.notMember` s) es
            in  Node n (map (f s') es')
          Nothing -> Node n []


---------------
-- (Set,Set) --
---------------

toList2 :: (Set Id, Set Id) -> ([Id], [Id])
toList2 = both S.toList

fromList2 :: ([Id], [Id]) -> (Set Id, Set Id)
fromList2 = both S.fromList

unions2 :: [(Set Id, Set Id)] -> (Set Id, Set Id)
unions2 = both S.unions . unzip

union2 :: (Set Id, Set Id) -> (Set Id, Set Id) -> (Set Id, Set Id)
union2 = both2 S.union

difference2 :: (Set Id, Set Id) -> (Set Id, Set Id) -> (Set Id, Set Id)
difference2 = both2 S.difference

both2 :: (a -> b -> c) -> (a, a) -> (b, b) -> (c, c)
both2 f (x1,x2) (y1,y2) = (f x1 y1, f x2 y2)

