{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TemplateHaskell #-}

module MiddleEnd.LLVM.FrontEnd.Base where

import Prelude hiding (mod)
import Base    hiding (Named(..))

import Data.Word ()
import Data.List
import Data.Function
import           Data.Map (Map)
import qualified Data.Map as M

import           Control.Lens
import           Control.Monad.Trans.State

import           LLVM.General.AST hiding (Type, type')
import qualified LLVM.General.AST as AST
import           LLVM.General.AST.Global as Global
import qualified LLVM.General.AST.Float as F
import qualified LLVM.General.AST.Constant as C
import qualified LLVM.General.AST.IntegerPredicate as IP
import qualified LLVM.General.AST.CallingConvention as CC
import qualified LLVM.General.AST.ParameterAttribute as PA (ParameterAttribute)
import qualified LLVM.General.AST.FloatingPointPredicate as FP
import qualified LLVM.General.AST.AddrSpace as Addr

-------------------------------------------------------------------------------
-- Module Level
-------------------------------------------------------------------------------

type LLVM = StateT LLVMState Caml

data LLVMState
  = LLVMState {
    _module' :: Module
  , _globals' :: Map Id Type
  }
makeLenses ''LLVMState


runLLVM :: LLVMState -> LLVM a -> Caml AST.Module
runLLVM mod m = _module' <$> flip execStateT mod m

initialLLVMState :: LLVMState
initialLLVMState = LLVMState (emptyModule "min-caml") M.empty

emptyModule :: String -> AST.Module
emptyModule label = defaultModule { moduleName = label }

addDefn :: (Id,Type) -> Definition -> LLVM ()
addDefn (x,t) d = do
  globals' %= M.insert x t
  defs <- moduleDefinitions <$> use module'
  module' %=  \s -> s { moduleDefinitions = defs ++ [d] }

defFunction :: (Id,Type) -> [(Id,Type)] -> [BasicBlock] -> LLVM ()
defFunction (label, ~t@(TFun _ retty)) args body =
  addDefn (label,t) $ GlobalDefinition $ functionDefaults {
    name        = Name label
  , parameters  = (toParams args, False)
  , returnType  = ty retty
  , basicBlocks = body
  }

defExternal ::  (Id, Type) -> LLVM ()
defExternal (label, ~t@(TFun argtys retty)) =
  addDefn (label,t) $ GlobalDefinition $ functionDefaults {
    name        = Name label
  , parameters  = (params, False)
  , returnType  = ty retty
  , basicBlocks = []
  }
  where params = toParams $ zip (repeat "") argtys

defGlobalArray :: (Id,Type) -> LLVM ()
defGlobalArray (label, ~t@(TArray size te)) =
  addDefn (label,t) $ GlobalDefinition $ globalVariableDefaults {
    name = Name label
  , type' = ArrayType (fromIntegral size) (ty te)
  }

lookUpGlobal :: Id -> LLVM (Maybe Type)
lookUpGlobal x = uses globals' $ M.lookup x

-------------------------------------------------------------------------------
-- Names
-------------------------------------------------------------------------------

type Names = M.Map String Int

{-uniqueName :: String -> Names -> (String, Names)-}
{-uniqueName nm ns =-}
  {-case M.lookup nm ns of-}
    {-Nothing -> (nm,  M.insert nm 1 ns)-}
    {-Just ix'-> (nm ++ show ix', M.insert nm (ix'+1) ns)-}

-------------------------------------------------------------------------------
-- Codegen State
-------------------------------------------------------------------------------

type SymbolTable = [(String, Operand)]

data BlockState
  = BlockState {
    _idx   :: Int                            -- Block index
  , _stack :: [Named Instruction]            -- Stack of instructions
  , _term  :: Maybe (Named Terminator)       -- Block terminator
  } deriving Show
-- lenses
idx   :: Lens' BlockState Int                            -- Block index
stack :: Lens' BlockState [Named Instruction]            -- Stack of instructions
term  :: Lens' BlockState (Maybe (Named Terminator))       -- Block terminator
idx   = lens _idx   $ \s x -> s { _idx   = x }
stack = lens _stack $ \s x -> s { _stack = x }
term  = lens _term  $ \s x -> s { _term  = x }

data CodegenState
  = CodegenState {
    _currentBlock :: Name                   -- Name of the active block to append to
  , _blocks       :: M.Map Name BlockState  -- Blocks for function
  , _blockCount   :: Int                    -- Count of basic blocks
  , _names        :: Names                  -- Name Supply
  , _typeEnv      :: TyEnv                  -- type environment
  } deriving Show
-- lenses
currentBlock :: Lens' CodegenState Name
blocks       :: Lens' CodegenState (M.Map Name BlockState)
blockCount   :: Lens' CodegenState Int
{-names        :: Lens' CodegenState Names-}
typeEnv      :: Lens' CodegenState TyEnv
currentBlock = lens _currentBlock $ \s x -> s { _currentBlock = x }
blocks       = lens _blocks       $ \s x -> s { _blocks       = x }
blockCount   = lens _blockCount   $ \s x -> s { _blockCount   = x }
{-names        = lens _names        $ \s x -> s { _names        = x }-}
typeEnv      = lens _typeEnv      $ \s x -> s { _typeEnv      = x }

type Codegen = StateT CodegenState LLVM

-------------------------------------------------------------------------------
-- Codegen Operations
-------------------------------------------------------------------------------

typeOf :: Id -> Codegen Type
typeOf x = do
    tyenv <- use typeEnv
    case M.lookup x tyenv of
      Just t  -> return t
      Nothing -> error $ "LLVM.Struct: " ++ x ++ " not found in the type env"

sortBlocks :: [(Name, BlockState)] -> [(Name, BlockState)]
sortBlocks = sortBy (compare `on` (_idx . snd))

createBlocks :: CodegenState -> [BasicBlock]
createBlocks m = map makeBlock $ sortBlocks $ M.toList (_blocks m)

makeBlock :: (Name, BlockState) -> BasicBlock
makeBlock (l, BlockState _ s t) = BasicBlock l s (maketerm t)
  where
    maketerm (Just x) = x
    maketerm Nothing = error $ "Block has no terminator: " ++ show l

entryBlockName :: String
entryBlockName = "entry"

emptyBlock :: Int -> BlockState
emptyBlock i = BlockState i [] Nothing

emptyCodegen :: CodegenState
emptyCodegen = CodegenState (Name entryBlockName) M.empty 1 M.empty M.empty

execCodegen :: Codegen a -> LLVM CodegenState
execCodegen m = execStateT m' emptyCodegen
  where
    m' = do
      exttyenv <- lift $ lift $ use extTyEnv
      typeEnv %= M.union exttyenv
      m

current :: Codegen BlockState
current = M.lookup <$> use currentBlock <*> use blocks >>= \case
    Just x -> return x
    Nothing -> do
      c <- use currentBlock -- 普通ここには来ないので再計算してもいいかな
      error $ "No such block: " ++ show c

terminator :: Terminator -> Codegen ()
terminator trm = do
  blk <- current
  modifyBlock (blk & term .~ Just (Do trm))

-------------------------------------------------------------------------------
-- Block Stack
-------------------------------------------------------------------------------

entry :: Codegen Name
entry = use currentBlock

addBlock :: String -> Codegen Name
addBlock bname = do
  ix'   <- use blockCount
  qname <- Name <$> (lift.lift) (genId bname)
  blocks %= M.insert qname (emptyBlock ix')
  blockCount += 1
  return qname

  {-ix' <- use blockCount-}
  {-nms <- use names-}
  {-let new = emptyBlock ix'-}
      {-(qname, supply) = uniqueName bname nms-}
  {-blocks %= M.insert (Name qname) new-}
  {-blockCount += 1-}
  {-names .= supply-}
  {-return (Name qname)-}

setBlock :: Name -> Codegen ()
setBlock bname = currentBlock .= bname

getBlock :: Codegen Name
getBlock = use currentBlock

modifyBlock :: BlockState -> Codegen ()
modifyBlock new = do
  active <- use currentBlock
  blocks %= M.insert active new

-------------------------------------------------------------------------------
-- Low Level Conversion
-------------------------------------------------------------------------------

-------------
-- Operand --
-------------

localRef :: (Id,Type) -> Operand
localRef (x,t) = LocalReference (ty t) (Name x)

globalRef :: (Id,Type) -> Operand
globalRef (x,t) 
  | head x == 'G' = ConstantOperand $ C.GlobalReference (ty t) (Name x)
  | otherwise = error $ "globalRef" ++ show (x,t)

opeB :: Bool -> Operand
opeB = ConstantOperand . constB

opeI :: Integer -> Operand
opeI = ConstantOperand . constI

opeF :: Float -> Operand
opeF = ConstantOperand . constF

opeUndef :: Type -> Operand
opeUndef = ConstantOperand . C.Undef . ty

opeNullTuple :: Type -> Operand
opeNullTuple = ConstantOperand . nullTuple

constB :: Bool -> C.Constant
constB b = C.Int 1 (if b then 1 else 0)

constI :: Integer -> C.Constant
constI = C.Int 32

constF :: Float -> C.Constant
constF = C.Float . F.Single

nullTuple :: Type -> C.Constant
nullTuple ~(TTuple ts) = C.Struct Nothing False $ map (C.Undef . ty) ts

----------
-- Type --
----------

ty :: Type -> AST.Type
ty = \case
    TUnit      -> AST.VoidType
    TBool      -> AST.IntegerType 1
    TInt       -> AST.IntegerType 32
    TFloat     -> AST.FloatingPointType 32 IEEE
    TFun ts t  -> AST.FunctionType (ty t) (map ty (rmUnit ts)) False
    TTuple ts  -> AST.StructureType False (map ty ts)
    TPtr t     -> AST.PointerType (ty t) (Addr.AddrSpace 0)
    TArray n t -> AST.ArrayType (fromIntegral n) (ty t)
    TVar _     -> error "LLVM.Virtual.ty"
  where
    rmUnit = filter (/=TUnit)

-----------------
-- Instruction --
-----------------

-- この辺は最適化が何とかしてくれる
instV :: (Id,Type) -> Instruction
instV xt = Select (opeB True) (localRef xt) (localRef xt) []

constInstI :: Integer -> Instruction
constInstI n = Add False False (opeI 0) (opeI n) []

constInstB :: Bool -> Instruction
constInstB b = Add False False (opeB False) (opeB b) []

constInstF :: Float -> Instruction
constInstF f = FAdd mathFlag (opeF 0) (opeF f) []

neg :: Id -> Instruction
add,sub,mul,div :: Id -> Id -> Instruction
neg x   = Sub False False (opeI 0) (localRef (x,TInt)) []
add x y = Add False False (localRef (x,TInt)) (localRef (y,TInt)) []
sub x y = Sub False False (localRef (x,TInt)) (localRef (y,TInt)) []
mul x y = Mul False False (localRef (x,TInt)) (localRef (y,TInt)) []
div x y = SDiv      False (localRef (x,TInt)) (localRef (y,TInt)) []

fneg :: Id -> Instruction
fadd,fsub,fmul,fdiv :: Id -> Id -> Instruction
fneg x   = FSub mathFlag (opeF 0) (localRef (x,TFloat)) []
fadd x y = FAdd mathFlag (localRef (x,TFloat)) (localRef (y,TFloat)) []
fsub x y = FSub mathFlag (localRef (x,TFloat)) (localRef (y,TFloat)) []
fmul x y = FMul mathFlag (localRef (x,TFloat)) (localRef (y,TFloat)) []
fdiv x y = FDiv mathFlag (localRef (x,TFloat)) (localRef (y,TFloat)) []

mathFlag :: FastMathFlags
mathFlag = FastMathFlags True True True True

load :: (Id,Type) -> Instruction
load ptr = Load False (localRef ptr) Nothing 0 []

store :: (Id,Type) -> (Id,Type) -> Instruction
store ptr val = Store False (localRef ptr) (localRef val) Nothing 0 []

call :: (Id,Type) -> [(Id,Type)] -> Instruction
call fun args = Call Nothing CC.C [] (Right (mkFun fun)) (toArgs args) [] []

mkFun :: (Id,Type) -> Operand
mkFun (x,t) = ConstantOperand $ C.GlobalReference
                (PointerType (ty t) (Addr.AddrSpace 0))
                (Name x)

phi :: Type -> [(Id,Name)] -> Instruction
phi t cands = Phi (ty t) [ (localRef (x,t), d) | (x,d) <- cands ] []

icmp :: IP.IntegerPredicate -> (Id,Type) -> (Id,Type) -> Instruction
icmp p xt yt = ICmp p (localRef xt) (localRef yt) []

fcmp :: FP.FloatingPointPredicate -> (Id,Type) -> (Id,Type) -> Instruction
fcmp p xt yt = FCmp p (localRef xt) (localRef yt) []

gep :: (Id,Type) -> [(Id,Type)] -> Instruction
gep ptr ix' = GetElementPtr True (localRef ptr) (map localRef ix') []

br :: Name -> Terminator
br dest' = Br dest' []

cbr :: (Id,Type) -> Name -> Name -> Terminator
cbr cond thenDest elseDest = CondBr (localRef cond) thenDest elseDest []

ret :: Maybe Operand -> Terminator
ret mx = Ret mx []

-- TODO こいつの型をちゃんと考えよう
globalArrayPtr :: (Id,Type) -> [(Id,(Type))] -> Instruction
globalArrayPtr ~(arr,t@(TArray _ _)) ix' = GetElementPtr False garr i  []
  where garr = globalRef (arr,t)
        i  = opeI 0 : (map localRef ix')

-------------------------------------------------------------------------------
-- convert arguments
-------------------------------------------------------------------------------

toArgs :: [(Id,Type)] -> [(Operand, [PA.ParameterAttribute])]
toArgs xts = [ (localRef xt, []) | xt@(_,t) <- xts, t /= TUnit ]

toParams :: [(Id,Type)] -> [Parameter]
toParams xts = [ Parameter (ty t) (Name x) [] | (x,t) <- xts, t /= TUnit ]

