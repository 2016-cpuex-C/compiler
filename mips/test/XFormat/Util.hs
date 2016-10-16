{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module XFormat.Util where

import Text.XFormat.Show

ss :: StringF
ss = String
dd :: IntF
dd = Int
ff :: FloatF
ff = Float

(.%) :: String -> a -> S:%:a
s .% x = S s % x

(%.) :: a -> String -> a:%:S
x %. s = x % S s

(^) :: a -> b -> a:%:b
(^) = (%)

(.@) :: a -> Int -> a:%:SpacesF
x .@ n = x % Spaces n
infixr 8 .%
infixr 8 %.
infixr 6 ^

data S = S String
instance Format S Id where
  showsf' (S s) = Id (s++)

