module Main where

import Data.List
import Data.IntMap.Strict (IntMap)
import qualified Data.IntMap.Strict as IntMap
import Data.Maybe

powers :: Int -> Int -> Int
powers n x = sum (unfoldr unfoldPowers (1, IntMap.singleton x 1))
  where unfoldPowers (k, xs)
          | IntMap.null xs = Nothing
        unfoldPowers (k, IntMap.splitLookup (k^n) -> (_, z, xs)) = Just (fromMaybe 0 z, (k + 1, xs'))
          where xs' = IntMap.unionWith (+) xs (IntMap.mapKeysMonotonic (subtract (k^n)) xs)

main = do x <- readLn
          n <- readLn
          print (powers n x)
