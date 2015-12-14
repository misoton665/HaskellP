import Control.Applicative
main = do
  [in_a, in_op, in_b] <- words <$> getLine
  let (a, op, b) = (read in_a :: Int, head in_op, read in_b :: Int)
      ans = case op of
              '+' -> a + b
              '-' -> a - b
              '*' -> a * b
              '/' -> a `div` b
              otherwise -> 0
  if op == '?' then return () else print ans >> main
