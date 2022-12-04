module Main where

import Data.List.Split
import Data.Char

letters = map (map (ord . head) . splitOn " ") . lines
-- ascii x = map (map (ord . head)) x

-- normalize all inputs to 0-2
norm x = [
  head x - ord 'A',
  last x - ord 'X'
  ]

-- get score given a tuple of opponent and player moves
player = last
opponent = head
getScore x = 1 + player x
             + 3 * (fromEnum (opponent x == player x))
             + 6 * fromEnum (player x == mod (1 + opponent x) 3)

-- get suggested player move given opponent's move and desired outcome
outcome = last
getMove x = mod (opponent x + outcome x + 3 - 1) 3
outToMove x = [
  head x,
  getMove x
  ]

main :: IO ()
main = do
  n <- getContents
  -- part 1
  -- putStrLn . show . sum . (map getScore) . (map norm) . letters $ n
  -- part 2
  putStrLn . show . sum . (map getScore) . (map outToMove) . (map norm) . letters $ n
