module Command.Data (
    Command(..)
  ) where

data Command = TestCommand
              |PutCommand Int Int Int
              |ExitCommand
              |UndefinedCommand {getName :: String}
              |NoCommand deriving (Show)
