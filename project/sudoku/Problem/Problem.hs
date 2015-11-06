module Problem.Problem(
  Problem(..),
  makeEmptyProblem,
  makeProblemStage
  ) where

import Sudoku.Data
import Sudoku.Editor
import Sudoku.Generator

import Random.MyRandom

data ProblemSquare = ProblemSquare{
  getSquare :: SDSquare,
  getCandidates :: [Int]
  }

instance Show ProblemSquare where
  show ps = (showSDSquare . getSquare $ ps) ++ ": " ++ (show . getCandidates $ ps)

type Problem = [[ProblemSquare]]

makeEmptyProblem :: Problem
makeEmptyProblem = map (map (\squ -> ProblemSquare squ [1..9])) newFormedSDStage

toSDStage :: Problem -> SDStage
toSDStage = map (map getSquare)

makeProblemStage :: IO SDStage
makeProblemStage = do
  let empp = makeEmptyProblem
  problem <- sequence . map sequence $ map (map select) empp
  return . toSDStage $ problem

select' :: ProblemSquare -> IO (SDSquare, Int)
select' ps = do
  let pos = getSDPos . getSquare $ ps
  num <- randomSelect . getCandidates $ ps
  return $ (SDSquare pos (Just num), num)

select :: ProblemSquare -> IO ProblemSquare
select ps = do
  (squ, d) <- select' ps
  return $ ProblemSquare squ (drop d can)
    where can = getCandidates ps

  
