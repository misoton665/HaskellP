module Controller.Game (
  game
  ) where

import Command.TestCommand as TCom
import Command.Data
import Sudoku.Data
import Sudoku.Generator

game :: IO ()
game = do
  result <- gameAction
  case result of
    Nothing    -> return ()
    (Just val) -> do
      session val
      game

session :: Command -> IO ()
session command = case command of
  UndefinedCommand name -> putStrLn $ "\"" ++ name ++ "\" command is not found."
  TestCommand _ _ _ -> putStrLn . showSDStage $ TCom.command command newFormedSDStage
  NoCommand -> return ()
  otherwise -> putStrLn . show $ command

gameAction :: IO (Maybe Command)
gameAction = do
  input <- words <$> getLine
  let command = toCommand input
  return $ case command of
    ExitCommand -> Nothing
    otherwise -> (Just command)

toCommand :: [String] -> Command
toCommand (x:xs) = case x of
    "test"   -> TestCommand (xsi !! 0) (xsi !! 1) (xsi !! 2)
    "put"    -> PutCommand (read $ xs !! 0) (read $ xs !! 1) (read $ xs !! 2) 
    "exit" -> ExitCommand
    otherwise -> UndefinedCommand x
    where xsi = map read xs :: [Int]
toCommand _ = NoCommand
