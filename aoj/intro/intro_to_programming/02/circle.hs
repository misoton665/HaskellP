import Control.Applicative
main = do
  [w, h, x, y, r] <- map read . words <$> getLine :: IO [Int]
  putStrLn $ if 0 <= x - r && x + r <= w && 0 <= y - r && y + r <= h
            then "Yes"
            else "No"
