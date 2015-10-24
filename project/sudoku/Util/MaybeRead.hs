module Util.MaybeRead(
  maybeRead
  ) where

maybeRead :: String -> Maybe Int
maybeRead valStr = case aftRead of
  []       -> Nothing
  [(x, _)] -> Just x
  where aftRead = reads valStr :: [(Int, String)]
