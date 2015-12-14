module Judge.Judger (
  judge
  ) where

import Data.List
import Data.Maybe

import Sudoku.Data
import Sudoku.Editor

type JudgeResult = (Int, Int)

judge :: SDStage -> JudgeResult
judge stage = (judgeEmptySquares stage, judgeRightness stage)

judgeRightness :: SDStage -> Int
judgeRightness stage = length $ selectWrongRow stage ++ selectWrongRow (rotateSDStage stage) ++ selectWrongRow (divideBoxes stage)
  where selectWrongRow = filter (not . isRightRow)

--isRightRow :: [SDSquare] -> Bool
--isRightRow row = (length row == 9) && rightnessWeight
--  where rightnessWeight = isExistSameElem || isExistAllNumber
--        isExistSameElem = (length row) == (length . nub $ row)
--        isExistAllNumber = (length row) == (length $ filter (\x -> getSDNum x /= Nothing) row)

isRightRow :: [SDSquare] -> Bool
isRightRow row = null ((sort . map (purge . getSDNum) $ row) \\ [0..9])
  where purge :: Maybe Int -> Int
        purge = fromMaybe (-1)

judgeEmptySquares :: SDStage -> Int
judgeEmptySquares stage = sum . concatMap (map isNotEmpty) $ stage
  where isNotEmpty squ = if isJust $ getSDNum squ then 0 else 1


