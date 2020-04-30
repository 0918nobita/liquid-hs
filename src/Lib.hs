module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

{-@ type Pos = { v:Int | v > 0 } @-}

{-@ one :: Pos @-}
one :: Int
one = 1

{- 「任意の整数 v に対して v == 0 ならば v > 0」は成り立っていない -}
{-
{-@ zero :: Pos @-}
zero :: Int
zero = 0
-}

{-@ type NonZero = { v:Int | v /= 0 } @-}

{-@ myDiv :: Int -> NonZero -> Int @-}
myDiv :: Int -> Int -> Int
myDiv = div

good :: Int
good = myDiv 10 2

{-
bad :: Int
bad = myDiv 10 0
-}

{-@ doublePos :: n:{ v:Int | v > 0 } -> { v:Int | n < v } @-}
doublePos :: Int -> Int
doublePos n = 2 * n

{-
{-@ bad :: { v:Int | v < 0 } @-}
bad :: Int
bad = doublePos (-1)
-}
