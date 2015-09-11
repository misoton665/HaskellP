import Control.Applicative
main = do
  cs <- lines <$> getContents
  putStrLn $ solve 1 cs

solve :: Int -> [String] -> String
solve n (x:xs)
  | (read x :: Int) == 0 = "\b"
  | otherwise = "Case " ++ (show n) ++ ": " ++ x ++ "\n" ++ (solve (n + 1) xs)
