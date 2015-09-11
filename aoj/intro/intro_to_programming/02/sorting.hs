{-# LANGUAGE ScopedTypeVariables #-}

import Control.Applicative
import Data.List
main = do
  inputs <- map read . words <$> getLine :: IO [Int]
  putStrLn . unwords . map show $ sort inputs
