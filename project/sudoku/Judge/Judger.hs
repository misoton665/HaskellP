module Judge.Judger (
  judge
  ) where

import Data.List

import Sudoku.Data
import Sudoku.Editor

type JudgeResult = (Int, Int)

judge :: SDStage -> JudgeResult
judge stage = (judgeEmptySquares stage, judgeRightness stage)

judgeRightness :: SDStage -> Int
judgeRightness stage = length $ (selectWrongRow stage) ++ (selectWrongRow $ rotateSDStage stage) ++ (selectWrongRow $ divideBoxes stage)
  where selectWrongRow target = filter (not . isRightRow) target

--isRightRow :: [SDSquare] -> Bool
--isRightRow row = (length row == 9) && rightnessWeight
--  where rightnessWeight = isExistSameElem || isExistAllNumber
--        isExistSameElem = (length row) == (length . nub $ row)
--        isExistAllNumber = (length row) == (length $ filter (\x -> getSDNum x /= Nothing) row)

isRightRow :: [SDSquare] -> Bool
isRightRow row = length ((sort . map (purge . getSDNum) $ row) \\ [0..9]) == 0
  where purge :: Maybe Int -> Int
        purge m = case m of
            Just x -> x
            Nothing  -> -1

judgeEmptySquares :: SDStage -> Int
judgeEmptySquares stage = sum . concat . map (map isNotEmpty) $ stage
  where isNotEmpty squ = if getSDNum squ /= Nothing then 0 else 1


