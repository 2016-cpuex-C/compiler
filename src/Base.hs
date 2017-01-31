{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleContexts #-}

module Base (
  --{{{
  -- Data Types
  -------------
    Id
  , Label(..)
  , Type(..)
  , TyEnv
  , TV(..)
  , Error(..) -- TODO これ使ってないなあ
  , Predicate(..)
  , Named(..)
  , Caml
  , S(..) -- TODO 名前変更

  -- Lenses
  ---------
  , idCount
  , tvCount
  , threshold
  , optimiseLimit
  , extTyEnv
  , constFloats
  , globalHeap
  , startGP
  , logfile
  , instCount
  , verbosity

  --
  -----------
  , unLabel
  , genType
  , genTmp
  , genId
  , ppList
  , toGlobalId
  , globalArrayEnv
  , externalEnv
  , floatLabel
  , labelFloat
  , initialState
  , maxArgs
  , runCaml
  , runCamlDefault
  , lift
  , liftIO
  , errorShow
  , withoutLogging

  -- Util
  -----------
  , lookupRev
  , both
  , lookupMapNote
  , insertList
  , insertAppend
  , insertAppendS
  , insertAppendList
  , insertAppendSetS
  , flipMap
  , mapToTree
  , dfsMap
  , inOrderSortDFS
  , lookupMapLensM
  , lookupMapLensNoteM
  , findWithDefaultLensM
  , toList2
  , fromList2
  , union2
  , unions2
  , difference2
  , both2
  , show'

    -- export
  , module Export
  --}}}
) where

import           Safe                             as Export
import           Data.Map                         as Export (Map)
import           Data.Set                         as Export (Set)
import           Data.List                        as Export (foldl')
import           Data.Text                        as Export (Text,pack)
import           Data.Monoid                      as Export
import           Control.Lens                     as Export (makeLenses,use,uses,view,bimap)
import           Control.Monad                    as Export (join,when,unless,forM_,forM,(>=>))
import           Control.Monad.Except             as Export (throwError,catchError)
import           Control.Monad.Logger             as Export

import           Data.IORef
import           Control.Lens                     (Lens')
import           Control.Lens.Operators
import qualified Data.Map                         as M
import qualified Data.Set                         as S
import           Data.Tree
import           Data.Maybe                       (fromMaybe)
import qualified Data.ByteString.Char8            as S8 (hPutStr)
import qualified Control.Monad.Trans              as T (MonadTrans,lift)
import           Control.Monad.Trans.Except
import           Control.Monad.Trans.State.Strict
import           Control.Monad.State.Class        (MonadState)
import qualified Control.Monad.IO.Class           as IOC (MonadIO,liftIO)
import           System.IO                        (Handle,stdout)
import           System.Log.FastLogger

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
           , _instCount     :: Int
           , _verbosity     :: LogLevel
           }
           deriving (Show,Eq)
makeLenses ''S

type Caml = LoggingT (StateT S (ExceptT Error IO))
data Error = Failure String
           deriving (Eq,Ord)
instance Show Error where
  show (Failure e) = "Failure " ++ e

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
                 , _verbosity     = LevelInfo
                 }
maxArgs :: Int
maxArgs = 25

initialExtTyEnv :: TyEnv
initialExtTyEnv = M.fromList
  [ ("sqrt"               , TFun [TFloat     ] TFloat       )
  , ("floor"              , TFun [TFloat     ] TFloat       )
  , ("cos"                , TFun [TFloat     ] TFloat       )
  , ("sin"                , TFun [TFloat     ] TFloat       )
  , ("atan"               , TFun [TFloat     ] TFloat       )
  , ("read_int"           , TFun [TUnit      ] TInt         )
  , ("read_float"         , TFun [TUnit      ] TFloat       )
  , ("print_int"          , TFun [TInt       ] TUnit        )
  , ("print_float"        , TFun [TFloat     ] TUnit        )
  , ("print_char"         , TFun [TInt       ] TUnit        )
  , ("print_newline"      , TFun [TUnit      ] TUnit        )
  , ("int_of_float"       , TFun [TFloat     ] TInt         )
  , ("float_of_int"       , TFun [TInt       ] TFloat       )
  , ("create_array"       , TFun [TInt,TInt  ] (TPtr TInt  ))
  , ("create_float_array" , TFun [TInt,TFloat] (TPtr TFloat))
  , ("init_array"         , TFun [TInt,TInt  ] (TPtr TInt  ))
  , ("init_float_array"   , TFun [TInt,TFloat] (TPtr TFloat))
  ]

-- logger --

withoutLogging :: Caml a -> Caml a
withoutLogging = filterLogger (const (const False))

show' :: Show a => a -> Text
show' = pack . show

-- runner --

runCaml :: Caml a -> S -> IO (Either Error a)
runCaml c s = runExceptT $ evalStateT (runHLoggingT h v c) s
  where
    h = s^.logfile
    v = s^.verbosity

runCamlDefault :: Caml a -> IO (Either Error a)
runCamlDefault c = runCaml c initialState

runHLoggingT :: IOC.MonadIO m => Handle -> LogLevel -> LoggingT m a -> m a
runHLoggingT h v c = runLoggingT (filterLogger p c) (defaultOutput h)
  where p _ v' = v <= v'
    -- v以上のもののみ出力

defaultOutput :: Handle -> Loc -> LogSource -> LogLevel -> LogStr -> IO ()
defaultOutput h a b c d =
  let s = fromLogStr $ defaultLogStr a b c d
  in  S8.hPutStr h s

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

lift :: (T.MonadTrans t, Monad m) => m a -> t m a
lift = T.lift

liftIO :: IOC.MonadIO m => IO a -> m a
liftIO = IOC.liftIO

errorShow :: Show a => String -> a -> b
errorShow s x = error $ s ++ show x

lookupRev :: Eq a => a -> [(b,a)] -> Maybe b
lookupRev i = let f (p,q) = (q,p) in lookup i . map f

both :: (a -> b) -> (a,a) -> (b,b)
both f = bimap f f

---------
-- Map --
---------

lookupMapNote :: (Ord k) => String -> k -> Map k a -> a
lookupMapNote s k m = fromJustNote msg $ M.lookup k m
  where msg = "lookupMapNote: " ++ s

insertList :: Ord key => [(key,a)] -> Map key a -> Map key a
insertList = M.union . M.fromList

insertAppend :: Ord a => a -> b -> Map a [b] -> Map a [b]
insertAppend x y = M.alter f x
  where f Nothing   = Just [y]
        f (Just ys) = Just (y:ys)

insertAppendS :: (Ord a, Ord b) => a -> b -> Map a (Set b) -> Map a (Set b)
insertAppendS x y = M.alter f x
  where f Nothing   = Just (S.singleton y)
        f (Just ys) = Just (S.insert y ys)

insertAppendList :: Ord a => a -> [b] -> Map a [b] -> Map a [b]
insertAppendList x ys = M.alter f x
  where f Nothing   = Just ys
        f (Just ys') = Just (ys++ys')

insertAppendSetS :: (Ord a, Ord b) => a -> Set b -> Map a (Set b) -> Map a (Set b)
insertAppendSetS x ys = M.alter f x
  where f Nothing   = Just ys
        f (Just ys') = Just (S.union ys ys')

flipMap :: (Ord a, Ord b) => Map a b -> Map b [a]
flipMap = M.foldlWithKey f M.empty
  where f m x y = insertAppend y x m

-- 後退辺があると無限ループする
-- ある場合はdfsMapを使う
mapToTree :: Ord a => a -> Map a [a] -> Tree a
mapToTree root m = f root
  where f n = case M.lookup n m of
          Just es -> Node n (map f es)
          Nothing -> Node n []

dfsMap :: Ord a => a -> Map a [a] -> Tree a
dfsMap root m = evalState (f root) S.empty
  where
    f n = case M.lookup n m of
      Just es -> do
        modify $ S.insert n
        reached <- get
        let es' = filter (`S.notMember` reached) es
        Node n <$> mapM f es'
      Nothing -> return $ Node n []

inOrderSortDFS :: Tree a -> [a]
inOrderSortDFS (Node n ns) = n : concatMap inOrderSortDFS ns

lookupMapLensM :: (Ord k, MonadState s m) => k -> Lens' s (Map k a) -> m (Maybe a)
lookupMapLensM x m = uses m (M.lookup x)

lookupMapLensNoteM :: (Ord k, MonadState s m) => String -> k -> Lens' s (Map k a) -> m a
lookupMapLensNoteM s x m = fromJustNote msg <$> lookupMapLensM x m
  where msg = "lookupMapLensNoteM: " ++ s

findWithDefaultLensM :: (Ord k, MonadState s m) => a -> k -> Lens' s (Map k a) -> m a
findWithDefaultLensM d x m = fromMaybe d <$> lookupMapLensM x m

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

