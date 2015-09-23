module Sudoku.Editor (
  editSDStage,
  editSDSquare
  ) where

import Sudoku.Data
import Sudoku.Generater

editSDStage :: SDSquare -> SDStage -> SDStage
editSDStage newSqu oldStage = map (mapEditIfMatched newSqu) oldStage
  where isMatchWith a b = (getSDPos a) == (getSDPos b)
        mapEditIfMatched newSqu row = map (\a -> if (a `isMatchWith` newSqu) then editSDSquare (getSDNum newSqu) a else a) row

editSDSquare :: SDNum -> SDSquare -> SDSquare
editSDSquare num oldSqu = SDSquare (getSDPos oldSqu) num
