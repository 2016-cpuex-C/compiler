{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Emit where

import Prelude hiding (exp)
import Id
import Asm
import AllTypes

import Data.Word (Word32)
import qualified Data.Set as S
import Data.Vector ((!))
import Control.Lens
import Data.List (foldl')
import Control.Exception.Base (assert)
import Control.Monad (when, forM_)
import Data.List (partition)
import System.IO (Handle, hPutStrLn)
import Text.Printf

-- ghc-modが動かなくなるので書いている間はコメントアウト
foreign import ccall "gethi" gethi :: Double -> Word32
foreign import ccall "getlo" getlo :: Double -> Word32
{-gethi, getlo :: Double -> Word32-}
{-gethi = undefined-}
{-getlo = undefined-}

save :: Id -> Caml ()
save x = do
  stackSet %= S.insert x
  stackMap %= \l -> if x `elem` l then l else l++[x]

savef :: Id -> Caml ()
savef x = do
  stackSet %= S.insert x
  smap <- use stackMap
  when (x `notElem` smap) $ do
    pad <- if | even (length smap) -> return []
              | otherwise          -> (:[]) <$> genTmp TInt
    stackMap .= smap ++ pad ++ [x,x]

locate :: Id -> Caml [Int]
locate x = uses stackMap loc
  where loc [] = []
        loc (y:zs) | x == y    = 0 : map succ (loc zs)
                   | otherwise = map succ (loc zs)
offset :: Id -> Caml Int
offset x = (4*).head <$> locate x

stackSize :: Caml Int
stackSize = uses stackMap (align . (4*) . length)

ppIdOrImm :: IdOrImm -> String
ppIdOrImm (V x) = x
ppIdOrImm (C i) = show i

shuffle :: Id -> [(Id,Id)] -> [(Id,Id)]
shuffle sw xys =
  let (_,xys'') = partition (\(x,y) -> x==y) xys
                --等しくない奴
      tmp  = partition (\(_,y) -> memAssoc y xys) xys''
                --等しくない奴でyが定義域にないやつとあるやつ
  in case tmp of
    ([],[]) -> []
    ((x,y):xys',[]) ->
        let f (y',z) | y == y'   = (sw,z)
                     | otherwise = (y',z)
        in (y,sw) : (x,y) : shuffle sw (map f xys')
    (xys',acyc) -> acyc ++ shuffle sw xys'

data Dest = Tail | NonTail Id

g :: Handle -> (Dest,Asm) -> Caml ()
g oc = \case
  (dest, AsmAns exp) -> g' oc (dest,exp)
  (dest, AsmLet (x,_t) exp e) -> g' oc (NonTail x, exp) >> g oc (dest, e)

g' :: Handle -> (Dest,AExpr) -> Caml ()
g' oc (dest,exp) =
  let write s = liftIO $ hPutStrLn oc s
  in case dest of
    -- Nontailなら結果をdestにセットする.
    NonTail x -> case exp of
      ANop -> return ()
      ASet i          -> write $ printf "\tli\t%s, %d" x i
      ASetL (Label y) -> write $ printf "\tlw\t%s, %s" x y

      AMov y ->  when (x /= y) $ write $ printf "\taddi\t%s, %s, %d" x y (0::Int)
      ANeg y ->  write $ printf "\tneg\t%s, %s" x y

      AAdd y (V z) -> write $ printf "\tadd\t%s, %s, %s" x y z
      AAdd y (C i) -> write $ printf "\taddi\t%s, %s, %d" x y i
      ASub y (V z) -> write $ printf "\tsub\t%s, %s, %s" x y z
      ASub y (C i) -> error "subi not implemented"
                      --write $ printf "\tsubi\t%s, %s, %d" x y i
      AMul y (V z) -> write ( printf "\tmult\t%s, %s" y z ) >>
                      write ( printf "\tmflo\t %s" x )
      AMul {}      -> error "multi not implemented"
      ASll y i     -> write $ printf "\tsll\t%s, %s, %d" x y i

      AFMovD y   -> write $ printf "\tmov.d\t%s, %s" x y
      AFNegD y   -> write $ printf "\tneg.d\t%s, %s" x y
      AFAddD y z -> write $ printf "\tadd.d\t%s, %s, %s" x y z
      AFSubD y z -> write $ printf "\tsub.d\t%s, %s, %s" x y z
      AFMulD y z -> write $ printf "\tmul.d\t%s, %s, %s" x y z
      AFDivD y z -> write $ printf "\tdiv.d\t%s, %s, %s" x y z

      ALd y (V z) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd y z
          write $ printf "\tlw\t%s, 0(%s)" x regAd
      ALd y (C i) -> do
          write $ printf "\taddi\t%s, %s, %s" regAd y i
          write $ printf "\tlw\t%s, 0(%s)" x regAd
      ASt y z (V w) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd z w
          write $ printf "\tsw\t%s, (%s)" y regAd
      ASt y z (C i) -> do
          write $ printf "\taddi\t%s, %s, %s" regAd z i
          write $ printf "\tsw\t%s, (%s)" y regAd

      ALdDF y (V z) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd y z
          write $ printf "\tl.d\t%s, 0(%s)" x regAd
      ALdDF y (C i) -> do
          write $ printf "\taddi\t%s, %s, %s" regAd y i
          write $ printf "\tl.d\t%s, 0(%s)" x regAd
      AStDF y z (V w) -> do
          write $ printf "\tadd\t%s, %s, %s" regAd z w
          write $ printf "\ts.d\t%s, 0(%s)" y regAd
      AStDF y z (C i) -> do
          write $ printf "\taddi\t%s, %s, %s" regAd z i
          write $ printf "\ts.d\t%s, 0(%s)" y regAd

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
              write $ printf "\tsd\t%s, %d(%s)" y offset_z regSp
        | otherwise -> do
            sset <- use stackSet
            assert (S.member z sset) (return ())

      ARestore y
        | x `elem` allRegs -> do
            offset_y <- offset y
            write $ printf "\tlw\t%s, %d(%s)" x offset_y regSp
        | x `elem` allFRegs -> do
            offset_y <- offset y
            write $ printf "\tld\t%s, %d(%s)" x offset_y regSp
        | otherwise -> assert False undefined

      AIfEq y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, (ppIdOrImm z'))) "beq" "bne"
      AIfLe y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, (ppIdOrImm z'))) "ble" "bgt"
      AIfGe y z' e1 e2 ->
          g'_non_tail_if oc (NonTail x) e1 e2 (Just (y, (ppIdOrImm z'))) "bge" "blt"

      AIfFEq y z e1 e2 -> do
          write $ printf "\tc.eq.d\t%s, %s" y z
          g'_non_tail_if oc (NonTail x) e1 e2 Nothing "bclt" "bclf"
      AIfFLe y z e1 e2 -> do
          write $ printf "\tc.le.d\t%s, %s" y z
          g'_non_tail_if oc (NonTail x) e1 e2 Nothing "bclt" "bclf"

      ACallCls y zs ws -> do
          g'_args oc [(y, regCl)] zs ws
          ss <- stackSize
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp ss
          write $ printf "\tlw\t%s, (%s)" regSw regCl
          write $ printf "\tjal\t(%s)" regSw
          {-when (ss>0) $ write $ printf "\tsubi\t%s, %s, %d" regSp regSp ss-}
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp (-ss)
          if | (x `elem` allRegs && x /= regs!0) ->
                    write $ printf "\tlw\t%s, %s" x (regs!0)
             | (x `elem` allFRegs && x /= fregs!0) ->
                    write $ printf "\tld\t%s, %s" x (regs!0)
             | otherwise -> error "にゃーん"

      ACallDir (Label y) zs ws -> do
          g'_args oc [] zs ws
          ss <- stackSize
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp ss
          write $ printf "\tjal\t%s" y
          {-when (ss>0) $ write $ printf "\tsubi\t%s, %s, %d" regSp regSp ss -}
          when (ss>0) $ write $ printf "\taddi\t%s, %s, %d" regSp regSp (-ss)
          if | x `elem` allRegs && x /= regs!0 ->
                    write $ printf "\tlw\t%s, %s" x (regs!0)
             | x `elem` allFRegs && x /= fregs!0 ->
                    write $ printf "\tld\t%s, %s" x (regs!0)
             | otherwise -> return ()

    -- 末尾だったら計算結果を第一レジスタにセットしてret
    Tail -> let ret = write $ printf "\tjr\t%s" regRa in case exp of
      ANop -> do
          tmp <- genTmp TUnit
          g' oc ((NonTail tmp), exp)
          ret
      ASt{} -> do
          tmp <- genTmp TUnit
          g' oc ((NonTail tmp), exp)
          ret
      AStDF{} -> do
          tmp <- genTmp TUnit
          g' oc ((NonTail tmp), exp)
          ret
      AComment{} -> do
          tmp <- genTmp TUnit
          g' oc ((NonTail tmp), exp)
          ret
      ASave {} -> do
          tmp <- genTmp TUnit
          g' oc ((NonTail tmp), exp)
          ret

      ASet{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ASetL{} -> g' oc (NonTail (regs!0), exp) >> ret
      AMov{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ANeg{}  -> g' oc (NonTail (regs!0), exp) >> ret
      AAdd{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ASub{}  -> g' oc (NonTail (regs!0), exp) >> ret
      AMul{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ASll{}  -> g' oc (NonTail (regs!0), exp) >> ret
      ALd{}   -> g' oc (NonTail (regs!0), exp) >> ret

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

      AIfEq x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, (ppIdOrImm y'))) "beq" "bne"
      AIfLe x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, (ppIdOrImm y'))) "ble" "bgt"
      AIfGe x y' e1 e2 -> g'_tail_if oc e1 e2 (Just (x, (ppIdOrImm y'))) "bge" "blt"
      AIfFEq x y e1 e2 -> do
          write $ printf "\tc.eq.d\t%s, %s" x y
          g'_tail_if oc e1 e2 Nothing "bclt" "bclf"
      AIfFLe x y e1 e2 -> do
          write $ printf "\tc.le.d\t%s, %s" x y
          g'_tail_if oc e1 e2 Nothing "bclt" "bclf"

      ACallCls x ys zs -> do
          g'_args oc [(x, regCl)] ys zs
          write $ printf "\tlw\t%s, (%s)" regSw regCl
          write $ printf "\tb\t(%s)" regSw
      ACallDir (Label x) ys zs -> do
          g'_args oc [] ys zs
          write $ printf "\tb\t%s" x

g'_tail_if :: Handle -> Asm -> Asm -> Maybe (Id, Id) -> String -> String -> Caml ()
g'_tail_if oc e1 e2 msrcs b bn = do
  let write s = liftIO $ hPutStrLn oc s
  b_else <- genId (b ++ "_else")
  case msrcs of
    Just (s1,s2) -> write $ printf "\t%s\t%s, %s, %s" bn s1 s2 b_else
    Nothing      -> write $ printf "\t%s\t%s" bn b_else
  ssetBak <- use stackSet
  g oc (Tail, e1)
  write $ printf "%s:" b_else
  stackSet .= ssetBak
  g oc (Tail, e2)

g'_non_tail_if :: Handle -> Dest -> Asm -> Asm -> Maybe (Id, Id) -> String -> String -> Caml ()
g'_non_tail_if oc dest e1 e2 msrcs b bn = do
  let write s = liftIO $ hPutStrLn oc s
  b_else <- genId (b ++ "_else")
  b_cont <- genId (b ++ "_cont")
  case msrcs of
    Just (s1,s2) -> write $ printf "\t%s\t%s, %s, %s" bn s1 s2 b_else
    Nothing      -> write $ printf "\t%s\t%s" bn b_else
  ssetBak <- use stackSet
  g oc (dest, e1)
  sset1 <- use stackSet
  write $ printf "\tb\t%s" b_cont
  write $ printf "%s:" b_else
  stackSet .= ssetBak
  g oc (dest, e2)
  write $ printf "%s:" b_cont
  sset2 <- use stackSet
  stackSet .= S.intersection sset1 sset2

g'_args :: Handle -> [(Id,Id)] -> [Id] -> [Id] -> Caml ()
g'_args oc xRegCl ys zs =
  assert (length ys <= length regs - length xRegCl) $
  assert (length zs <= length fregs) $ do
  ss <- stackSize
  let write s = liftIO $ hPutStrLn oc s
      sw = printf "%d(%s)" ss regSp :: String
      (_i,yrs) = foldl' f (0,xRegCl) ys
          where f (i,yrs') y = (i+1, (y,regs!i) : yrs')
      (_d,zfrs) = foldl' f (0,[]) zs
          where f (d,zfrs') z = (d+1, (z,fregs!d) : zfrs')
  forM_ (shuffle sw yrs)  $ \(y,r)  -> write $ printf "\taddi\t%s, %s, %d" r y (0::Int)
  forM_ (shuffle sw zfrs) $ \(z,fr) -> write $ printf "\tmov.d\t%s, %s" fr z

h :: Handle -> AFunDef -> Caml ()
h handle (AFunDef (Label x) _ _ e _) = do
  let write s = liftIO $ hPutStrLn handle s
  write $ printf "%s:" x
  stackSet .= S.empty
  stackMap .= []
  g handle (Tail, e)

emit :: Handle -> AProg -> Caml ()
emit handle (AProg fdata fundefs e) = do
  let write s = liftIO $ hPutStrLn handle s
  liftIO $ putStrLn "generating assembly..."

  write $ printf ".data"
  forM_ fdata $ \(Label x,d) -> do
      write $ printf "%s:\t# %.6f" x d
      write $ printf "\t.word\t0x%lx" (gethi d)
      write $ printf "\t.word\t0x%lx" (getlo d)

  write $ printf ".text"
  forM_ fundefs $ \fundef -> h handle fundef
  write $ printf ".globl\tmain"
  write $ printf "main:"

  --write $ printf "\tpushl\t%%eax"
  --write $ printf "\tpushl\t%%ebx"
  --write $ printf "\tpushl\t%%ecx"
  --write $ printf "\tpushl\t%%edx"
  --write $ printf "\tpushl\t%%esi"
  --write $ printf "\tpushl\t%%edi"
  --write $ printf "\tpushl\t%%ebp"
  --write $ printf "\tmovl\t32(%%esp),%s" regSp
  --write $ printf "\tmovl\t36(%%esp),%s" (regs!0)
  --write $ printf "\tmovl\t%s,%s" (regs!0) regHp

  stackSet .= S.empty
  stackMap .= []
  g handle (NonTail(regs!0), e)
  write $ printf "\tsub\t%s, %s, %s" (regs!0) (regs!0) (regs!0)
  write $ printf "\texit"

  --write $ printf "\tpopl\t%%ebp"
  --write $ printf "\tpopl\t%%edi"
  --write $ printf "\tpopl\t%%esi"
  --write $ printf "\tpopl\t%%edx"
  --write $ printf "\tpopl\t%%ecx"
  --write $ printf "\tpopl\t%%ebx"
  --write $ printf "\tpopl\t%%eax"


----------
-- Util --
----------

memAssoc :: Eq a => a -> [(a,b)] -> Bool
memAssoc _x [] = False
memAssoc  x ((y,_):zs)
  | x==y      = True
  | otherwise = memAssoc x zs

