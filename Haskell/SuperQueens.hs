import Control.Monad (guard)

import qualified Data.IntSet as Set

placeNSuperQueens :: Int -> Int
placeNSuperQueens n
    = length (go Set.empty Set.empty Set.empty
                 (100, 100) 
                 n)
    where go _ _ _ _ 0
              = return () 
          go horizontals diagonals antidiagonals (y1, y2) left = do
              y <- [1..n]
              let x = n - left
                  currentDiagonal = y - x
                  currentAntidiagonal = y + x
              guard $ abs (y2 - y) /= 2 
              guard $ abs (y1 - y) /= 1
              guard $ y `Set.notMember` horizontals
              guard $ currentDiagonal `Set.notMember` diagonals
              guard $ currentAntidiagonal `Set.notMember` antidiagonals
              go (Set.insert y horizontals)
                 (Set.insert currentDiagonal diagonals)
                 (Set.insert currentAntidiagonal antidiagonals)
                 (y2, y)
                 (left - 1)

main :: IO ()
main = interact $ show . placeNSuperQueens . read
