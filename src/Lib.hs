{-# LANGUAGE DeriveGeneric #-}

module Lib
    ( someFunc
    , createSteve
    , NonEmptySteve
    ) where

import Data.Semigroup

someFunc :: IO ()
someFunc = putStrLn "someFunc"


data NonEmptySteve a = Steve String a [a] deriving (Show)

createSteve :: String -> [a] -> Maybe (NonEmptySteve a)
createSteve _ [] = Nothing
createSteve "Steve" (x : xs) = Just (Steve "Steve" x xs)
createSteve _ _ = Nothing

instance Functor NonEmptySteve where  
    fmap f (Steve name a as) = Steve name (f a) (f <$> as)

instance Semigroup (NonEmptySteve a) where
    (Steve _ a as) <> (Steve _ b bs) = (Steve "Steve" a $ as <> [b] <> bs)
