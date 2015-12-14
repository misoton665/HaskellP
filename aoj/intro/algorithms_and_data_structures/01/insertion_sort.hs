import Control.Applicative
import Data.List(insert)
import Debug.Trace

main = do
  nums <- map (read :: String -> Int) . words . head . tail . lines <$> getContents 
  putStrLn . unwords . map show . fst $ insertion_sort [] nums

insertion_sort :: (Show a, Ord a) => [a] -> [a] -> ([a], [String])
insertion_sort base [] = (base, (showNumList base) : [])
insertion_sort base (x:xs) =  (res, (showNumList (base ++ (x:xs))) : lines)
  where (res, lines) = insertion_sort (insert x base) xs

showNumList = unwords . map show
