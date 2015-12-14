import Control.Applicative
main = do
  lines <- zip (map show [1..]) . words <$> getContents
  sequence . map putStrLn . init $ ["Case " ++ index ++ ": " ++ value| (index, value) <- lines]
