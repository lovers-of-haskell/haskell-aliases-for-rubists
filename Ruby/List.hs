module Ruby.List where

import Prelude hiding (cycle)
import qualified Data.List as L
import Data.Maybe

-- (&) :: (Eq a) => [a] -> [a] -> [a]
-- (&) = union
-- 
-- (*) :: [a] -> Int -> [a]
-- arr * n = concat $ replicate n arr
-- 
-- -- (*) :: [a] -> String -> String
-- -- arr * n = undefined
-- 
-- (+) :: [a] -> [a] -> [a]
-- (+) = (++)
-- 
-- (-) :: [a] -> [a] -> [a]
-- (-) = undefined
-- 
-- (<<) :: [a] -> a -> [a]
-- arr << x = arr ++ [x]
-- 
-- (<=>) :: [a] -> [a] -> Ordering
-- (<=>) = undefined
-- 
-- (==) :: [a] -> [a] -> Bool
-- (==) = undefined

-- assoc :: [a] -> a -> Maybe a
-- assoc = undefined
-- 
-- at :: [a] -> Int -> a
-- at = (!!)
-- 
-- clear :: [a] -> [a]
-- clear = const []
-- 
-- clone, dup :: [a] -> [a]
-- clone = undefined
-- dup = undefined
-- 
-- collect, map :: [a] -> (a -> b) -> [b]
-- collect = flip L.map
-- map = flip L.map
-- 
-- combination :: [a] -> Int -> [a]
-- combination = undefined
-- 
-- compact :: [Maybe a] -> [a]
-- compact = L.map fromJust . filter isJust
-- 
-- concat :: [a] -> [a] -> [a]
-- concat = (++)

(#) :: a -> (a -> b) -> b
arr # f = f arr

cycle :: (Monad m) => [a] -> Int -> (a -> m b) -> m ()
cycle arr n proc = mapM_ proc cycle'
  where
    cycle' = L.concat $ L.replicate n arr

each :: (Monad m) => [a] -> (a -> m b) -> m [a]
each arr proc = mapM_ proc arr >> return arr

include :: (Eq a) => [a] -> a -> Bool
include = flip elem

inject :: [a] -> b -> (b -> a -> b) -> b
inject arr acc proc = foldl proc acc arr
