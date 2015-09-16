module Stage.SDSquare(
  SDSquare,
  sdnum,
  mkSDSquare,
  mkEmptySDSquare,
  isSamePositionBy
  ) where

import qualified Stage.SDPosition as SP
import qualified Stage.SDNum as SN

data SDSquare = SDSquare {
  sdposition :: SP.SDPosition,
  sdnum :: SN.SDNum
  } deriving (Show)

mkSDSquare :: SP.SDPosition -> SN.SDNum -> SDSquare
mkSDSquare pos num = SDSquare pos num

mkEmptySDSquare = SDSquare SP.mkEmptySDPosition SN.mkSDNothing

isSamePositionBy :: SDSquare -> SDSquare -> Bool
isSamePositionBy a b = if (sdposition a) == (sdposition b) then True else False

