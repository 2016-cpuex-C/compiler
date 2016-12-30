{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE TupleSections #-}

module BackEnd.Second.Analysis.Stack where
-- 入力: SSA deconstruction後の関数
-- 出力: 各基本ブロックの先頭に置けるstack

-- in[n]  = ∩ (m \in pred[n]) out[m] ただしpred[n]が空のときは空
-- out[n] = in[n] ∪  {saved at n}
-- この不動点を取る

import Prelude hiding (log,Ordering(..))

import Base
import BackEnd.Second.Asm
import BackEnd.Second.Analysis.Base

import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import           Data.Set (Set)
import qualified Data.Set as S
import           Data.Maybe (mapMaybe)

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------

assignToStack :: AFunDef -> Map Id Integer
assignToStack = undefined

-------------------------------------------------------------------------------
-- StackSet
-------------------------------------------------------------------------------

type StackSet = Set Id

stackSets :: AFunDef -> Map Label StackSet
stackSets fun = fst <$> leastFixedPoint M.empty go
  where
    go :: Map Label (StackSet, StackSet) -> Map Label (StackSet, StackSet)
    go out' = foldl f mempty (aBody fun)
      where
        f acc b =
          let l = aBlockName b
              in_b  = intersections' [ snd $ lookupWith0 lp out'
                                     | lp <- lookupWith0 l (predBlockMap fun) ]
              out_b = in_b `S.union` S.fromList (savedAt b)
          in M.insert l (in_b,out_b) acc

    lookupWith0 :: Monoid a => Label -> Map Label a -> a
    lookupWith0 = M.findWithDefault mempty

    intersections' :: Ord a => [Set a] -> Set a
    intersections' [] = S.empty
    intersections' ss = foldl1 S.intersection ss

savedAt :: ABlock -> [Id]
savedAt b = mapMaybe h $ aStatements b
  where h (_,Do (ASave x))  = Just x
        h (_,Do (AFSave x)) = Just x
        h _                 = Nothing

-------------------------------------------------------------------------------
-- Util
-------------------------------------------------------------------------------

-- 最小元を与える型クラスってないですかね
leastFixedPoint :: Eq a => a -> (a -> a) -> a
leastFixedPoint min' f = go min'
  where go x = let x' = f x in if x==x' then x else go x'

-------------------------------------------------------------------------------
-- Test
-------------------------------------------------------------------------------

trace_or_matrix :: AFunDef
trace_or_matrix = -- {{{
  AFunDef {aFunName = Label "trace_or_matrix.4421", aArgs = ["ofs.4422","or_network.4423","dirvec.4424"], aFArgs = [], aBody = [
    ABlock {aBlockName = Label "cont.11745.13974", aStatements = [
      (2057,"Ti1185.4440" := AAdd "ofs.4422.tr" (C 1))
    , (9659,Do ANop)
    , (2058,Do (ABr (Label "tailrecurse.13974")))]},
    ABlock {aBlockName = Label "cont.11782.13974", aStatements = [
      (2088,"cond.11813" := ACmp EQ "t.4433" (C 0))
    , (2089,Do (ACBr "cond.11813" (Label "cont.11745.13974") (Label "else.11811.13974")))]},
    ABlock {aBlockName = Label "else.11744.13974", aStatements = [
      (2041,"addr_.11773" := AAdd "range_primitive.4426" (C 10001))
    , (2042,"m.3672.7131" := ALd "addr_.11773" (C 0))
    , (2043,"Td1710.3674.7133" := AFLdi 10148)
    , (2044,"m_xyz.2807.9250" := ALd "m.3672.7131" (C 5))
    , (2045,"Td1711.3676.7134" := AFLd "m_xyz.2807.9250" (C 0))
    , (2046,"b0.3673.7135" := AFSub "Td1710.3674.7133" "Td1711.3676.7134")
    , (2047,"Td1713.3678.7137" := AFLdi 10149)
    , (2048,"addr_.11777" := AAdd "m_xyz.2807.9250" (C 1))
    , (2049,"Td1714.3680.7138" := AFLd "addr_.11777" (C 0))
    , (2050,"b1.3677.7139" := AFSub "Td1713.3678.7137" "Td1714.3680.7138")
    , (2051,"Td1716.3682.7141" := AFLdi 10150)
    , (2052,"addr_.11779" := AAdd "m_xyz.2807.9250" (C 2))
    , (2053,"Td1717.3684.7142" := AFLd "addr_.11779" (C 0))
    , (2054,"b2.3681.7143" := AFSub "Td1716.3682.7141" "Td1717.3684.7142")
    , (2055,"m_shape.2696.9282" := ALd "m.3672.7131" (C 1))
    , (2056,Do (ASwitch "m_shape.2696.9282" (Label "else.11805.13974") [
      (1,Label "then.11780.13974")
    , (2,Label "then.11804.13974")]))]},
    ABlock {aBlockName = Label "else.11751.13974", aStatements = [
      (2059,"addr_.11756" := AAdd "head.4413.7123" (C 10072))
    , (2060,"and_group.4416.7126" := ALd "addr_.11756" (C 0))
    , (2061,"tmpInt.13975" := ASet 0)
    , (5976,Do (ASave "dirvec.4424"))
    , (5977,Do (ASave "head.4425"))
    , (5978,Do (ASave "ofs.4422.tr"))
    , (5979,Do (ASave "or_network.4423"))
    , (2062,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13975","and_group.4416.7126","dirvec.4424"] []))
    , (5980,Do (ARestore "dirvec.4424"))
    , (5981,Do (ARestore "head.4425"))
    , (5982,Do (ARestore "ofs.4422.tr"))
    , (5983,Do (ARestore "or_network.4423"))
    , (2063,"addr_.11757" := AAdd "head.4425" (C 2))
    , (2064,"head.4413.9231" := ALd "addr_.11757" (C 0))
    , (2065,"cond.11761" := ACmp EQ "head.4413.9231" (C (-1)))
    , (2066,Do (ACBr "cond.11761" (Label "cont.11745.13974") (Label "else.11759.13974")))]},
    ABlock {aBlockName = Label "else.11759.13974", aStatements = [
      (2067,"addr_.11764" := AAdd "head.4413.9231" (C 10072))
    , (2068,"and_group.4416.9233" := ALd "addr_.11764" (C 0))
    , (2069,"tmpInt.13976" := ASet 0)
    , (5984,Do (ASave "dirvec.4424"))
    , (5985,Do (ASave "head.4425"))
    , (5986,Do (ASave "ofs.4422.tr"))
    , (5987,Do (ASave "or_network.4423"))
    , (2070,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13976","and_group.4416.9233","dirvec.4424"] []))
    , (5988,Do (ARestore "dirvec.4424"))
    , (5989,Do (ARestore "head.4425"))
    , (5990,Do (ARestore "ofs.4422.tr"))
    , (5991,Do (ARestore "or_network.4423"))
    , (2071,"addr_.11765" := AAdd "head.4425" (C 3))
    , (2072,"head.4413.7115.9238" := ALd "addr_.11765" (C 0))
    , (2073,"cond.11769" := ACmp EQ "head.4413.7115.9238" (C (-1)))
    , (2074,Do (ACBr "cond.11769" (Label "cont.11745.13974") (Label "else.11767.13974")))]},
    ABlock {aBlockName = Label "else.11767.13974", aStatements = [
      (2075,"addr_.11772" := AAdd "head.4413.7115.9238" (C 10072))
    , (2076,"and_group.4416.7118.9240" := ALd "addr_.11772" (C 0))
    , (2077,"tmpInt.13977" := ASet 0)
    , (5992,Do (ASave "dirvec.4424"))
    , (5993,Do (ASave "head.4425"))
    , (5994,Do (ASave "ofs.4422.tr"))
    , (5995,Do (ASave "or_network.4423"))
    , (2078,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13977","and_group.4416.7118.9240","dirvec.4424"] []))
    , (5996,Do (ARestore "dirvec.4424"))
    , (5997,Do (ARestore "head.4425"))
    , (5998,Do (ARestore "ofs.4422.tr"))
    , (5999,Do (ARestore "or_network.4423"))
    , (2079,"tmpInt.13978" := ASet 4)
    , (6000,Do (ASave "dirvec.4424"))
    , (6001,Do (ASave "ofs.4422.tr"))
    , (6002,Do (ASave "or_network.4423"))
    , (2080,Do (ACall TUnit (Label "solve_one_or_network.4409") ["tmpInt.13978","head.4425","dirvec.4424"] []))
    , (6003,Do (ARestore "dirvec.4424"))
    , (6004,Do (ARestore "ofs.4422.tr"))
    , (6005,Do (ARestore "or_network.4423"))
    , (2081,Do (ABr (Label "cont.11745.13974")))]},
    ABlock {aBlockName = Label "else.11805.13974", aStatements = [
      (6054,Do (ASave "dirvec.4424"))
    , (6055,Do (ASave "head.4425"))
    , (6056,Do (ASave "ofs.4422.tr"))
    , (6057,Do (ASave "or_network.4423"))
    , (2102,"t.4433_else.11785_else.11809" := ACall TInt (Label "solver_second.3630") ["m.3672.7131","dirvec.4424"] ["b0.3673.7135","b1.3677.7139","b2.3681.7143"])
    , (6058,Do (ARestore "dirvec.4424"))
    , (6059,Do (ARestore "head.4425"))
    , (6060,Do (ARestore "ofs.4422.tr"))
    , (6061,Do (ARestore "or_network.4423"))
    , (9661,Do ANop)
    , (2103,Do (ABr (Label "cont.11782.13974")))]},
    ABlock {aBlockName = Label "else.11811.13974", aStatements = [
      (2104,"tp.4435" := AFLdi 10124)
    , (2105,"Td1182.4437" := AFLdi 10126)
    , (2106,"cond.11821" := AFCmp GT "Td1182.4437" "tp.4435")
    , (2107,Do (ACBr "cond.11821" (Label "else.11819.13974") (Label "cont.11745.13974")))]},
    ABlock {aBlockName = Label "else.11819.13974", aStatements = [
      (2108,"addr_.11824" := AAdd "head.4425" (C 1))
    , (2109,"head.4413.7147" := ALd "addr_.11824" (C 0))
    , (2110,"cond.11828" := ACmp EQ "head.4413.7147" (C (-1)))
    , (2111,Do (ACBr "cond.11828" (Label "cont.11745.13974") (Label "else.11826.13974")))]},
    ABlock {aBlockName = Label "else.11826.13974", aStatements = [
      (2112,"addr_.11831" := AAdd "head.4413.7147" (C 10072))
    , (2113,"and_group.4416.7150" := ALd "addr_.11831" (C 0))
    , (2114,"tmpInt.13988" := ASet 0)
    , (6062,Do (ASave "dirvec.4424"))
    , (6063,Do (ASave "head.4425"))
    , (6064,Do (ASave "ofs.4422.tr"))
    , (6065,Do (ASave "or_network.4423"))
    , (2115,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13988","and_group.4416.7150","dirvec.4424"] []))
    , (6066,Do (ARestore "dirvec.4424"))
    , (6067,Do (ARestore "head.4425"))
    , (6068,Do (ARestore "ofs.4422.tr"))
    , (6069,Do (ARestore "or_network.4423"))
    , (2116,"addr_.11832" := AAdd "head.4425" (C 2))
    , (2117,"head.4413.9307" := ALd "addr_.11832" (C 0))
    , (2118,"cond.11836" := ACmp EQ "head.4413.9307" (C (-1)))
    , (2119,Do (ACBr "cond.11836" (Label "cont.11745.13974") (Label "else.11834.13974")))]},
    ABlock {aBlockName = Label "else.11834.13974", aStatements = [
      (2120,"addr_.11839" := AAdd "head.4413.9307" (C 10072))
    , (2121,"and_group.4416.9309" := ALd "addr_.11839" (C 0))
    , (2122,"tmpInt.13989" := ASet 0)
    , (6070,Do (ASave "dirvec.4424"))
    , (6071,Do (ASave "head.4425"))
    , (6072,Do (ASave "ofs.4422.tr"))
    , (6073,Do (ASave "or_network.4423"))
    , (2123,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13989","and_group.4416.9309","dirvec.4424"] []))
    , (6074,Do (ARestore "dirvec.4424"))
    , (6075,Do (ARestore "head.4425"))
    , (6076,Do (ARestore "ofs.4422.tr"))
    , (6077,Do (ARestore "or_network.4423"))
    , (2124,"addr_.11840" := AAdd "head.4425" (C 3))
    , (2125,"head.4413.7115.9314" := ALd "addr_.11840" (C 0))
    , (2126,"cond.11844" := ACmp EQ "head.4413.7115.9314" (C (-1)))
    , (2127,Do (ACBr "cond.11844" (Label "cont.11745.13974") (Label "else.11842.13974")))]},
    ABlock {aBlockName = Label "else.11842.13974", aStatements = [
      (2128,"addr_.11847" := AAdd "head.4413.7115.9314" (C 10072))
    , (2129,"and_group.4416.7118.9316" := ALd "addr_.11847" (C 0))
    , (2130,"tmpInt.13990" := ASet 0)
    , (6078,Do (ASave "dirvec.4424"))
    , (6079,Do (ASave "head.4425"))
    , (6080,Do (ASave "ofs.4422.tr"))
    , (6081,Do (ASave "or_network.4423"))
    , (2131,Do (ACall TUnit (Label "solve_each_element.4358") ["tmpInt.13990","and_group.4416.7118.9316","dirvec.4424"] []))
    , (6082,Do (ARestore "dirvec.4424"))
    , (6083,Do (ARestore "head.4425"))
    , (6084,Do (ARestore "ofs.4422.tr"))
    , (6085,Do (ARestore "or_network.4423"))
    , (2132,"tmpInt.13991" := ASet 4)
    , (6086,Do (ASave "dirvec.4424"))
    , (6087,Do (ASave "ofs.4422.tr"))
    , (6088,Do (ASave "or_network.4423"))
    , (2133,Do (ACall TUnit (Label "solve_one_or_network.4409") ["tmpInt.13991","head.4425","dirvec.4424"] []))
    , (6089,Do (ARestore "dirvec.4424"))
    , (6090,Do (ARestore "ofs.4422.tr"))
    , (6091,Do (ARestore "or_network.4423"))
    , (2134,Do (ABr (Label "cont.11745.13974")))]},
    ABlock {aBlockName = Label "entry.11737.13974", aStatements = [
      (9660,Do ANop)
    , (2030,Do (ABr (Label "tailrecurse.13974")))]},
    ABlock {aBlockName = Label "tailrecurse.13974", aStatements = [
      (2032,"addr_.11738" := AAdd "or_network.4423" (V "ofs.4422.tr"))
    , (2033,"head.4425" := ALd "addr_.11738" (C 0))
    , (2034,"range_primitive.4426" := ALd "head.4425" (C 0))
    , (2035,Do (ASwitch "range_primitive.4426" (Label "else.11744.13974") [(-1,Label "then.11741.13974")
    , (99,Label "then.11743.13974")]))]},
    ABlock {aBlockName = Label "then.11741.13974", aStatements = [
      (2036,Do (ARet TUnit Nothing))]},
    ABlock {aBlockName = Label "then.11743.13974", aStatements = [
      (2037,"addr_.11749" := AAdd "head.4425" (C 1))
    , (2038,"head.4413.7123" := ALd "addr_.11749" (C 0))
    , (2039,"cond.11753" := ACmp EQ "head.4413.7123" (C (-1)))
    , (2040,Do (ACBr "cond.11753" (Label "cont.11745.13974") (Label "else.11751.13974")))]},
    ABlock {aBlockName = Label "then.11780.13974", aStatements = [
      (2082,"tmpInt.13979" := ASet 0)
    , (2083,"tmpInt.13980" := ASet 1)
    , (2084,"tmpInt.13981" := ASet 2)
    , (6006,Do (ASave "dirvec.4424"))
    , (6007,Do (ASave "head.4425"))
    , (6008,Do (ASave "m.3672.7131"))
    , (6009,Do (ASave "ofs.4422.tr"))
    , (6010,Do (ASave "or_network.4423"))
    , (6011,Do (AFSave "b0.3673.7135"))
    , (6012,Do (AFSave "b1.3677.7139"))
    , (6013,Do (AFSave "b2.3681.7143"))
    , (2085,"Tb1805.3533.9295" := ACall TBool (Label "solver_rect_surface.3493") ["m.3672.7131","dirvec.4424","tmpInt.13979","tmpInt.13980","tmpInt.13981"] ["b0.3673.7135","b1.3677.7139","b2.3681.7143"])
    , (6014,Do (ARestore "dirvec.4424"))
    , (6015,Do (ARestore "head.4425"))
    , (6016,Do (ARestore "m.3672.7131"))
    , (6017,Do (ARestore "ofs.4422.tr"))
    , (6018,Do (ARestore "or_network.4423"))
    , (6019,Do (AFRestore "b0.3673.7135"))
    , (6020,Do (AFRestore "b1.3677.7139"))
    , (6021,Do (AFRestore "b2.3681.7143"))
    , (2086,Do (ACBr "Tb1805.3533.9295" (Label "else.11811.13974") (Label "then.11786.13974")))]},
    ABlock {aBlockName = Label "then.11786.13974", aStatements = [
      (2090,"tmpInt.13982" := ASet 1)
    , (2091,"tmpInt.13983" := ASet 2)
    , (2092,"tmpInt.13984" := ASet 0)
    , (6022,Do (ASave "dirvec.4424"))
    , (6023,Do (ASave "head.4425"))
    , (6024,Do (ASave "m.3672.7131"))
    , (6025,Do (ASave "ofs.4422.tr"))
    , (6026,Do (ASave "or_network.4423"))
    , (6027,Do (AFSave "b0.3673.7135"))
    , (6028,Do (AFSave "b1.3677.7139"))
    , (6029,Do (AFSave "b2.3681.7143"))
    , (2093,"Tb1810.3538.9300" := ACall TBool (Label "solver_rect_surface.3493") ["m.3672.7131","dirvec.4424","tmpInt.13982","tmpInt.13983","tmpInt.13984"] ["b1.3677.7139","b2.3681.7143","b0.3673.7135"])
    , (6030,Do (ARestore "dirvec.4424"))
    , (6031,Do (ARestore "head.4425"))
    , (6032,Do (ARestore "m.3672.7131"))
    , (6033,Do (ARestore "ofs.4422.tr"))
    , (6034,Do (ARestore "or_network.4423"))
    , (6035,Do (AFRestore "b0.3673.7135"))
    , (6036,Do (AFRestore "b1.3677.7139"))
    , (6037,Do (AFRestore "b2.3681.7143"))
    , (2094,Do (ACBr "Tb1810.3538.9300" (Label "else.11811.13974") (Label "then.11792.13974")))]},
    ABlock {aBlockName = Label "then.11792.13974", aStatements = [
      (2095,"tmpInt.13985" := ASet 2)
    , (2096,"tmpInt.13986" := ASet 0)
    , (2097,"tmpInt.13987" := ASet 1)
    , (6038,Do (ASave "dirvec.4424"))
    , (6039,Do (ASave "head.4425"))
    , (6040,Do (ASave "ofs.4422.tr"))
    , (6041,Do (ASave "or_network.4423"))
    , (2098,"Tb1815.3543.9305" := ACall TBool (Label "solver_rect_surface.3493") ["m.3672.7131","dirvec.4424","tmpInt.13985","tmpInt.13986","tmpInt.13987"] ["b2.3681.7143","b0.3673.7135","b1.3677.7139"])
    , (6042,Do (ARestore "dirvec.4424"))
    , (6043,Do (ARestore "head.4425"))
    , (6044,Do (ARestore "ofs.4422.tr"))
    , (6045,Do (ARestore "or_network.4423"))
    , (2099,Do (ACBr "Tb1815.3543.9305" (Label "else.11811.13974") (Label "cont.11745.13974")))]},
    ABlock {aBlockName = Label "then.11804.13974", aStatements = [
      (6046,Do (ASave "dirvec.4424"))
    , (6047,Do (ASave "head.4425"))
    , (6048,Do (ASave "ofs.4422.tr"))
    , (6049,Do (ASave "or_network.4423"))
    , (2100,"t.4433_else.11785_then.11808" := ACall TInt (Label "solver_surface.3548") ["m.3672.7131","dirvec.4424"] ["b0.3673.7135","b1.3677.7139","b2.3681.7143"])
    , (6050,Do (ARestore "dirvec.4424"))
    , (6051,Do (ARestore "head.4425"))
    , (6052,Do (ARestore "ofs.4422.tr"))
    , (6053,Do (ARestore "or_network.4423"))
    , (9662,Do ANop)
    , (2101,Do (ABr (Label "cont.11782.13974")))]}], aRet = TUnit}-- }}}

