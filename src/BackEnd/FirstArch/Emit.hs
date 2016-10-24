{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BackEnd.FirstArch.Emit where

import Prelude hiding (exp, log)

import Base
import BackEnd.Decode (decodeFloatLE)
import BackEnd.FirstArch.Asm

import qualified Data.Set as S
import           Data.Set                       (Set)
import           Data.Vector ((!))
import           Control.Lens
import           Data.List (foldl', partition)
import           Control.Exception.Base (assert)
import           Control.Monad (when, forM_)
import           System.IO (Handle, hPutStrLn)
import           Text.Printf
import           Control.Monad.Trans.State.Lazy
import           Control.Monad.Trans.Class (lift)

data EmitState = EmitState { _stackSet :: Set Id
                           , _stackMap :: [Id] }
makeLenses ''EmitState
type CamlE = StateT EmitState Caml


save :: Id -> CamlE ()
save x = do
  stackSet %= S.insert x
  stackMap %= \l -> if x `elem` l then l else l++[x]

-- singleにしたのでsaveと変わらない
savef :: Id -> CamlE ()
savef x = do
  stackSet %= S.insert x
  stackMap %= \l -> if x `elem` l then l else l++[x]

locate :: Id -> CamlE [Int]
locate x = uses stackMap loc
  where loc [] = []
        loc (y:zs) | x == y    = 0 : map succ (loc zs)
                   | otherwise = map succ (loc zs)
offset :: Id -> CamlE Int
offset x = (4*).head <$> locate x

stackSize :: CamlE Int
stackSize = uses stackMap (align . (4*) . (+1) . length)

ppIdOrImm :: IdOrImm -> String
ppIdOrImm (V x) = x
ppIdOrImm (C i) = show i

shuffle :: String -> [(Id,Id)] -> [(Id,Id)]
shuffle sw xys =
  let (_,xys'') = partition (uncurry (==)) xys
                --rm identical move
      tmp  = partition (\(_,y) -> memAssoc y xys) xys''
                --(cyclic, acyclic)
  in case tmp of
    ([],[]) -> []
    ((x,y):xys',[]) ->
        let f (y',z) | y == y'   = (sw,z)
                     | otherwise = (y',z)
        in (y,sw) : (x,y) : shuffle sw (map f xys')
    (xys',acyc) -> acyc ++ shuffle sw xys'

data Dest = Tail | NonTail Id

g :: Handle -> (Dest,Asm) -> CamlE ()
g oc = \case
  (dest, AsmAns exp) -> g' oc (dest,exp)
  (dest, AsmLet (x,_t) exp e) -> g' oc (NonTail x, exp) >> g oc (dest, e)

g' :: Handle -> (Dest,AExpr) -> CamlE ()
g' oc (dest,exp) =
  let write s = liftIO $ hPutStrLn oc s
  in case dest of
    -- Nontailなら結果をdestにセットする.
    NonTail x -> case exp of
      ANop -> return ()
      ASet i | -32768 > i || i > 32767 -> throw $ Failure "即値はみ出た"
             | otherwise -> write $ printf "\tli\t%s, %d" x i
      ASetF (Label l) ->    write $ printf "\tl.sl\t%s, %s" x l
      ASetL (Label y) ->    write $ printf "\tla\t%s, %s" x y

      AMov y ->  when (x /= y) $ write $ printf "\taddi\t%s, %s, 0" x y
      ANeg y ->  write $ printf "\tneg\t%s, %s" x y

      AAdd y (V z) -> write $ printf "\tadd\t%s, %s, %s" x y z
      AAdd y (C i) -> write $ printf "\taddi\t%s, %s, %d" x y i
      ASub y (V z) -> write $ printf "\tsub\t%s, %s, %s" x y z
      ASub y (C i) -> write $ printf "\tsubi\t%s, %s, %d" x y i -- #
      AMul y (V z) -> write $ printf "\tmult\t%s, %s, %s" x y z
      AMul y (C i) -> write $ printf "\tmulti\t%s, %s, %d" x y i -- #
      ADiv y (V z) -> write $ printf "\tdiv\t%s, %s" y z -- #
      ADiv y (C i) -> write $ printf "\tdivi\t%s, %s, %d" x y i -- #
      ASll y i -- TODO ASrl追加しよう
        | i >= 0    -> write $ printf "\tsll\t%s, %s, %d" x y i
        | otherwise -> write $ printf "\tsrl\t%s, %s, %d" x y (-i)

      AFMovD y   -> write $ printf "\tmov.s\t%s, %s" x y
      AFNegD y   -> write $ printf "\tneg.s\t%s, %s" x y
      AFAddD y z -> write $ printf "\tadd.s\t%s, %s, %s" x y z
      AFSubD y z -> write $ printf "\tsub.s\t%s, %s, %s" x y z
      AFMulD y z -> write $ printf "\tmul.s\t%s, %s, %s" x y z
      AFDivD y z -> write $ printf "\tdiv.s\t%s, %s, %s" x y z

      ALd y (V z) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd y z
          write $ printf "\tlwr\t%s, 0(%s)" x regAd
      ALd y (C i) -> do
          write $ printf "\tlwr\t%s, %d(%s)" x i y
      ASt y z (V w) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd z w
          write $ printf "\tsw\t%s, 0(%s)" y regAd
      ASt y z (C i) -> do
          write $ printf "\tsw\t%s, %d(%s)" y i z

      ALdDF y (V z) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd y z
          write $ printf "\tl.sr\t%s, 0(%s)" x regAd
      ALdDF y (C i) -> do
          write $ printf "\tl.sr\t%s, %d(%s)" x i y
      AStDF y z (V w) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd z w
          write $ printf "\ts.s\t%s, 0(%s)" y regAd
      AStDF y z (C i) -> do
          write $ printf "\ts.s\t%s, %d(%s)" y i z

      AComment s -> write $ printf "\t# %s" s

      ASave y z
        | y `elem` allRegs -> do
            sset <- use stackSet
            when (S.notMember z sset) $ do
              save z
              offset_z <- offset z
              write $ printf "\tsw\t%s, %d(%s)" y offset_z regSp
        | y `elem` allFRegs -> do
            sset <- use stackSet
            when (S.notMember z sset) $ do
              savef z
              offset_z <- offset z
              write $ printf "\ts.s\t%s, %d(%s)" y offset_z regSp
        | otherwise -> do
            sset <- use stackSet
            assert (S.member z sset) (return ())

      ARestore y
        | x `elem` allRegs -> do
            offset_y <- offset y
            write $ printf "\tlwr\t%s, %d(%s)" x offset_y regSp
        | x `elem` allFRegs -> do
            offset_y <- offset y
            write $ printf "\tl.sr\t%s, %d(%s)" x offset_y regSp
        | otherwise -> assert False undefined

      AIfEq y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, ppIdOrImm z')) "beq" "bne"
      AIfLe y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, ppIdOrImm z')) "ble" "bgt"
      AIfGe y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, ppIdOrImm z')) "bge" "blt"

      AIfFEq y z e1 e2 -> do
          --write $ printf "\tc.eq.s\t%s, %s" y z
          --g'_non_tail_if oc (NonTail x) e1 e2 Nothing "bc1t" "bc1f"
          --詳細は Tailのほうを
          g'_non_tail_if oc (NonTail x) e2 e1 (Just (y,z)) "c.ne.s" "c.eq.s"
      AIfFLe y z e1 e2 -> do
          --write $ printf "\tc.le.s\t%s, %s" y z
          --g'_non_tail_if oc (NonTail x) e1 e2 Nothing "bc1t" "bc1f"
          g'_non_tail_if oc (NonTail x) e2 e1 (Just (y,z)) "c.gt.s" "c.le.s"

      ACallCls y zs ws -> do
          g'_args oc [(y, regCl)] zs ws
          ss <- stackSize

          write $ printf "\tsw\t%s, %d(%s)" regRa (ss-4) regSp

          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp ss
          write $ printf "\tlwr\t%s, 0(%s)" regSw regCl
          write $ printf "\tjalr\t%s" regSw
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp (-ss)

          write $ printf "\tlwr\t%s, %d(%s)" regRa (ss-4) regSp

          if | (x `elem` allRegs && x /= regs!0) ->
                    write $ printf "\taddi\t%s, %s, 0" x (regs!0)
             | (x `elem` allFRegs && x /= fregs!0) ->
                    write $ printf "\tmov.s\t%s, %s" x (fregs!0)
             | otherwise -> assert (x==regs!0 || x==fregs!0 || x=="%unit") $ return ()

      ACallDir (Label y) zs ws -> do
          g'_args oc [] zs ws
          ss <- stackSize

          write $ printf "\tsw\t%s, %d(%s)" regRa (ss-4) regSp

          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp ss
          write $ printf "\tjal\t%s" y
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp (-ss)

          write $ printf "\tlwr\t%s, %d(%s)" regRa (ss-4) regSp

          if | (x `elem` allRegs && x /= regs!0) ->
                    write $ printf "\taddi\t%s, %s, 0" x (regs!0)
             | (x `elem` allFRegs && x /= fregs!0) ->
                    write $ printf "\tmov.s\t%s, %s" x (fregs!0)
             | otherwise -> assert (x==regs!0 || x==fregs!0 || x=="%unit") $ return ()

    -- 末尾だったら計算結果を第一レジスタにセットしてret
    Tail -> let ret = write $ printf "\tjr\t%s" regRa in case exp of
      ANop -> do
          tmp <- lift $ genTmp TUnit
          g' oc (NonTail tmp, exp)
          ret
      ASt{} -> do
          tmp <- lift $ genTmp TUnit
          g' oc (NonTail tmp, exp)
          ret
      AStDF{} -> do
          tmp <- lift $ genTmp TUnit
          g' oc (NonTail tmp, exp)
          ret
      AComment{} -> do
          tmp <- lift $ genTmp TUnit
          g' oc (NonTail tmp, exp)
          ret
      ASave {} -> do
          tmp <- lift $ genTmp TUnit
          g' oc (NonTail tmp, exp)
          ret

      ASet{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ASetL{} -> g' oc (NonTail (regs!0), exp) >> ret
      AMov{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ANeg{}  -> g' oc (NonTail (regs!0), exp) >> ret
      AAdd{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ASub{}  -> g' oc (NonTail (regs!0), exp) >> ret
      AMul{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ADiv{}  -> error "Emit.hs: impossible"
      ASll{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ALd{}   -> g' oc (NonTail (regs!0), exp) >> ret

      ASetF{}  -> g' oc (NonTail(fregs!0), exp) >> ret
      AFMovD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      AFNegD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      AFAddD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      AFSubD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      AFMulD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      AFDivD{} -> g' oc (NonTail(fregs!0), exp) >> ret
      ALdDF{}  -> g' oc (NonTail(fregs!0), exp) >> ret

      ARestore x -> do
          lx <- locate x
          case lx of
            [_i]  -> g' oc (NonTail(regs!0), exp)
            [i,j] -> assert (i+1==j) $ g' oc (NonTail(fregs!0), exp)
            _ -> assert False undefined
          ret

      AIfEq x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, ppIdOrImm y')) "beq" "bne"
      AIfLe x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, ppIdOrImm y')) "ble" "bgt"
      AIfGe x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, ppIdOrImm y')) "bge" "blt"

      AIfFEq x y e1 e2 -> do
          --g'_tail_if oc e1 e2 (Just (x,y)) "c.eq.s" "c.ne.s"
          --としたいがc.ne.sが使われてしまうので
          g'_tail_if oc e2 e1 (Just (x,y)) "c.ne.s" "c.eq.s"
          --            ^^^^^

      AIfFLe x y e1 e2 -> do
          --これも同じでg'_tail_if oc e1 e2 (Just (x,y)) "c.le.s" "c.gt.s" の代わりに
          g'_tail_if oc e2 e1 (Just (x,y)) "c.gt.s" "c.le.s"

      ACallCls x ys zs -> do
          g'_args oc [(x, regCl)] ys zs
          write $ printf "\tlwr\t%s, 0(%s)" regSw regCl
          write $ printf "\tjr\t%s" regSw
      ACallDir (Label x) ys zs -> do
          g'_args oc [] ys zs
          write $ printf "\tj\t%s" x

g'_tail_if :: Handle -> Asm -> Asm -> Maybe (Id, Id) -> String -> String -> CamlE ()
g'_tail_if oc e1 e2 msrcs b bn = do
  let write s = liftIO $ hPutStrLn oc s
  b_else <- lift $ genId (b ++ "_else")
  case msrcs of
    Just (s1,s2) -> write $ printf "\t%s\t%s, %s, %s" bn s1 s2 b_else
    Nothing      -> write $ printf "\t%s\t%s" bn b_else
  ssetBak <- use stackSet
  g oc (Tail, e1)
  write $ printf "%s:" b_else
  stackSet .= ssetBak
  g oc (Tail, e2)

g'_non_tail_if :: Handle -> Dest -> Asm -> Asm -> Maybe (Id, Id) -> String -> String -> CamlE ()
g'_non_tail_if oc dest e1 e2 msrcs b bn = do
  let write s = liftIO $ hPutStrLn oc s
  b_else <- lift $ genId (b ++ "_else")
  b_cont <- lift $ genId (b ++ "_cont")
  case msrcs of
    Just (s1,s2) -> write $ printf "\t%s\t%s, %s, %s" bn s1 s2 b_else
    Nothing      -> write $ printf "\t%s\t%s" bn b_else
  ssetBak <- use stackSet
  g oc (dest, e1)
  sset1 <- use stackSet
  write $ printf "\tj\t%s" b_cont --bからjに変更
  write $ printf "%s:" b_else
  stackSet .= ssetBak
  g oc (dest, e2)
  write $ printf "%s:" b_cont
  sset2 <- use stackSet
  stackSet .= S.intersection sset1 sset2

g'_args :: Handle -> [(Id,Id)] -> [Id] -> [Id] -> CamlE ()
g'_args oc xRegCl ys zs = do
  let write s = liftIO $ hPutStrLn oc s
      (_i,yrs) = foldl' f (0,xRegCl) ys
          where f (i,yrs') y = (i+1, (y,regs!i) : yrs')
      (_d,zfrs) = foldl' f (0,[]) zs
          where f (d,zfrs') z = (d+1, (z,fregs!d) : zfrs')
  forM_ (shuffle regSw  yrs)  $ \(y,r)  -> write $ printf "\taddi\t%s, %s, 0" r y
  forM_ (shuffle regFSw zfrs) $ \(z,fr) -> write $ printf "\tmov.s\t%s, %s" fr z

h :: Handle -> AFunDef -> CamlE ()
h handle (AFunDef (Label x) _ _ e _) = do
  let write s = liftIO $ hPutStrLn handle s
  write $ printf "%s:" x
  stackSet .= S.empty
  stackMap .= []
  g handle (Tail, e)

emit :: Handle -> AProg -> Caml ()
emit handle prog = evalStateT (emit' handle prog) (EmitState S.empty [])

emit' :: Handle -> AProg -> CamlE ()
emit' handle (AProg fdata fundefs e) = do
  let write s = liftIO $ hPutStrLn handle s
  lift $ log "generating assembly..."

  --floats
  write $ printf ".data"
  write $ printf "const_f_zero:"
  write $ printf "\t.word\t0x00000000"
  write $ printf "const_f_zero_neg:"
  write $ printf "\t.word\t0x80000000"
  write $ printf "const_f_one:"
  write $ printf "\t.word\t0x3f800000"
  write $ printf "const_f_two:"
  write $ printf "\t.word\t0x40000000"
  write $ printf "const_f_half:"
  write $ printf "\t.word\t0x3f000000"
  write $ printf "const_pi:"
  write $ printf "\t.word\t0x40490fdb"
  write $ printf "const_half_pi:"
  write $ printf "\t.word\t0x3fc90fdb"
  forM_ fdata $ \(Label x,d) -> do
      write $ printf "%s:\t# %.6f" x d
      write $ printf "\t.word\t0x%08lx" (decodeFloatLE d)

  -- main routine
  write $ printf ".text"
  write $ printf ".globl\tmain"
  write $ printf "main:"

  --main header
  write $ printf "\tsw\t$ra, 4($sp)"
  write $ printf "\tsw\t$fp, 8($sp)"
  write $ printf "\taddi\t$sp, $sp, 24"
  write $ printf "\taddi\t$fp, $sp, 0"

  stackSet .= S.empty
  stackMap .= []
  g handle (NonTail(regs!0), e)

  -- main footer
  write $ printf "\tmove\t$sp, $fp"
  write $ printf "\tsubi\t$sp, $sp, 24"
  write $ printf "\tlwr\t$ra, 4($sp)"
  write $ printf "\tlwr\t$fp, 8($sp)"
  write $ printf "\tli\t%s, 0" (regs!0)

  --write $ printf "\tli\t$v0, 10"
  --write $ printf "\tsyscall"
  write $ printf "\texit"

  -- funcions
  forM_ fundefs $ h handle

  -- utility
  write =<< liftIO (readFile "libmincaml.s")

----------
-- Util --
----------

memAssoc :: Eq a => a -> [(a,b)] -> Bool
memAssoc _x [] = False
memAssoc  x ((y,_):zs)
  | x==y      = True
  | otherwise = memAssoc x zs

