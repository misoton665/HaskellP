import Control.Applicative
import Data.List
main = do
  cs <- map (sort . map read . words) . lines <$> getContents :: IO [[Int]]
  mapM (putStrLn . unwords . map show) $ init cs
