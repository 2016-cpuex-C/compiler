{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}

module BackEnd.Second.Emit where

import Prelude hiding (Ordering(..))

import Base
import BackEnd.Decode
import BackEnd.Second.Asm
import BackEnd.Second.Analysis
import BackEnd.Second.RegAlloc
import BackEnd.Second.SSA_Deconstruction
import BackEnd.Second.BigInteger        (bigIntImm)

--import           Data.Int                   (Int16)
import           Data.Word                  (Word32)
import qualified Data.Map                   as M
import qualified Data.Set                   as S
import           Data.List                  ((\\))
import           Data.Vector                ((!))
import           Data.FileEmbed             (embedFile)
import qualified Data.ByteString.Char8      as BC
import           Control.Lens.Operators
import           Control.Monad.Trans.State
import           Text.Printf                (printf)
import           System.IO                  (Handle, hPutStrLn)
import           Data.Char                  (toLower)
import           Control.Arrow              (second)

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

data ES = ES {
    _hout          :: Handle
  , _colorMap      :: Map Id Color
  , _stack         :: Set Id
  , _offset'       :: Map Id Integer
  , _nextBlockName :: Maybe Label
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
  | otherwise = uses colorMap (M.lookup x) >>= \case
      Just (R n)  -> return $ regs!n
      _ -> error $ "reg: " ++ x

regF :: Id -> CamlE Register
regF x
  | isReg x   = return x
  | otherwise = uses colorMap (M.lookup x) >>= \case
      Just (F n)  -> return $ fregs!n
      _ -> error $ "regF: " ++ x

stackSize :: CamlE Integer
stackSize = do
  offsetMap <- use offset'
  return $ (+1) . maximumDef 0 $ M.elems offsetMap

offset :: Id -> CamlE Integer
offset x = do
  offsetMap <- use offset'
  case M.lookup x offsetMap of
    Just n -> return n
    Nothing -> do
      let n = fromIntegral $ M.size offsetMap + 1
      offset' %= M.insert x n
      return n

-------------------------------------------------------------------------------
-- Code Emit
-------------------------------------------------------------------------------

emitProg :: Handle -> AProg -> Caml ()
emitProg h prog = do
  ($logInfo) $ pack "generating assembly.."
  let write' = liftIO . hPutStrLn h
      (main_,others) = popMain prog

  -- floats && big integers
  -------------------------
  write' ".data"
  fdata <- use constFloats
  idata <- use bigIntegers
  forM_ fdata $ \(Label x,d) -> do
    write' $ printf "%s:\t# %.6f" x d
    write' $ printf "\t.word\t0x%08lx" (decodeFloatLE d)
  forM_ idata $ \(Label x,n) -> do
    write' $ printf "%s:\t# %d" x n
    write' $ printf "\t.word\t0x%08lx" (fromIntegral n :: Word32)

  -- main header
  ---------------
  write' ".text"
  liftIO $ hPutStrLn h "main:"
  sgp <- use startGP
  write' $ printf "\tli\t$gp, %d" sgp
  write' $ printf "\tli\t%s, 0" regZero

  -- functions
  -------------
  mapM_ (emitFun h) $ retToExit main_ : others

  -- libmincaml
  --------------
  write' $ BC.unpack $(embedFile "src/libmincaml.s")
  ($logInfo) $ pack "complete."

  where
    retToExit main' = main' { aBody = map retToExitB (aBody main') }
    retToExitB b = b { aStatements = map retToExitS (aStatements b) }
    retToExitS (i,Do ARet{}) = (i, Do AExit)
    retToExitS stmt = stmt

emitFun :: Handle -> AFunDef -> Caml ()
emitFun h f@(AFunDef l _ _ _ _) = do
  ($logInfo) $ pack "EmitFun: " <> show' l
  (f',colMap) <- regAlloc f
  --($logDebugSH) $ f
  f'' <- bigIntImm =<< ssaDeconstruct colMap f'
  --($logDebugSH) $ colMap
  --($logDebugSH) $ f''
  liftIO $ hPutStrLn h $ unLabel l ++ ":"
  liftIO $ hPutStrLn h $ "\tsw\t$ra, 0($sp)"
  stackMap <- stackInMap f''
  evalStateT (emitBlocks stackMap (sortBlocks f'')) ES {
      _hout          = h
    , _colorMap     = colMap
    , _stack         = S.empty
    , _offset'       = M.empty
    , _nextBlockName = Nothing
    }

emitBlocks :: Map Label (Set Id) -> [ABlock] -> CamlE ()
emitBlocks stackMap = go
  where
    go [] = return ()
    go (b:bs) = do
      nextBlockName .= (aBlockName <$> headMay bs)
      emitBlock (lookupMapNote "emitBlocks" (aBlockName b) stackMap) b
      go bs

emitBlock :: Set Id -> ABlock -> CamlE ()
emitBlock s (ABlock l stmts) = do
  stack .= s
  write $ unLabel l++":"
  mapM_ (emitInst.snd) stmts

emitInst :: Inst -> CamlE ()
emitInst = \case
  Do ANop -> return ()-- {{{
  x := ASet i -> write =<< printf "\tli\t%s, %d" <$> reg x <*> return i
    -- | fromIntegral (minBound::Int16) <= i &&
    --   i <= fromIntegral (maxBound::Int16) ->
    --     write =<< printf "\tli\t%s, %d" <$> reg x <*> return i
    -- -- | i > 65535 -> do
    -- --    let (hi,lo) = devideInteger i
    -- --    lift.($logInfo).pack $
    -- --      show i <> " is out of 16bits range\n" <>
    -- --      "devide into " <> show hi <> " and " <> show lo
    -- --    write =<< printf "\tli\t%s, %d"       <$> reg x <*> return hi
    -- --    write =<< printf "\tslli\t%s, %s, 16" <$> reg x <*> reg x
    -- --    write =<< printf "\taddi\t%s, %s, %d" <$> reg x <*> reg x <*> return lo
    -- | otherwise -> errorShow "tsurai..." (x:=ASet i)

  x := ASetBI l ->
        write =<< printf "\tlwl\t%s, %s" <$> reg x <*> return (unLabel l)

  x := ASetF l ->
        write =<< printf "\tl.sl\t%s, %s" <$> regF x <*> return (unLabel l)

  x := AMove y          -> move x y
  x := ANeg  y          -> rr  "neg"   x y
  x := AAdd y (V z)     -> rrr "add"   x y z
  x := AAdd y (C i)     -> rri "addi"  x y i
  x := ASub y (V z)     -> rrr "sub"   x y z
  x := ASub y (C i)     -> rri "addi"  x y (-i)
  x := AMul y (V z)     -> rrr "mult"  x y z
  x := AMul y (C i)     -> rri "multi" x y i
  x := ADiv y (V z)     -> rrr "div"   x y z
  x := ADiv y (C i)     -> rri "divi"  x y i
  x := ASrl y (V z)     -> rrr "srl"   x y z
  x := ASll y (V z)     -> rrr "sll"   x y z
  x := ASrl y (C i)
    | i >= 0            -> rri "srli" x y i
    | otherwise         -> rri "slli" x y (-i)
  x := ASll y (C i)
    | i >= 0            -> rri "slli" x y i
    | otherwise         -> rri "srli" x y (-i)
  x := ALd y (C i)      -> rri'"lwr" x y i
  Do (ASt x y (C i))    -> rri'"sw"  x y i
  x := ALdi i           -> rri'"lwr" x regZero i
  Do (ASti x i)         -> rri'"sw" x regZero i

  x := AFMov y          -> movs x y
  x := AFNeg y          -> ff  "neg.s" x y
  x := AFAdd y z        -> fff "add.s" x y z
  x := AFSub y z        -> fff "sub.s" x y z
  x := AFMul y z        -> fff "mul.s" x y z
  x := AFDiv y z        -> fff "div.s" x y z
  x := AFLd  y (C i)    -> fri'"l.sr"  x y i
  Do (AFSt x y (C i))   -> fri'"s.s"   x y i
  x := AFLdi i          -> fri'"l.sr"  x regZero i
  Do (AFSti x i)        -> fri'"s.s"   x regZero i

  x := AAnd y (V z)     -> rrr "and" x y z
  x := AOr  y (V z)     -> rrr "or"  x y z
  x := AXor y (V z)     -> rrr "xor" x y z
  x := AAnd y (C i)     -> rri "andi" x y i -- 使わない
  x := AOr  y (C i)     -> rri "ori"  x y i
  x := AXor y (C i)     -> rri "xori" x y i

  x := ACmp  p y (V z)  -> prrr "cmp"   p x y z
  x := ACmp  p y (C i)  -> prri "cmpi"  p x y i
  x := AFCmp p y z      -> prff "cmp.s" p x y z

  x := AF2I y           -> rf "cvt.w.s" x y
  x := AI2F y           -> fr "cvt.s.w" x y

  Do (ASwap  x y)       -> swap x y
  Do (AFSwap x y)       -> swaps x y

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
    forM_ nls $ \case
      (n,l) | within5 n -> ril "beqi" x n l
            | otherwise -> write (printf "\tli\t%s, %d" regTmp n)
                        >> rrl "beq"  x regTmp l
    br ldef

  Do (ACmpBr  p x (C i) lt lf) -> cmpbri p x i lt lf
  Do (ACmpBr  p x (V y) lt lf) -> cmpbr  p x y lt lf
  Do (AFCmpBr p x    y  lt lf) -> cmpbrs p x y lt lf

  Do (ASave  x_ x) -> save  x_ x
  Do (AFSave x_ x) -> saveF x_ x
  Do (ARestore x)  -> restore x x
  Do (AFRestore x) -> restoreF x x
  x := ARestore y  -> restore x y
  x := AFRestore y -> restoreF x y

  Do AExit -> write "\texit"

  x := APrim (Label "madd") _ [] [y,z,w] -> ffff "madd.s" x y z w
  x := APrim (Label "sqrt") _ [] [y]     -> ff "sqrt" x y
  x := APrim (Label "floor") _ [] [y]     -> ff "floor" x y

  e -> errorShow "Emit: " e

-- }}}

-------------------------------------------------------------------------------
-- Sort Basic Blocks
-------------------------------------------------------------------------------

-- なるべくbr命令が潰せるように並び替える
-- とりあえず貪欲法でやっている
-- TODO 最適解求めたい
sortBlocks :: AFunDef -> [ABlock]
sortBlocks f = map toBlock $ reverse $ execState (g (entryBlock f)) []
  where
    g b = do
      modify (aBlockName b:)
      visited <- get
      let succs = nextBlockNames b \\ visited
      case deleteAndFindFirstMay (`elem` prefer b) succs of
        Just (l,ls) -> mapM_ (g.toBlock) (l:ls)
        Nothing     -> mapM_ (g.toBlock) succs

    -- bの直後に出力すると嬉しい
    prefer b = case snd (lastStmt b) of
      Do (ABr l)                -> [l]
      Do (ACBr _ lt lf)         -> [lt,lf] -- cbrはどっちでも対応可能
      Do (ACmpBr  EQ _ _ lt lf) -> [lt,lf] -- eqとne両方あるので反転可能
      Do (ACmpBr  NE _ _ lt lf) -> [lt,lf]
      Do (ACmpBr  LT _ _ _  lf) -> [lf]
      Do (ACmpBr  GT _ _ _  lf) -> [lf]
      Do (ACmpBr  _  _ _ lt  _) -> [lt]    -- emitでflipするため
      Do (AFCmpBr EQ _ _ _  lf) -> [lf]
      Do (AFCmpBr LE _ _ _  lf) -> [lf]
      Do (AFCmpBr LT _ _ _  lf) -> [lf]
      Do (AFCmpBr _  _ _ lt _)  -> [lt]    -- 同上
      Do (ASwitch _ l _)        -> [l]
      _                         -> []

    toBlock l = lookupMapNote "sortBlocks" l (blockMap f)

deleteAndFindFirstMay :: (a -> Bool) -> [a] -> Maybe (a,[a])
deleteAndFindFirstMay _ [] = Nothing
deleteAndFindFirstMay p (a:as)
  | p a       = Just (a,as)
  | otherwise = second (a:) <$> deleteAndFindFirstMay p as

-------------------------------------------------------------------------------
-- 命令フォーマット
-------------------------------------------------------------------------------

-- {{{
rr :: String -> Id -> Id -> CamlE ()
rr s x y = write =<<
  printf "\t%s\t%s, %s\t# %s" s <$> reg x <*> reg y <*> return (unwords [s,x,y])

fr :: String -> Id -> Id -> CamlE ()
fr s x y = write =<<
  printf "\t%s\t%s, %s\t# %s" s <$> regF x <*> reg y <*> return (unwords [s,x,y])

rf :: String -> Id -> Id -> CamlE ()
rf s x y = write =<<
  printf "\t%s\t%s, %s\t# %s" s <$> reg x <*> regF y <*> return (unwords [s,x,y])

rrr :: String -> Id -> Id -> Id -> CamlE ()
rrr s x y z = write =<<
  printf "\t%s\t%s, %s, %s\t# %s" s <$> reg x <*> reg y <*> reg z <*> return (unwords [x,y,z])

rri :: String -> Id -> Id -> Integer -> CamlE ()
rri s x y i = write =<<
  printf "\t%s\t%s, %s, %d\t# %s" s <$> reg x <*> reg y <*> return i <*> return (unwords [x,y,show i])

rri' :: String -> Id -> Id -> Integer -> CamlE ()
rri' s x y i = write =<<
  printf "\t%s\t%s, %d(%s)# %s" s <$> reg x <*> return i <*> reg y <*> return (unwords [x,y,show i])

ri :: String -> Id -> Integer -> CamlE ()
ri s x i = write =<<
  printf "\t%s\t%s, %d" s <$> reg x <*> return i

ff :: String -> Id -> Id -> CamlE ()
ff s x y = write =<<
  printf "\t%s\t%s, %s# %s" s <$> regF x <*> regF y <*> return (unwords [x,y])

fff :: String -> Id -> Id -> Id -> CamlE ()
fff s x y z = write =<<
  printf "\t%s\t%s, %s, %s# %s" s <$> regF x <*> regF y <*> regF z <*> return (unwords [x,y,z])

fri' :: String -> Id -> Id -> Integer -> CamlE ()
fri' s x y i = write =<<
  printf "\t%s\t%s, %d(%s)# %s" s <$> regF x <*> return i <*> reg y <*> return (unwords [x,y])

rff :: String -> Id -> Id -> Id -> CamlE ()
rff s x y z = write =<<
  printf "\t%s\t%s, %s, %s" s <$> reg x <*> regF y <*> regF z

frff :: String -> Id -> Id -> Id -> Id -> CamlE ()
frff s x y z w = write =<<
  printf "\t%s\t%s, %s, %s, %s" s <$> regF x <*> reg y <*> regF z <*> regF w

rrrr :: String -> Id -> Id -> Id -> Id -> CamlE ()
rrrr s x y z w = write =<<
  printf "\t%s\t%s, %s, %s, %s" s <$> reg x <*> reg y <*> reg z <*> reg w

rrir :: String -> Id -> Id -> Integer -> Id -> CamlE ()
rrir s x y i w = write =<<
  printf "\t%s\t%s, %s, %d, %s" s <$> reg x <*> reg y <*> return i <*> reg w

rrri :: String -> Id -> Id -> Id -> Integer -> CamlE ()
rrri s x y z i = write =<<
  printf "\t%s\t%s, %s, %s, %d" s <$> reg x <*> reg y <*> reg z <*> return i

rrii :: String -> Id -> Id -> Integer -> Integer -> CamlE ()
rrii s x y i j = write =<<
  printf "\t%s\t%s, %s, %d, %d" s <$> reg x <*> reg y <*> return i <*> return j

ffff :: String -> Id -> Id -> Id -> Id -> CamlE ()
ffff s x y z w = write =<<
  printf "\t%s\t%s, %s, %s, %s" s <$> regF x <*> regF y <*> regF z <*> regF w

ril :: String -> Id -> Integer -> Label -> CamlE ()
ril s x i (Label l) = write =<<
  printf "\t%s\t%s, %d, %s" s <$> reg x <*> return i <*> return l

rrl :: String -> Id -> Id -> Label -> CamlE ()
rrl s x y (Label l) = write =<<
  printf "\t%s\t%s, %s, %s" s <$> reg x <*> reg y <*> return l

prrr :: Id -> Predicate -> Id -> Id -> Id -> CamlE ()
prrr s p x y z = write =<<
  printf "\t%s\t%s, %s, %s, %s" s <$> return (showPred p) <*> reg x <*> reg y <*> reg z

prri :: Id -> Predicate -> Id -> Id -> Integer -> CamlE ()
prri s p x y i = write =<<
  printf "\t%s\t%s, %s, %s, %d" s <$> return (showPred p) <*> reg x <*> reg y <*> return i

prff :: Id -> Predicate -> Id -> Id -> Id -> CamlE ()
prff s p x y z = write =<<
  printf "\t%s\t%s, %s, %s, %s" s <$> return (showPred p) <*> reg x <*> regF y <*> regF z

move :: Id -> Id -> CamlE ()
move x y = do
  rx <- reg x
  ry <- reg y
  let s | rx == ry  = "#mv" :: String
        | otherwise = "move"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

swap :: Id -> Id -> CamlE ()
swap x y = do
  rx <- reg x
  ry <- reg y
  let s | rx == ry  = "#swap" :: String
        | otherwise = "swap"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

movs :: Id -> Id -> CamlE ()
movs x y = do
  rx <- regF x
  ry <- regF y
  let s | rx == ry  = "#mv" :: String
        | otherwise = "mov.s"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

swaps :: Id -> Id -> CamlE ()
swaps x y = do
  rx <- regF x
  ry <- regF y
  let s | rx == ry  = "#swaps" :: String
        | otherwise = "swap.s"
  when (rx/=ry) $ write $ printf "\t%s\t%s, %s" s rx ry

br :: Label -> CamlE ()
br l = use nextBlockName >>= \case
  Just l' | l==l' -> write $ printf "\t#%s\t%s" "j" (unLabel l)
  _               -> write $ printf "\t%s\t%s" "j" (unLabel l)

cbr :: Id -> Label -> Label -> CamlE ()
cbr b lt lf = use nextBlockName >>= \case
  Just l
    | l==lf -> branch "beqi" (reg b) (return "0") lf lt
    | l==lt -> branch "beqi" (reg b) (return "1") lt lf
  _ -> branch "beqi" (reg b) (return "0") lf lt

cmpbr  :: Predicate -> Id -> Id -> Label -> Label -> CamlE ()
cmpbr LE x y lt lf = cmpbr GT x y lf lt
cmpbr GE x y lt lf = cmpbr LT x y lf lt
cmpbr NE x y lt lf = use nextBlockName >>= \case
  Just l
    | l == lt   -> branch ("beq") (reg x) (reg y) lf lt
  _             -> branch ("bne") (reg x) (reg y) lt lf
cmpbr EQ x y lt lf = use nextBlockName >>= \case
  Just l
    | l == lt   -> branch ("bne") (reg x) (reg y) lf lt
  _             -> branch ("beq") (reg x) (reg y) lt lf
cmpbr  p x y lt lf = branch ("b"++showPred p) (reg x) (reg y) lt lf

cmpbri :: Predicate -> Id -> Integer -> Label -> Label -> CamlE ()
cmpbri LE x i lt lf = cmpbri GT x i lf lt
cmpbri GE x i lt lf = cmpbri LT x i lf lt
cmpbri NE x i lt lf = use nextBlockName >>= \case
  Just l
    | l == lt   -> branch ("beqi") (reg x) (return (show i)) lf lt
  _             -> branch ("bnei") (reg x) (return (show i)) lt lf
cmpbri EQ x i lt lf = use nextBlockName >>= \case
  Just l
    | l == lt   -> branch ("bnei") (reg x) (return (show i)) lf lt
  _             -> branch ("beqi") (reg x) (return (show i)) lt lf
cmpbri  p x i lt lf = branch ("b"++showPred p++"i") (reg x) (return (show i)) lt lf

cmpbrs :: Predicate -> Id -> Id -> Label -> Label -> CamlE ()
cmpbrs NE x y lt lf = cmpbrs EQ x y lf lt
cmpbrs GE x y lt lf = cmpbrs LT x y lf lt
cmpbrs GT x y lt lf = cmpbrs LE x y lf lt
cmpbrs  p x y lt lf = branch ("c."++showPred p++".s") (regF x) (regF y) lt lf

branch :: String       -- 命令
       -> CamlE String -- operand1
       -> CamlE String -- operand2
       -> Label        -- dist (if true)
       -> Label        -- dist (if false)
       -> CamlE ()
branch s x' y' lt lf = do
  write =<< printf "\t%s\t%s, %s, %s" s <$> x' <*> y' <*> return (unLabel lt)
  br lf

ret :: CamlE ()
ret = do
  rri' "lwr"  regRa regSp 0
  write $ printf "\tjr\t%s" regRa

call :: Type -> Maybe Id -> Label -> [Id] -> [Id] -> CamlE ()
call t mx (Label f) _ys _zs = do
  ss <- stackSize
  rri  "addi" regSp regSp ss
  write $ "\tjal " ++ f ++ "\t# " ++ show mx
  rri  "addi" regSp regSp (-ss)
  case mx of
    Nothing -> return ()
    Just x | t == TFloat -> movs x (fregs!0)
           | otherwise   -> move x (regs!0)

tailCall :: Label -> [Id] -> [Id] -> CamlE ()
tailCall (Label f) _ys _zs = do
  rri' "lwr"  regRa regSp 0
  write $ "\tj " ++ f

push :: Id -> CamlE ()
push x = stack %= S.insert x

save :: Id -> Id -> CamlE ()
save x_ x = uses stack (S.member x) >>= \case
  True  -> write $ "\t# "++ x ++ " is already saved: "
  False -> do push x
              n <- offset x
              rri' "sw" x_ regSp n
              {-rri' "save" x_ regSp n-}
              write $ "\t\t# save: " ++ x

saveF :: Id -> Id -> CamlE ()
saveF x_ x = uses stack (S.member x) >>= \case
  True  -> write $ "\t# "++ x ++ " is already saved: "
  False -> do push x
              n <- offset x
              fri' "s.s" x_ regSp n
              {-fri' "save.s" x_ regSp n-}
              write $ "\t\t# save: " ++ x

restore :: Id -> Id -> CamlE ()
restore x y = do
  n <- offset y
  rri' "lwr" x regSp n
  {-rri' "restore" x regSp n-}
  write $ "\t\t# restore: " ++ x ++ "<-" ++ y

restoreF :: Id -> Id -> CamlE ()
restoreF x y = do
  n <- offset y
  fri' "l.sr" x regSp n
  {-fri' "restore.s" x regSp n-}
  write $ "\t\t# restore: " ++ x ++ "<-" ++ y

showPred :: Predicate -> String
showPred = map toLower . show

-- }}}

