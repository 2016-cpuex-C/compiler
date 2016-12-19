
module BackEnd.Decode where

import           Data.Int  (Int32)
import           Data.Word (Word16,Word32)
import qualified Data.ByteString.Char8 as BCS
import           Data.ByteString.Lazy.Builder
import qualified Data.ByteString.Lazy.Char8 as BCL
import           Data.BitSyntax
import           Data.Bits (testBit)
import           Numeric    (readInt)
import           Data.Char  (digitToInt)

decodeFloatLE :: Float -> Word32
decodeFloatLE = decodeU32LE . BCS.pack . BCL.unpack . toLazyByteString . floatLE

decodeFloatBE :: Float -> Word32
decodeFloatBE = decodeU32 . BCS.pack . BCL.unpack . toLazyByteString . floatLE

devideInteger :: Integer -> (Word16, Word16)
devideInteger n
  |  n < fromIntegral(minBound::Int32) ||
     fromIntegral (maxBound::Int32) <  n =
      error $ "Integer " ++ show n ++ " is out of range of Int32"
  | otherwise =
      let (hi,lo) = splitAt 16 $ int32ToBits $ fromIntegral n
      in  (readBits hi, readBits lo)

readBits :: Num a => String -> a
readBits = fst . head . readInt 2 (`elem` "01") digitToInt

int32ToBits :: Int32 -> String
int32ToBits n = reverse [ if testBit n i then '1' else '0' | i <- [0..31]]

-- `BCS.pack . BCL.unpack` is inevitable because
-- Data.BitSyntax uses strict ByteString (Data.ByteString.Internal) while
-- Data.ByteString.(Lazy.)Builder doesn't offer conversion function for strict ByteString
-- (there is no `toStrictByteString`)

