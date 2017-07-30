import Data.List.Split(chunksOf)

solve :: String->String
solve s = chunksOf 2 s >>= reverse

main :: IO ()
main = getContents >>= mapM_ putStrLn. (map solve) . tail . lines
