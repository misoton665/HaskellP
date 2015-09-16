module Stage.SDNum (
  SDNum,
  num,
  mkSDNum,
  mkSDNothing,
  isEnable
  ) where

data SDNum = SDNum { num :: Int }| SDNothing deriving (Eq, Show)

mkSDNum :: Int -> SDNum
mkSDNum (-1) = SDNothing
mkSDNum n = SDNum n

mkSDNothing = SDNothing

isEnable :: Int -> Bool
isEnable x = if 1 <= x && x <= 9 then True else False
