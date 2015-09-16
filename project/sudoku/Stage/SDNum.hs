module SDNum(
    SDNum(..)
  ) where

data SDNum = SDNum Int| SDNothing

instance Eq SDNum where
  SDNothing == SDNothing = True
  SDNum a == SDNum b = a == b

instance Show SDNum where
  show SDNothing = "."
  show SDNum a = show a
