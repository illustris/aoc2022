module Main where

import Data.List.Split
import Data.List
import Data.Ord

digitToInt x = read x :: Int

max' :: Ord a => [a] -> a
max' = foldr1 (\x y ->if (x >= y) then x else y)

calPerElf x = map (sum . map digitToInt . lines) (splitOn "\n\n" x)
maxCal x = max' . calPerElf $ x

-- sortBy (comparing Down) is far more efficient than reverse . sort
topNSum n x = sum . take n . sortBy (comparing Down) . calPerElf $ x

main :: IO ()
main = do
  n <- getContents
  -- part 1
  -- putStrLn . show . maxCal $ n
  -- part 2
  putStrLn . show . topNSum 3 $ n
  
