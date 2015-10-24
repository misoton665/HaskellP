module Command.Data (
    Command(..)
  ) where

data Command = TestCommand{getX :: Int, getY :: Int, getVal :: Int}
              |PutCommand Int Int Int
              |ExitCommand
              |UndefinedCommand {getName :: String}
              |NoCommand deriving (Show)
