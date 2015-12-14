import Control.Applicative
import Control.Monad
main = do
  [h, w] <- map (read :: String -> Int) . words <$> getLine
  if h == 0 && w == 0
    then return [()]
    else do
      putStrLn $ replicate w '#'
      replicateM (h - 2) . putStrLn $ "#" ++ (replicate (w - 2) '.') ++ "#"
      putStrLn $ replicate w '#'
      putStrLn ""
      main
