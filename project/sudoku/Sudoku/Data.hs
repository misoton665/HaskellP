module Sudoku.Data (
  SDNum(..),
  SDPosition(..),
  SDSquare(..),
  SDStage(..),
  showSDNum,
  showSDPos,
  showSDSquare,
  showSDSquareSimply,
  showSDRow,
  showSDRowSimply,
  showSDStage,
  showSDStageSimply
  ) where

-- SDNum
type SDNum = Maybe Int

showSDNum :: SDNum -> String
showSDNum Nothing = "."
showSDNum (Just num) = show num

-- SDPosition
type SDPosition = (Int, Int)

showSDPos :: SDPosition -> String
showSDPos pos = "(" ++ (show $ fst pos) ++ ", " ++ (show $ snd pos) ++ ")"

-- SDSquare
data SDSquare = SDSquare {
  getSDPos :: SDPosition,
  getSDNum :: SDNum }

showSDSquare :: SDSquare -> String
showSDSquare squ = (showSDPos $ getSDPos squ) ++ " : " ++ (showSDNum $ getSDNum squ)

showSDSquareSimply :: SDSquare -> String
showSDSquareSimply = showSDNum . getSDNum 

-- SDStage
type SDStage = [[SDSquare]]

showSDRow :: [SDSquare] -> String
showSDRow = mkString showSDSquare " "

showSDRowSimply :: [SDSquare] -> String
showSDRowSimply = mkString showSDSquareSimply " "

showSDStage :: SDStage -> String
showSDStage = mkString showSDRow "\n"

showSDStageSimply :: SDStage -> String
showSDStageSimply = mkString showSDRowSimply "\n"

mkString :: (a -> String) -> String -> [a] -> String
mkString shower bindStr = foldl (\acc x -> acc ++ bindStr ++ (shower x)) ""

