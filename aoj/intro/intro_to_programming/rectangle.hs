import Control.Applicative
main = do
  [a, b] <- (map read . words) <$> getLine
  putStrLn $ (show $ a * b) ++ " " ++ (show $ (a + b) * 2)
