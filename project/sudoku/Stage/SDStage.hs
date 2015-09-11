module Stage.SDStage(
  SDStage,
  sdsquares,
  mkEmptySDStage,
  mkEmptyRow
  ) where

import Stage.SDNum
import Stage.SDPosition
import Stage.SDSquare

data SDStage = SDStage {
  sdsquares :: [[SDSquare]]
  } deriving (Show)

mkEmptySDStage :: SDStage
mkEmptySDStage = SDStage $ replicate 9 mkEmptyRow

mkEmptyRow :: [SDSquare]
mkEmptyRow = replicate 9 mkEmptySDSquare
