module Sudoku.Generater (
  newFormedSDRow,
  newFormedSDStage
  ) where

import Sudoku.Data

newFormedSDRow :: Int -> [SDSquare]
newFormedSDRow = newFormedSDRow' 1

newFormedSDRow' :: Int -> Int -> [SDSquare]
newFormedSDRow' elmNum rowNum
  |1 > elmNum || elmNum > 9 = [] 
  |otherwise = (SDSquare (elmNum, rowNum) Nothing) : newFormedSDRow' (elmNum + 1) rowNum

newFormedSDStage :: SDStage
newFormedSDStage = newFormedSDStage' 1

newFormedSDStage' :: Int -> SDStage
newFormedSDStage' rowNum
  |1 > rowNum || rowNum > 9 = []
  |otherwise   = (newFormedSDRow rowNum) : newFormedSDStage' (rowNum + 1)
