{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.Emit where

import Prelude hiding (log, Ordering(..))

import Base hiding (unsafeLookup)
import BackEnd.Decode
import BackEnd.Second.Asm
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.SSA_Deconstruction hiding (unsafeLookup)

import           Data.Int                   (Int16)
import           Data.Map                   (Map)
import qualified Data.Map                   as M
import           Data.Maybe                 (fromJust, fromMaybe)
import           Data.Vector                ((!))
import           Data.FileEmbed             (embedFile)
import qualified Data.ByteString.Char8      as BC
import           Control.Lens               (use,uses,makeLenses)
import           Control.Lens.Operators
import           Control.Monad              (forM_)
import           Control.Monad.Trans.State
import           Text.Printf                (printf)
import           System.IO                  (Handle, hPutStrLn)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data ES = ES {
    _hout      :: Handle
  , _colorMaps :: (Map Id Color, Map Id Color)
  , _stack     :: Map Id Integer
  }
makeLenses ''ES

type CamlE = StateT ES Caml

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

write :: String -> CamlE ()
write s = do
  h <- use hout
  liftIO $ hPutStrLn h s

reg :: Id -> CamlE Register
reg x
  | isReg x   = return x
  | otherwise = do
      colMap <- uses colorMaps fst
      case M.lookup x colMap of
        Just n  -> return $ regs!n
        Nothing -> error $ "reg: " ++ x

regF :: Id -> CamlE Register
regF x
  | isReg x   = return x
  | otherwise = do
      colMapF <- uses colorMaps snd
      case M.lookup x colMapF of
        Just n  -> return $ fregs!n
        Nothing -> error $ "freg: " ++ x

stackSize :: CamlE Integer
stackSize = fromIntegral <$> uses stack M.size

offset :: Id -> CamlE Integer
offset x = fromJust <$> uses stack (M.lookup x)

-------------------------------------------------------------------------------
-- Code Emit
-------------------------------------------------------------------------------

emitProg :: Handle -> AProg -> Caml ()
emitProg h prog = do
  log "generating assembly.."
  let write' = liftIO . hPutStrLn h
      (main,others) = mainAndOthers prog

  -- floats
  ----------
  write' ".data"
  fdata <- use constFloats
  forM_ fdata $ \(Label x,d) -> do
      write' $ printf "%s:\t# %.6f" x d
      write' $ printf "\t.word\t0x%08lx" (decodeFloatLE d)

  -- main
  --------
  emitMain h main

  -- other functions
  -------------------
  mapM_ (emitFun h) others

  -- libmincaml
  --------------
  write' $ BC.unpack $(embedFile "src/libmincaml.s")

-- うわあきたないいい
emitMain :: Handle -> AFunDef -> Caml ()
emitMain h f = do
  let write' = liftIO . hPutStrLn h
  colMaps <- colorFun f
  f'@(AFunDef (Label x) _ _ _ _) <- ssaDeconstruct colMaps f
  {-log $ show colMaps-}
  {-log $ show f'-}
  liftIO $ hPutStrLn h $ x ++ ":"
  sgp <- use startGP
  write' $ printf "\tli\t$gp, %d" sgp
  write' $ printf "\tli\t%s, 0" regZero
  evalStateT (mapM_ emitBlock (sortBlock $ retToExit f')) ES {
      _hout      = h
    , _colorMaps = colMaps
    , _stack     = M.empty
    }
  where
    retToExit f_ = f_ { aBody = map retToExitB (aBody f_) }
    retToExitB b = b { aStatements = map retToExitS (aStatements b) }
    retToExitS (i,Do ARet{}) = (i, Do AExit)
    retToExitS stmt = stmt

-- TODO stack 合流する場合intersectionを取る必要あり．
emitFun :: Handle -> AFunDef -> Caml ()
emitFun h f = do
  colMaps <- colorFun f
  {-log $ show f-}
  f'@(AFunDef (Label x) _ _ _ _) <- ssaDeconstruct colMaps f
  {-log $ show colMaps-}
  log $ show f'
  liftIO $ hPutStrLn h $ x ++ ":"
  evalStateT (mapM_ emitBlock (sortBlock f')) ES {
      _hout      = h
    , _colorMaps = colMaps
    , _stack     = M.empty
    }

emitBlock :: ABlock -> CamlE ()
emitBlock (ABlock (Label l) stmts) = do
  stack .= M.empty -- TODO
  {-lift.log $ l-}
  {-use stack >>= lift.log.show-}
  write $ l++":"
  mapM_ (emitInst.snd) stmts

emitInst :: Inst -> CamlE ()
emitInst = \case
  Do ANop -> return ()-- {{{
  x := ASet i
      -- TODO 65535くらいの値を入れると変
      --      分解するときWord16にしてる？
    | fromIntegral (minBound::Int16) <= i &&
      i <= fromIntegral (maxBound::Int16) ->
        write =<< printf "\tli\t%s, %d" <$> reg x <*> return i
    | otherwise -> do
        let (hi,lo) = devideInteger i
        lift.log $ show i ++ " is out of 16bits range\n" ++
                   "devide into " ++ show hi ++ " and " ++ show lo
        write =<< printf "\tli\t%s, %d"       <$> reg x <*> return hi
        write =<< printf "\tsll\t%s, %s, 16"  <$> reg x <*> reg x
        write =<< printf "\taddi\t%s, %s, %d" <$> reg x <*> reg x <*> return lo

  x := ASetF (Label l) ->
        write =<< printf "\tl.sl\t%s, %s" <$> regF x <*> return l

  x := AMove y          -> rr  "move"  x y -- TODO 等しい時は不要
  x := AAdd y (V z)     -> rrr "add"   x y z
  x := AAdd y (C i)     -> rri "addi"  x y i
  x := ASub y (V z)     -> rrr "sub"   x y z
  x := ASub y (C i)     -> rri "subi"  x y i
  x := AMul y (V z)     -> rrr "mult"  x y z
  x := AMul y (C i)     -> rri "multi" x y i
  x := ADiv y (V z)     -> rrr "div"   x y z
  x := ADiv y (C i)     -> rri "divi"  x y i
  x := ASll y (C i)
    | i >= 0            -> rri "sll" x y i
    | otherwise         -> rri "srl" x y (-i)
  x := ASrl y (C i)
    | i >= 0            -> rri "srl" x y i
    | otherwise         -> rri "sll" x y (-i)
  x := ALd y (C i)      -> rri'"lwr" x y i
  Do (ASt x y (C i))    -> rri'"sw"  x y i
  x := ALdi i           -> rri'"lwr" x regZero i
  Do (ASti x i)         -> rri'"sw" x regZero i

  x := AFMov y          -> ff  "mov.s" x y
  x := AFAdd y z        -> fff "add.s" x y z
  x := AFSub y z        -> fff "sub.s" x y z
  x := AFMul y z        -> fff "mul.s" x y z
  x := AFDiv y z        -> fff "div.s" x y z
  x := AFLd  y (C i)    -> fri'"l.sr"  x y i
  Do (AFSt x y (C i))   -> fri'"s.s"   x y i >> write ("#" ++ show (x,y))
  x := AFLdi i          -> fri'"l.sr"  x regZero i
  Do (AFSti x i)        -> fri'"s.s"   x regZero i

  x := AAnd y (V z)     -> rrr "and" x y z
  x := AOr  y (V z)     -> rrr "or"  x y z
  x := AXor y (V z)     -> rrr "xor" x y z
  x := AAnd y (C i)     -> rri "andi" x y i -- 使わない
  x := AOr  y (C i)     -> rri "ori"  x y i
  x := AXor y (C i)     -> rri "xori" x y i

  x := ACmp EQ y (V z)  -> rrr "cmp.eq" x y z
  x := ACmp NE y (V z)  -> rrr "cmp.ne" x y z
  x := ACmp LE y (V z)  -> rrr "cmp.le" x y z
  x := ACmp GE y (V z)  -> rrr "cmp.ge" x y z
  x := ACmp LT y (V z)  -> rrr "cmp.lt" x y z
  x := ACmp GT y (V z)  -> rrr "cmp.gt" x y z
  x := ACmp EQ y (C i)  -> rri "cmpi.eq" x y i
  x := ACmp NE y (C i)  -> rri "cmpi.ne" x y i
  x := ACmp LE y (C i)  -> rri "cmpi.le" x y i
  x := ACmp GE y (C i)  -> rri "cmpi.ge" x y i
  x := ACmp LT y (C i)  -> rri "cmpi.lt" x y i
  x := ACmp GT y (C i)  -> rri "cmpi.gt" x y i

  x := AFCmp EQ y z     -> rff "cmp.eq.s" x y z
  x := AFCmp NE y z     -> rff "cmp.ne.s" x y z
  x := AFCmp LE y z     -> rff "cmp.le.s" x y z
  x := AFCmp GE y z     -> rff "cmp.ge.s" x y z
  x := AFCmp LT y z     -> rff "cmp.lt.s" x y z
  x := AFCmp GT y z     -> rff "cmp.gt.s" x y z

  Do (ASwap  x y)       -> rr "swap" x y
  Do (AFSwap x y)       -> ff "swap.s" x y

  x := ACallDir t f ys zs  -> call t (Just x) f ys zs
  Do (ACallDir  t f ys zs) -> call t Nothing  f ys zs

  x := ASelect TFloat b (V y) (V z) -> frff "select.s" x b y z
  x := ASelect _      b (V y) (V z) -> rrrr "select" x b y z
  {-x := ASelect _      b (C i) (V z) -> rrir "select" x b i z-}
  {-x := ASelect _      b (V y) (C i) -> rrri "select" x b y i-}
  {-x := ASelect _      b (C i) (C j) -> rrii "select" x b i j-}

  x := AGetHP         -> rr "move" x regHp
  Do (AStHP x (C i))  -> rri'"sw"  x regHp i
  Do (AFStHP x (C i)) -> fri'"s.s" x regHp i
  Do (AIncHP (C i))   -> rri "addi" regHp regHp i

  Do (ARet _ Nothing)           -> ret
  Do (ARet _ (Just (C i)))      -> ri "li"    (regs!0)  i >> ret
  Do (ARet TFloat (Just (V x))) -> ff "mov.s" (fregs!0) x >> ret
  Do (ARet _      (Just (V x))) -> rr "move"  (regs!0)  x >> ret
  Do (ABr l)                    -> br l
  Do (ACBr b lt lf)             -> cbr b lt lf
  Do (ASwitch x ldef nls) -> do
    mapM_ (\(n,l) -> ril "beqi" x n l) nls
    br ldef

  Do (ASave  x)    -> save x
  Do (AFSave x)    -> saveF x
  Do (ARestore x)  -> restore x
  Do (AFRestore x) -> restoreF x

  Do AExit -> write "\texit"

  e -> error $ "Emit: " ++ show e

-- }}}

-------------------------------------------------------------------------------
-- 命令フォーマット
-------------------------------------------------------------------------------

-- {{{
rr :: String -> Id -> Id -> CamlE ()
rr s x y =
  write =<< printf "\t%s\t%s, %s" s <$> reg x <*> reg y

rrr :: String -> Id -> Id -> Id -> CamlE ()
rrr s x y z =
  write =<< printf "\t%s\t%s, %s, %s" s <$> reg x <*> reg y <*> reg z

rri :: String -> Id -> Id -> Integer -> CamlE ()
rri s x y i =
  write =<< printf "\t%s\t%s, %s, %d" s <$> reg x <*> reg y <*> return i

rri' :: String -> Id -> Id -> Integer -> CamlE ()
rri' s x y i =
  write =<< printf "\t%s\t%s, %d(%s)" s <$> reg x <*> return i <*> reg y

ri :: String -> Id -> Integer -> CamlE ()
ri s x i =
  write =<< printf "\t%s\t%s, %d" s <$> reg x <*> return i

ff :: String -> Id -> Id -> CamlE ()
ff s x y =
  write =<< printf "\t%s\t%s, %s" s <$> regF x <*> regF y

fff :: String -> Id -> Id -> Id -> CamlE ()
fff s x y z =
  write =<< printf "\t%s\t%s, %s, %s" s <$> regF x <*> regF y <*> regF z

fri' :: String -> Id -> Id -> Integer -> CamlE ()
fri' s x y i =
  write =<< printf "\t%s\t%s, %d(%s)" s <$> regF x <*> return i <*> reg y

fi :: String -> Id -> Integer -> CamlE ()
fi s x i =
  write =<< printf "\t%s\t%s, %d" s <$> regF x <*> return i

rff :: String -> Id -> Id -> Id -> CamlE ()
rff s x y z =
  write =<< printf "\t%s\t%s, %s, %s" s <$> reg x <*> regF y <*> regF z

frff :: String -> Id -> Id -> Id -> Id -> CamlE ()
frff s x y z w =
  write =<< printf "\t%s\t%s, %s, %s, %s" s <$> regF x <*> reg y <*> regF z <*> regF w

rrrr :: String -> Id -> Id -> Id -> Id -> CamlE ()
rrrr s x y z w =
  write =<< printf "\t%s\t%s, %s, %s, %s" s <$> reg x <*> reg y <*> reg z <*> reg w

rrir :: String -> Id -> Id -> Integer -> Id -> CamlE ()
rrir s x y i w =
  write =<< printf "\t%s\t%s, %s, %d, %s" s <$> reg x <*> reg y <*> return i <*> reg w

rrri :: String -> Id -> Id -> Id -> Integer -> CamlE ()
rrri s x y z i =
  write =<< printf "\t%s\t%s, %s, %s, %d" s <$> reg x <*> reg y <*> reg z <*> return i

rrii :: String -> Id -> Id -> Integer -> Integer -> CamlE ()
rrii s x y i j =
  write =<< printf "\t%s\t%s, %s, %d, %d" s <$> reg x <*> reg y <*> return i <*> return j

ril :: String -> Id -> Integer -> Label -> CamlE ()
ril s x i (Label l) =
  write =<< printf "\t%s\t%s, %d, %s" s <$> reg x <*> return i <*> return l


br :: Label -> CamlE ()
br (Label x) =
  write $ printf "\t%s\t%s" "j" x

cbr :: Id -> Label -> Label -> CamlE ()
cbr b (Label x) (Label y) = do
  write =<< printf "\tbeqz\t%s, %s" <$> reg b <*> return y
  write =<< printf "\tj\t%s" <$> return x

ret :: CamlE ()
ret = write $ printf "\tjr\t%s" regRa

call :: Type -> Maybe Id -> Label -> [Id] -> [Id] -> CamlE ()
call t mx (Label f) ys zs = do
  setArgs ys zs
  ss <- stackSize
  rri' "sw"   regRa regSp ss
  rri  "addi" regSp regSp (ss+1)
  write $ "\tjal " ++ f ++ "\t# " ++ show mx
  rri  "addi" regSp regSp (-ss-1)
  rri' "lwr"  regRa regSp ss
  case mx of
    Nothing -> return ()
    Just x | t == TFloat -> ff "mov.s" x (fregs!0)
           | otherwise   -> rr "move" x (regs!0)

setArgs :: [Id] -> [Id] -> CamlE ()
setArgs xs ys = do
  (colMap,colMapF)  <- use colorMaps
  let reg' x  | isReg x             = x
              | M.member x colMap   = regs ! unsafeLookup x colMap
              | otherwise           = error $ "setArgs: reg': " ++ x
      regF' x | isReg x             = x
              | M.member x colMapF  = fregs ! unsafeLookup x colMapF
              | otherwise           = error $ "setArgs: regF': " ++ x
      inst'  = map actToInst  $ resolveBy reg'  $ zip allRegs  xs
      instF' = map actToInstF $ resolveBy regF' $ zip allFRegs ys
  mapM_ emitInst $ inst' ++ instF'

push :: Id -> CamlE ()
push x = do
  ss <- stackSize
  stack %= M.insert x ss

save :: Id -> CamlE ()
save x = uses stack (M.member x) >>= \case
  True  -> write $ "\t# already saved: " ++ x
  False -> do push x
              n <- offset x
              rri' "sw" x regSp n
              write $ "\t\t# save: " ++ x

saveF :: Id -> CamlE ()
saveF x = uses stack (M.member x) >>= \case
  True  -> write $ "\t# already saved: " ++ x
  False -> do push x
              n <- offset x
              fri' "s.s" x regSp n
              write $ "\t\t# save: " ++ x

restore :: Id -> CamlE ()
restore x = do
  n <- offset x
  rri' "lwr" x regSp n
  write $ "\t\t# restore: " ++ x

restoreF :: Id -> CamlE ()
restoreF x = do
  n <- offset x
  fri' "l.sr" x regSp n
  write $ "\t\t# restore: " ++ x

-- }}}

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromMaybe (error $ "Emit: unsafeLookup: "++ show key) $ M.lookup key dic

