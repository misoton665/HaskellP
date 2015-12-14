module Command.TestCommand (
  command
) where

import Sudoku.Data
import Sudoku.Editor
import Command.Data

command :: Command -> SDStage -> (SDStage)
command TestCommand stage = id stage
