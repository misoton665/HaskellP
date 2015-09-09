module SDStage(SDNum, SDPosition, SDSquare,
        mkSDNum, mkSDPosition, mkSDSquare) where

data SDNum = SDNum Int deriving (Eq, Show)

data SDPosition = SDPosition {
  x :: SDNum,
  y :: SDNum
  } deriving (Eq, Show)

data SDSquare = SDSquare {
  position :: SDPosition,
  num :: SDNum
  } deriving (Show)

mkSDNum :: Int -> SDNum
mkSDNum n = SDNum n

mkSDPosition :: SDNum -> SDNum -> SDPosition
mkSDPosition x y = SDPosition x y

mkSDSquare :: SDPosition -> SDNum -> SDSquare
mkSDSquare pos num = SDSquare pos num
