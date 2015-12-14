import Control.Applicative
import Text.Printf
main = do
  [a, b] <- map (read :: String -> Int) . words <$> getLine
  putStrLn $ printf "%d %d %.8f" (a `div` b) (a `mod` b) ((fromIntegral a / fromIntegral b) :: Double)
