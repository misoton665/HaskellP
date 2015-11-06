module Problem.Problem(
  makeProblemStage
  ) where

import Sudoku.Data
import Sudoku.Editor
import Sudoku.Generator

import Random.MyRandom

type ProblemSquare = (SDSquare, [Int])

getPos :: ProblemSquare -> SDPosition
getPos = getSDPos . fst

type Problem = [[ProblemSquare]]

makeEmptyProblem :: Problem
makeEmptyProblem = map (map (\squ ->(squ, [1..9]))) newFormedSDStage

toSDStage :: Problem -> SDStage
toSDStage = map (map fst)

-- TODO: Make this
makeProblem :: IO Problem
makeProblem = return makeEmptyProblem

makeProblemStage :: IO SDStage
makeProblemStage = do
  prob <- makeProblem
  return $ toSDStage prob

dropCandidateForProblem :: Int -> ProblemSquare -> Problem -> Problem
dropCandidateForProblem v ps prob = dropCandidateWithBox pos v . dropCandidateWithRow row v . dropCandidateWithColmun col v $ prob
  where pos = ((fst . getPos $ ps) `div` 3, (snd . getPos $ ps) `div` 3)
        row = snd . getPos $ ps
        col = fst . getPos $ ps

dropCandidate :: Int -> ProblemSquare -> ProblemSquare
dropCandidate v ps = (fst ps, drop v $ snd ps)

dropCandidateWithBox :: (Int, Int) -> Int -> Problem -> Problem
dropCandidateWithBox (x, y) v prob = map (map dropIfInBox) prob
  where dropIfInBox xps = if isInBox (x, y) xps then dropCandidate v xps else xps

dropCandidateWithRow :: Int -> Int -> Problem -> Problem
dropCandidateWithRow row v prob = map (map dropIfInRow) prob
  where dropIfInRow xps = if isInRow row xps then dropCandidate v xps else xps

dropCandidateWithColmun :: Int -> Int -> Problem -> Problem
dropCandidateWithColmun col v prob = rotateProblem . dropCandidateWithRow col v . rotateProblem $ prob

rotateProblem :: Problem -> Problem
rotateProblem prob = map rotateRow [0..8]
  where rotateRow val = map (!! val) prob

isInBox :: (Int, Int) -> ProblemSquare -> Bool
isInBox (x, y) ps = (fst pos) `div` 3 == x && (snd pos) `div` 3 == y
  where pos = getPos ps

isInRow :: Int -> ProblemSquare -> Bool
isInRow row ps = (fst . getPos $ ps) == row
