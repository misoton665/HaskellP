module Judge.Judger (
  judge
  ) where

import Sudoku.Data
import Sudoku.Editor

type JudgeResult = (Int, Int)

judge :: SDStage -> JudgeResult
judge stage = (judgeEmptySquares stage, 0)

judgeRightness :: SDStage -> Int
judgeRightness stage = undefined

judgeEmptySquares :: SDStage -> Int
judgeEmptySquares stage = sum . concat . map (map isNotEmpty) $ stage
  where isNotEmpty squ = if getSDNum squ /= Nothing then 0 else 1
