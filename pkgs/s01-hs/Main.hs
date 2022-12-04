module Main where
import Data.List.Split
digitToInt x = read x :: Int
max' :: Ord a => [a] -> a
max' = foldr1 (\x y ->if (x >= y) then x else y)
maxSum x = max' (map (sum . (map digitToInt) . lines) (splitOn "\n\n" x))
main :: IO ()
main = do
  n <- getContents
  putStrLn . show . maxSum $ n
