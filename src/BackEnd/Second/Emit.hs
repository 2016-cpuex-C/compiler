{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns #-}

module BackEnd.Second.Emit where

import Prelude hiding (log, Ordering(..))

import Base hiding (unsafeLookup)
import BackEnd.Decode
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import BackEnd.Second.RegAlloc.Coloring
import BackEnd.Second.SSA_Deconstruction

import           Safe
import           Data.Int                   (Int16)
import           Data.Map                   (Map)
import qualified Data.Map                   as M
import           Data.Set                   (Set)
import qualified Data.Set                   as S
import           Data.Tree
import           Data.Vector                ((!))
import           Data.FileEmbed             (embedFile)
import qualified Data.ByteString.Char8      as BC
import           Control.Lens               (use,uses,makeLenses)
import           Control.Lens.Operators
import           Control.Monad (forM_, unless, when)
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
stackSize = (1+) <$> uses stack (M.foldl' max 0)

offset :: Id -> CamlE Integer
offset x = fromJustNote ("offset: "++x) <$> uses stack (M.lookup x)

-------------------------------------------------------------------------------
-- Code Emit
-------------------------------------------------------------------------------

emitProg :: Handle -> AProg -> Caml ()
emitProg h prog = do
  log "generating assembly.."
  let write' = liftIO . hPutStrLn h
      (main,others) = popMain prog

  -- floats
  ----------
  write' ".data"
  fdata <- use constFloats
  forM_ fdata $ \(Label x,d) -> do
      write' $ printf "%s:\t# %.6f" x d
      write' $ printf "\t.word\t0x%08lx" (decodeFloatLE d)

  -- main header
  ---------------
  write' ".text"
  liftIO $ hPutStrLn h "main:"
  sgp <- use startGP
  write' $ printf "\tli\t$gp, %d" sgp
  write' $ printf "\tli\t%s, 0" regZero

  -- functions
  -------------
  mapM_ (emitFun h) $ retToExit main : others

  -- libmincaml
  --------------
  write' $ BC.unpack $(embedFile "src/libmincaml.s")
  log "complete."

  where
    retToExit main' = main' { aBody = map retToExitB (aBody main') }
    retToExitB b = b { aStatements = map retToExitS (aStatements b) }
    retToExitS (i,Do ARet{}) = (i, Do AExit)
    retToExitS stmt = stmt

emitFun :: Handle -> AFunDef -> Caml ()
emitFun h f = do
  log $ show f
  colMaps <- colorFun f
  f'@(AFunDef l _ _ _ _) <- ssaDeconstruct colMaps f
  log $ show colMaps
  {-log $ show f'-}
  liftIO $ hPutStrLn h $ unLabel l ++ ":"
  let stackMap = stackSets f'
  evalStateT (emitTree stackMap $ dfsBlock f') ES {
      _hout      = h
    , _colorMaps = colMaps
    , _stack     = M.empty
    }

emitTree :: Map Label (Set Id) -> Tree ABlock -> CamlE ()
emitTree stackMap (Node b ts) = do
  let Just s = M.lookup (aBlockName b) stackMap
  emitBlock s b
  stkBak <- use stack
  forM_ ts $ \t -> do
    emitTree stackMap t
    stack .= stkBak

emitBlock :: Set Id -> ABlock -> CamlE ()
emitBlock s (ABlock l stmts) = do
  stack %= M.filterWithKey (\k _ -> k `S.member` s)
  stk <- use stack
  unless (all (`M.member` stk) s) $ error . unlines . map unwords $
    [ [ "emitBlock: bug: at", unLabel l ]
    , [ show s, "should have been already saved" ]
    , [ "but only ", show stk, "is actualy saved" ]
    ]
  write $ unLabel l++":"
  mapM_ (emitInst.snd) stmts

emitInst :: Inst -> CamlE ()
emitInst = \case
  Do ANop -> return ()-- {{{
  x := ASet i
      -- TODO 65535くらいの値を入れると変
      --      分解するときWord16にしてるっぽい
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

  x := AMove y          -> move x y
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

  x := AFMov y          -> movs x y
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

  x := ACall t f ys zs  -> call t (Just x) f ys zs
  Do (ACall  t f ys zs) -> call t Nothing  f ys zs
  Do (ATailCall _ f ys zs) -> tailCall f ys zs

  x := ASelect TFloat b y z -> frff "select.s" x b y z
  x := ASelect _      b y z -> rrrr "select" x b y z

  x := AGetHP         -> move x regHp
  Do (AStHP x (C i))  -> rri'"sw"  x regHp i
  Do (AFStHP x (C i)) -> fri'"s.s" x regHp i
  Do (AIncHP (C i))   -> rri "addi" regHp regHp i

  Do (ARet _ Nothing)           -> ret
  Do (ARet _ (Just (C i)))      -> ri "li"    (regs!0)  i >> ret
  Do (ARet TFloat (Just (V x))) -> movs (fregs!0) x >> ret
  Do (ARet _      (Just (V x))) -> move (regs!0)  x >> ret

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


--rr :: String -> Id -> Id -> CamlE ()
--rr s x y =
--  write =<< printf "\t%s\t%s, %s" s <$> reg x <*> reg y
move :: Id -> Id -> CamlE ()
move x y = do
  rx <- reg x
  ry <- reg y
  let s | rx == ry  = "#mv"
        | otherwise = "move"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

movs :: Id -> Id -> CamlE ()
movs x y = do
  rx <- regF x
  ry <- regF y
  let s | rx == ry  = "#mv"
        | otherwise = "mov.s"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

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
    Just x | t == TFloat -> movs x (fregs!0)
           | otherwise   -> move x (regs!0)

tailCall :: Label -> [Id] -> [Id] -> CamlE ()
tailCall (Label f) ys zs = do
  setArgs ys zs
  write $ "\tj " ++ f

setArgs :: [Id] -> [Id] -> CamlE ()
setArgs xs ys = do
  (colMap,colMapF)  <- use colorMaps
  let reg' x  | isReg x             = x
              | M.member x colMap   = regs ! unsafeLookup x colMap
              | otherwise           = error $ "setArgs: reg': " ++ x
      regF' x | isReg x             = x
              | M.member x colMapF  = fregs ! unsafeLookup x colMapF
              | otherwise           = error $ "setArgs: regF': " ++ x

      actToInst'  (Nop  (_,_)) = Do ANop
      actToInst'  (Move (x,y)) = x := AMove y
      actToInst'  (Swap (x,y)) = Do (ASwap x y)
      actToInstF' (Nop  (_,_)) = Do ANop
      actToInstF' (Move (x,y)) = x := AFMov y
      actToInstF' (Swap (x,y)) = Do (AFSwap x y)

      inst'  = map actToInst'  $ resolveBy reg'  $ zip allRegs  xs
      instF' = map actToInstF' $ resolveBy regF' $ zip allFRegs ys
  mapM_ emitInst $ inst' ++ instF'

{-|| resolveBy :: Eq b => (a -> b) -> [(a, a)] -> [Action a]-}

push :: Id -> CamlE ()
push x = do
  -- TODO stackSizeではなく空いてる番号を使う
  ss <- stackSize
  stack %= M.insert x ss

save :: Id -> CamlE ()
save x = uses stack (M.member x) >>= \case
  True  -> return ()--write $ "\t# already saved: " ++ x
  False -> do push x
              n <- offset x
              rri' "sw" x regSp n
              {-write $ "\t\t# save: " ++ x-}

saveF :: Id -> CamlE ()
saveF x = uses stack (M.member x) >>= \case
  True  -> return()--write $ "\t# already saved: " ++ x
  False -> do push x
              n <- offset x
              fri' "s.s" x regSp n
              {-write $ "\t\t# save: " ++ x-}

restore :: Id -> CamlE ()
restore x = do
  n <- offset x
  rri' "lwr" x regSp n
  {-write $ "\t\t# restore: " ++ x-}

restoreF :: Id -> CamlE ()
restoreF x = do
  n <- offset x
  fri' "l.sr" x regSp n
  {-write $ "\t\t# restore: " ++ x-}

-- }}}

unsafeLookup :: (Show a, Ord a) => a -> Map a b -> b
unsafeLookup key dic = fromJustNote ("Emit: unsafeLookup: "++ show key) $ M.lookup key dic

