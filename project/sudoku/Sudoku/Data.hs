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
  showSDStageSimply,
  getBox
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
  getSDNum :: SDNum } deriving(Eq, Show)

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

getSquWithIndex :: SDPosition -> SDStage -> SDSquare
getSquWithIndex (x, y) stage = stage !! y !! x

getBox :: (Int, Int) -> SDStage -> [SDSquare]
getBox (x, y) stage = map (\pos -> getSquWithIndex (pos !! 0, pos !! 1) stage) seqRowColIndexes
  where rowIndexes = map (+ (x * 3)) [0..2]
        colIndexes = map (+ (y * 3)) [0..2]
        seqRowColIndexes = sequence $ rowIndexes : colIndexes : []

mkString :: (a -> String) -> String -> [a] -> String
mkString shower bindStr = foldl (\acc x -> acc ++ bindStr ++ (shower x)) ""

