
module BackEnd.Decode where

import           Data.Word (Word32)
import qualified Data.ByteString.Char8 as BCS
import           Data.ByteString.Lazy.Builder
import qualified Data.ByteString.Lazy.Char8 as BCL
import           Data.BitSyntax

decodeFloatLE :: Float -> Word32
decodeFloatLE = decodeU32LE . BCS.pack . BCL.unpack . toLazyByteString . floatLE

decodeFloatBE :: Float -> Word32
decodeFloatBE = decodeU32 . BCS.pack . BCL.unpack . toLazyByteString . floatLE

-- `BCS.pack . BCL.unpack` is inevitable because
-- Data.BitSyntax uses strict ByteString (Data.ByteString.Internal) while
-- Data.ByteString.(Lazy.)Builder doesn't offer conversion function for strict ByteString
-- (there is no `toStrictByteString`)

