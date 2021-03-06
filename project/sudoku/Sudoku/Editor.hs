module Sudoku.Editor (
  editSDStage,
  editSDSquare,
  editSDStage',
  rotateSDStage,
  divideBoxes
  ) where

import Sudoku.Data
import Sudoku.Generator

editSDStage :: SDSquare -> SDStage -> SDStage
editSDStage newSqu oldStage = map (mapEditIfMatched newSqu) oldStage
  where isMatchWith a b = (getSDPos a) == (getSDPos b)
        mapEditIfMatched newSqu row = map (\a -> if (a `isMatchWith` newSqu) then editSDSquare (getSDNum newSqu) a else a) row

editSDStage' :: SDPosition -> SDNum -> SDStage -> SDStage
editSDStage' targetPos newNum = editSDStage (SDSquare targetPos newNum)

editSDSquare :: SDNum -> SDSquare -> SDSquare
editSDSquare num oldSqu = SDSquare (getSDPos oldSqu) num

rotateSDStage :: SDStage -> SDStage
rotateSDStage stage = map rotateRow [0..8]
  where rotateRow val = map (!! val) stage

divideBoxes :: SDStage -> [[SDSquare]]
divideBoxes stage = map (\pos -> getBox (pos !! 0, pos !! 1) stage) boxIndexes
  where boxIndexes = sequence $ [0..2] : [0..2] : []
