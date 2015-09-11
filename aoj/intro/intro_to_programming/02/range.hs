{-# LANGUAGE ScopedTypeVariables #-}

import Control.Applicative
main = do
  [a, b, c] :: [Int] <-  (map read . words) <$> getLine
  putStrLn $ solve a b c

solve :: Int -> Int -> Int -> [Char]
solve a b c
  |a < b = if b < c then "Yes" else "No"
  |otherwise = "No"
