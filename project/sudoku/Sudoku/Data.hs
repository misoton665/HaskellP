module Sudoku.Data(
  )where

-- SDNum
type SDNum = Maybe Int

showSDNum num = num >>= show

-- SDPosition
type SDPosition = (SDNum, SDNum)

showSDPos pos = "(" ++ (show $ fst pos) ++ ", " ++ (show $ snd pos) ++ ")"

-- SDSquare
data SDSquare = SDSquare SDPosition SDNum

-- SDStage
type SDStage = [[SDSquare]]
