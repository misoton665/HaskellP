module Random.MyRandom(
  rand,
  rand3,
  randomSelect
  ) where

import System.Random

rand :: (Num a, Random a) => (a, a) -> IO a
rand r = getStdRandom $ randomR r

rand3 :: IO Integer
rand3 = rand (0, 2)

randomSelect :: [a] -> IO a
randomSelect xs = do
  ran <- rand $ (0, (length xs) - 1)
  return $ xs !! ran
