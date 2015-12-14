module Problem.Problem(
  makeProblemStage
  ) where

import Debug.Trace

import Data.List

import Sudoku.Data
import Sudoku.Editor
import Sudoku.Generator

import Random.MyRandom

type ProblemSquare = (SDSquare, [Int])

getPos :: ProblemSquare -> SDPosition
getPos = getSDPos . fst

type Problem = [[ProblemSquare]]

getProblemSquare :: SDPosition -> Problem -> Maybe ProblemSquare
getProblemSquare pos problem = find isSamePos $ concat problem
  where isSamePos ps = (getPos ps) == pos

replaceProblemSquare :: ProblemSquare -> Problem -> Problem
replaceProblemSquare ps = map $ map replaceIfSamePos
  where replaceIfSamePos xps = if isSamePos xps ps then ps else xps
        isSamePos aps bps = getPos aps == getPos bps

makeEmptyProblem :: Problem
makeEmptyProblem = map (map (\squ ->(squ, [1..9]))) newFormedSDStage

toSDStage :: Problem -> SDStage
toSDStage = map (map fst)

selectProblem' :: SDPosition -> Maybe SDPosition -> IO Problem -> IO Problem
selectProblem' (x, y) next p = do
  pval <- p
  let targetSquare = getProblemSquare (x, y) pval 
      selected = select $ maybe (SDSquare (x, y) (Just 1), [0]) id targetSquare
  (selectedSquare, selectedValue) <- selected
  let newProblem = deleteCandidateForProblem selectedValue (getPos selectedSquare) pval
  case next of
    Just n  -> selectProblem n $ return . replaceProblemSquare selectedSquare $ newProblem
    Nothing -> return . replaceProblemSquare selectedSquare $ pval

selectProblem :: SDPosition -> IO Problem -> IO Problem
selectProblem (9, 9) p = selectProblem' (9, 9) Nothing p
selectProblem (9, y) p = selectProblem' (9, y) (Just (1, y + 1)) p
selectProblem (x, y) p = selectProblem' (x, y) (Just (x + 1, y)) p

makeProblem :: IO Problem
makeProblem = selectProblem (1, 1) $ return makeEmptyProblem

select' :: ProblemSquare -> IO (SDSquare, Int)
select' ps = do
  let pos = getSDPos . fst $ ps
  num <- randomSelect . snd $ ps
  return $ (SDSquare pos (Just num), num)

select :: ProblemSquare -> IO (ProblemSquare, Int)
select ps = do
  (squ, d) <- select' ps
  return $ ((squ, (delete d can)), d)
  where can = snd ps

makeProblemStage :: IO SDStage
makeProblemStage = do
  prob <- makeProblem
  return $ toSDStage prob

deleteCandidateForProblem :: Int -> SDPosition -> Problem -> Problem
deleteCandidateForProblem v ps = deleteCandidateWithBox pos v . deleteCandidateWithRow row v -- . deleteCandidateWithColmun col v
  where pos = ((col) `div` 3, (row) `div` 3)
        row = (snd ps) - 1
        col = (fst ps) - 1

-- |
-- >>> deleteCandidate 1 (SDSquare (1,1) (Just 1), [1, 2, 3])
-- (SDSquare {getSDPos = (1,1), getSDNum = Just 1},[2,3])
deleteCandidate :: Int -> ProblemSquare -> ProblemSquare
deleteCandidate v ps = (fst ps, delete v $ snd ps)

-- |
-- >>> snd $ (deleteCandidateWithBox (0, 0) 1 makeEmptyProblem) !! 1 !! 1
-- [2,3,4,5,6,7,8,9]
--
-- >>> snd $ (deleteCandidateWithBox (0, 1) 1 makeEmptyProblem) !! 1 !! 1
-- [1,2,3,4,5,6,7,8,9]
-- 
-- >>> snd $ (deleteCandidateWithBox (0, 1) 1 makeEmptyProblem) !! 1 !! 1
-- [1,2,3,4,5,6,7,8,9]
deleteCandidateWithBox :: (Int, Int) -> Int -> Problem -> Problem
deleteCandidateWithBox (x, y) v prob = map (map deleteIfInBox) prob
  where deleteIfInBox xps = if isInBox (x, y) xps then deleteCandidate v xps else xps

deleteCandidateWithRow :: Int -> Int -> Problem -> Problem
deleteCandidateWithRow row v prob = map (map deleteIfInRow) prob
  where deleteIfInRow xps = trace (":> " ++ (show . snd $ xps)) (if isInRow row xps then deleteCandidate v xps else xps)

deleteCandidateWithColmun :: Int -> Int -> Problem -> Problem
deleteCandidateWithColmun col v prob = transpose . deleteCandidateWithRow col v . transpose $ prob

-- rotateProblem :: Problem -> Problem
-- rotateProblem prob = map rotateRow [0..8]
--   where rotateRow val = map (!! val) prob

isInBox :: (Int, Int) -> ProblemSquare -> Bool
isInBox (x, y) ps = ((fst pos) - 1) `div` 3 == x && ((snd pos) - 1) `div` 3 == y
  where pos = getPos ps

-- |
-- >>> isInRow 1 $ makeEmptyProblem !! 0 !! 1
-- True
isInRow :: Int -> ProblemSquare -> Bool
isInRow row ps = (fst . getPos $ ps) == row - 1
