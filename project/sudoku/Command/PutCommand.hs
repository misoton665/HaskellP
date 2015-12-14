module Command.PutCommand (
  command
) where

import Sudoku.Data
import Sudoku.Editor
import Command.Data

command :: Command -> SDStage -> (SDStage)
command (PutCommand x y val) stage = editSDStage' (x, y) (Just val) stage
