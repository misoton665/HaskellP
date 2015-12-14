import Control.Applicative
import Text.Printf
main = do
  r <- (read :: String -> Double) <$> getLine
  putStrLn $ printf "%.8f %.8f" (r * r * pi) (2 * r * pi)
