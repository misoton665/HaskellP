main = do
  cs <- getContents
  mapM print $ solveL cs

solveL :: String -> [Int]
solveL cs = map solve $ lines cs

solve :: String -> Int
solve line = length $ show (sum . map read $ words line :: Int)
