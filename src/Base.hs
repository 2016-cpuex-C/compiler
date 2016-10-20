{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleContexts #-}

module Base where

import                Data.IORef
import                Control.Lens
import                Data.Map                       (Map)
import qualified      Data.Map as M
import                Control.Monad.Trans.Except
import                Control.Monad.Trans.State.Lazy
import qualified      Control.Monad.IO.Class as IOC
import                Control.Monad.Except           (throwError, catchError)
import                Control.Monad.Error.Class      (MonadError)
import                System.IO                      (Handle, stdout, hPutStrLn)
import {-# SOURCE #-} FrontEnd.Syntax                (Expr)

-----------
-- Types --
-----------
type Id = String
newtype Label = Label String
              deriving Show

data Type = TUnit
          | TBool
          | TInt
          | TFloat
          | TFun   [Type] Type
          | TTuple [Type]
          | TArray Type
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
           , _threshold     :: Int             -- for Inline module (max inline size)
           , _optimiseLimit :: Int             -- for Optimise module (max optimise iter)
           , _extTyEnv      :: TyEnv           -- for Typing module
           , _virtualData   :: [(Label,Float)] -- for Virtual module
           , _logfile       :: Handle
           }
           deriving Show
makeLenses ''S

type Caml = StateT S (ExceptT Error IO)
data Error = Failure String
           | Unify Type Type
           | Typing Expr Type Type
           | NoReg Id Type
           deriving Show

---------------
-- functions --
---------------

-- Type --
genType :: Caml Type
genType = do
  ref <- liftIO $ newIORef Nothing
  n   <- tvCount <+= 1
  return $ TVar $ TV n ref

readType :: TV -> Caml (Maybe Type)
readType (TV _ ref) = liftIO $ readIORef ref

writeType :: TV -> Type -> Caml ()
writeType (TV _ ref) t = liftIO $ writeIORef ref (Just t)

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
  TUnit    -> "u"
  TBool    -> "b"
  TInt     -> "i"
  TFloat   -> "d"
  TFun _ _ -> "f"
  TTuple _ -> "t"
  TArray _ -> "a"
  TVar _   -> error "idOfType: TVar"

-- Caml
initialState :: S
initialState = S { _idCount       = 0
                 , _tvCount       = 0
                 , _extTyEnv      = M.empty
                 , _threshold     = 0
                 , _virtualData   = []
                 , _optimiseLimit = 100
                 , _logfile       = stdout
                 }

liftIO :: IOC.MonadIO m => IO a -> m a
liftIO = IOC.liftIO

throw :: MonadError Error m => Error -> m a
throw = throwError

-- NOTE: m中の状態変化はなかったことになる 気をつけて使う
-- catch m h = StateT $ \s -> runStateT m s `catchE` \e -> runStateT (h e) s
catch :: MonadError Error m => m a -> (Error -> m a) -> m a
catch = catchError

log :: String -> Caml ()
log s = do
  l <- use logfile
  liftIO $ hPutStrLn l s

runCamlDefault :: Caml a -> IO (Either Error a)
runCamlDefault c = runExceptT $ evalStateT c initialState

runCaml :: Caml a -> S -> IO (Either Error a)
runCaml c s = runExceptT $ evalStateT c s

