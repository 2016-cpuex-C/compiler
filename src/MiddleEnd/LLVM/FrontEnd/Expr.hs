{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module MiddleEnd.LLVM.FrontEnd.Expr where
{- CExpr -> [BasicBlock] -}

import Prelude hiding (div, EQ)

import Base
import MiddleEnd.Closure
import MiddleEnd.LLVM.FrontEnd.Base

import qualified Data.Map as M
import           Data.Word
import           Control.Lens

import           LLVM.General.AST hiding (Type)
import qualified LLVM.General.AST.IntegerPredicate as IP
import qualified LLVM.General.AST.CallingConvention as CC
import qualified LLVM.General.AST.FloatingPointPredicate as FP
import Control.Monad (forM, forM_, when)
import Data.List (zip4)

exprToBlocks :: [(Id,Type)] -> CExpr -> LLVM [BasicBlock]
exprToBlocks tyenv e = createBlocks <$> execCodegen m
  where
    m = do
      typeEnv %= insertList tyenv
      addBlock entryBlockName >>= setBlock
      convertExpr e

data Pred = EQ | LE

convertExpr :: CExpr -> Codegen ()
convertExpr e = case e of
    CVar x -> do
      t <- typeOf x
      terminator $ ret $ Just $ localRef (x,t)
    CUnit    -> terminator $ ret $ Nothing
    CInt n   -> terminator $ ret $ Just $ opeI n
    CBool b  -> terminator $ ret $ Just $ opeB b
    CFloat f -> terminator $ ret $ Just $ opeF f

    CLet (x,t) e1 e2 -> bind (x,t) e1 >> convertExpr e2
    CLetTuple xts y e1 -> bindTuple xts y >> convertExpr e1

    CIfEq x y e1 e2 -> convertIf EQ x y e1 e2
    CIfLe x y e1 e2 -> convertIf LE x y e1 e2

    CNeg{}  -> ret' e TInt
    CAdd{}  -> ret' e TInt
    CSub{}  -> ret' e TInt
    CMul{}  -> ret' e TInt
    CDiv{}  -> ret' e TInt
    CFNeg{} -> ret' e TFloat
    CFAdd{} -> ret' e TFloat
    CFSub{} -> ret' e TFloat
    CFMul{} -> ret' e TFloat
    CFDiv{} -> ret' e TFloat
    CPut{}  -> ret' e TUnit
    CGet x _ -> typeOf x >>= \case
        TPtr te     -> ret' e te
        TArray _ te -> ret' e te
        _ -> error "そんなバナナ"
    CAppDir (Label f) _ -> do { TFun _ t <- typeOf f; ret' e t}

    CTuple xs ->  do { ts <- mapM typeOf xs; ret' e (TTuple ts)}
    CArray _ y -> do { t <- typeOf y;        ret' e (TPtr t )}
    CArrayInit _l z -> do
      t <- typeOf z
      ret' e (TPtr t)

    CExtArray{} -> error "Not Implemented"
    CMakeCls{} -> error "Not Implemented"
    CAppCls{} -> error "Not Implemented"

  where
    ret' e' t = do
      r <- lift.lift $ genId "ret"
      bind (r,t) e'
      case t of
        TUnit -> terminator $ ret Nothing
        _ ->     terminator $ ret $ Just $ localRef (r,t)

convertIf :: Pred -> Id -> Id -> CExpr -> CExpr -> Codegen ()
convertIf p x y e1 e2 = do
    cond  <- lift.lift $ genId "cond"
    thenB <- addBlock "then" -- then branch
    elseB <- addBlock "else" -- else branch
    t <- typeOf x
    bindCond p t cond x y
    terminator $ cbr (cond, TBool) thenB elseB
    setBlock thenB
    convertExpr e1
    setBlock elseB
    convertExpr e2

-- Name x := e をblockStateに追加
bind :: (Id,Type) -> CExpr -> Codegen ()
bind (x,tx) e = typeEnv %= M.insert x tx >> case e of
    CUnit     -> return ()
    CVar y    -> assignInst (Just x) $ instV (y,tx)
    CInt n    -> assignInst (Just x) $ constInstI n
    CBool b   -> assignInst (Just x) $ constInstB b
    CFloat f  -> assignInst (Just x) $ constInstF f
    CNeg y    -> assignInst (Just x) $ neg y
    CAdd y z  -> assignInst (Just x) $ add y z
    CSub y z  -> assignInst (Just x) $ sub y z
    CMul y z  -> assignInst (Just x) $ mul y z
    CDiv y z  -> assignInst (Just x) $ div y z
    CFNeg y   -> assignInst (Just x) $ fneg y
    CFAdd y z -> assignInst (Just x) $ fadd y z
    CFSub y z -> assignInst (Just x) $ fsub y z
    CFMul y z -> assignInst (Just x) $ fmul y z
    CFDiv y z -> assignInst (Just x) $ fdiv y z

    CAppDir (Label f) xs -> do
      t@(TFun ts tret) <- typeOf f
      case tret of
        TUnit -> assignInst Nothing  $ call (f,t) (zip xs ts)
        _     -> assignInst (Just x) $ call (f,t) (zip xs ts)

    CGet y z -> do
      t <- typeOf y
      let elemt = case t of TPtr te -> te
                            TArray _ te -> te
                            _ -> error . show $ (t,y,z)
      addr <- lift.lift $ genId "addr_"
      lift (lookUpGlobal y) >>= \case
        Nothing -> do
          assignInst (Just addr) $ gep (y,t) [(z,TInt)]
        Just t'@(TArray _ te') -> do
          when (elemt /= te') $ error "Aieee!!!"
          assignInst (Just addr) $ globalArrayPtr (y,t') [(z,TInt)]
        _ -> error "Aieeeyeah"
      assignInst (Just x) $ load (addr,t)

    CPut y z w -> do
      t <- typeOf y
      let elemt = case t of TPtr te -> te
                            TArray _ te -> te
                            _ -> error . show $ (t,y,z,w)
      addr <- lift.lift $ genId "addr_"
      lift (lookUpGlobal y) >>= \case
        Nothing -> do
          assignInst (Just addr) $ gep (y,t) [(z,TInt)]
        Just t'@(TArray _ te') -> do
          when (elemt /= te') $ error "Aieee!!!"
          assignInst (Just addr) $ globalArrayPtr (y,t') [(z,TInt)]
        _ -> error "Aieeeyeah"
      assignInst (Just x) $ instV (addr,t) -- ad hoc
      assignInst Nothing  $ store (addr,t) (w,elemt)

    CTuple ys -> do
      -- tmp1 = insertvalue null     y1 1
      -- tmp2 = insertvalue tmp1     y2 2
      --      :
      -- x    = insertvalue tmp(n-1) yn n
      tmps <- forM (init ys) $ const $ lift.lift $ genId "tmp"
      let TTuple ts = tx
          nullOpe = opeNullTuple tx
          tmpOpes = map localRef $ zip tmps (repeat tx)
          yts = zip ys ts

          f :: Id -> Operand -> Operand -> Word32 -> Codegen ()
          f des src val ix' = assignInst (Just des) $ InsertValue src val [ix'] []
          dests' = tmps++[x]
          srcs'  = nullOpe : tmpOpes
          vals'  = map localRef yts
      zipWith4M_ f dests' srcs' vals' [0..]

    CArray y z -> do
      let TPtr t = tx
      create_array <- case t of
        TInt -> return "min_caml_create_int_array"
        TFloat -> return "min_caml_create_float_array"
        _ -> do
          -- 型の合うcreate_array関数を作る
          ---------------------------------
          let caTy = TFun [TInt,t] (TPtr t)
          create_array <- lift.lift $ genId "create_array"
          lift $ defExternal (create_array, caTy)
          typeEnv %= M.insert create_array caTy
          return create_array
      bind (x,tx) $ CAppDir (Label create_array) [y,z]

    CArrayInit (Label y) z ->
      lift (lookUpGlobal y) >>= \case
        Just t@(TArray _ elemt) -> do
          -- 型の合うinit_array関数を作る
          -------------------------------
          let iaTy = TFun [TPtr t,elemt] (TPtr elemt)
          init_array <- lift.lift $ genId "init_array"
          lift $ defExternal (init_array, iaTy)
          typeEnv %= M.insert init_array iaTy
          assignInst (Just x) $ Call Nothing CC.C []
              (Right (mkFun (init_array, iaTy)))
              [(globalRef (y,t),[]), (localRef (z,elemt),[])]
              [] []
        _ -> error "そんなバナナ"


    CLet (x',tx') e1 e2 -> bind (x',tx') e1 >> bind (x,tx) e2
    CLetTuple xts y e1 ->  bindTuple xts y  >> bind (x,tx) e1

    CIfEq y z e1 e2 -> bindIf (x,tx) EQ y z e1 e2
    CIfLe y z e1 e2 -> bindIf (x,tx) LE y z e1 e2

    -- こいつらは当面いらない
    --------------------------
    CAppCls{} -> errorE
    CMakeCls{} -> errorE
    CExtArray{} -> errorE
  where
    errorE = error $ "LLVM.Virtual.bind: " ++ show (x,tx,e)

bindIf :: (Id,Type) -> Pred -> Id -> Id -> CExpr -> CExpr -> Codegen ()
bindIf (x,tx) p y z e1 e2 = do
    thenB <- addBlock "then" -- then block
    elseB <- addBlock "else" -- else block
    contB <- addBlock "cont" -- continue block

    cond  <- lift.lift $ genId "cond"
    thenX <- lift.lift $ genId $ x ++ "_then"
    elseX <- lift.lift $ genId $ x ++ "_else"

    -- currentBlock
    t <- typeOf y
    bindCond p t cond y z
    terminator $ cbr (cond,TBool) thenB elseB

    setBlock thenB
    bind (thenX, tx) e1
    terminator $ br contB
    thenB' <- entry

    setBlock elseB
    bind (elseX, tx) e2
    terminator $ br contB
    elseB' <- entry

    setBlock contB
    case tx of
      TUnit -> return ()
      _     -> assignInst (Just x) $ phi tx [(thenX,thenB'), (elseX,elseB')]

bindTuple :: [(Id,Type)] -> Id -> Codegen ()
bindTuple xts y = do
    let t = TTuple $ map snd xts
        src = localRef (y,t)
    typeEnv %= insertList xts
    forM_ (zip xts [0..]) $ \((x,_),i) ->
      assignInst (Just x) $ ExtractValue src [i] []

bindCond :: Pred -> Type -> Id -> Id -> Id -> Codegen ()
bindCond p t c x y =
    let inst = case (p,t) of
          (EQ, TFloat) -> fcmp FP.OEQ (x,t) (y,t)
          (LE, TFloat) -> fcmp FP.OLE (x,t) (y,t)
          (EQ, _)      -> icmp IP.EQ  (x,t) (y,t)
          (LE, _)      -> icmp IP.SLE (x,t) (y,t)
    in  assignInst (Just c) inst

assignInst :: Maybe Id -> Instruction -> Codegen ()
assignInst mx inst = do
    let ninst = case mx of Just x  -> Name x := inst
                           Nothing -> Do inst
    blk <- current
    modifyBlock (blk & stack%~(++[ninst]))


-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

zipWith4M_ :: Monad m => (a -> b -> c -> d -> m e) -> [a] -> [b] -> [c] -> [d] -> m ()
zipWith4M_ f as bs cs ds = mapM_ f' (zip4 as bs cs ds)
  where f' (a,b,c,d) = f a b c d




