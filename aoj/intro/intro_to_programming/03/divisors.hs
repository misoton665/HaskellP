import Control.Applicative
main = do
  [a, b, c] <- map (read :: String -> Int) . words <$> getLine
  putStrLn . show . length $ [x| x <- [a..b], (c `div` x) * x == c]
