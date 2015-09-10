module MyRandom(rand, rand3) where

import System.Random

rand :: (Num a, Random a) => (a, a) -> IO a
rand r = getStdRandom $ randomR r

rand3 :: IO Integer
rand3 = rand (0, 2)
