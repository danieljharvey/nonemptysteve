module Main where

import Prelude
import Lib
import Test.QuickCheck

main :: IO ()
main = quickCheck $ isSteve $ Steve "bool" 1 []

isSteve :: NonEmptySteve a -> Bool
isSteve (Steve "Steve" _ _) = True
isSteve _ = False


