module Controller.Game (
  game
  ) where

import Control.Applicative
import Judge.Judger as Judge
import Command.PutCommand as PCom
import Command.TestCommand as TCom
import Command.Data
import Sudoku.Data
import Sudoku.Generator

game :: SDStage -> IO ()
game stage = do
  result <- gameAction
  case result of
    Nothing    -> return ()
    (Just val) -> do
      session stage val >>= game

session :: SDStage -> Command -> IO SDStage
session stage command = case command of
  UndefinedCommand name -> do 
    putStrLn $ "\"" ++ name ++ "\" command is not found."
    return stage
  
  PutCommand _ _ _ -> do 
    let newStage = PCom.command command stage
    putStrLn . showSDStageSimply $ newStage
    return newStage

  TestCommand -> do
    let newStage = TCom.command command stage
    putStrLn . showSDStageSimply $ newStage
    putStrLn . show $ Judge.judge newStage
    return newStage

  otherwise -> do 
    putStrLn . show $ command
    return stage

gameAction :: IO (Maybe Command)
gameAction = do
  input <- words <$> getLine
  let command = toCommand input
  return $ case command of
    ExitCommand -> Nothing
    otherwise -> (Just command)

toCommand :: [String] -> Command
toCommand (x:xs) = case x of
    "test"   -> TestCommand
    "put"    -> PutCommand (xsi !! 0) (xsi !! 1) (xsi !! 2) 
    "exit" -> ExitCommand
    otherwise -> UndefinedCommand x
    where xsi = map read xs :: [Int]
toCommand _ = NoCommand
