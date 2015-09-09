import Data.List
main = do
  inputs <- sequence $ replicate 10 getLine 
  let hills = map read inputs :: [Int]
  mapM print $ take 3 $ reverse . sort $ hills
