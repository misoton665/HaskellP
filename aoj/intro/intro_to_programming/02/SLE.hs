{-# LANGUAGE ScopedTypeVariables #-}
import Control.Applicative
main = do
  [a, b] :: [Int] <- (map read . words) <$> getLine
  putStrLn $ solve a b

solve :: Int -> Int -> [Char]
solve a b
  |a > b  = "a > b"
  |a == b = "a == b"
  |a < b  = "a < b"
