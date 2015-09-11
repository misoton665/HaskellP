module Stage.SDNum (
  SDNum,
  num,
  mkSDNum,
  mkSDNothing
  ) where

data SDNum = SDNum { num :: Int }| SDNothing deriving (Eq, Show)

mkSDNum :: Int -> SDNum
mkSDNum (-1) = SDNothing
mkSDNum n = SDNum n

mkSDNothing = SDNothing
