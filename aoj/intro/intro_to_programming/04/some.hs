import Control.Applicative
main = do
  nums <- map (read :: String -> Int) . words . head . tail . lines <$> getContents
  let [min_, max_, sum_] = map show [foldl min 1000001 nums, foldl max (-1000001) nums, sum nums]
  putStrLn $ min_ ++ " " ++ max_ ++ " " ++ sum_
