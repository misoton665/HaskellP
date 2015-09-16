module Stage.SDPosition(
  SDPosition,
  sdx,
  sdy,
  mkSDPosition,
  mkEmptySDPosition
  ) where

import qualified Stage.SDNum as SN

data SDPosition = SDPosition {
  sdx :: SN.SDNum,
  sdy :: SN.SDNum
  } deriving (Eq, Show)

mkSDPosition :: SN.SDNum -> SN.SDNum -> SDPosition
mkSDPosition x y = SDPosition x y

mkEmptySDPosition = SDPosition SN.mkSDNothing SN.mkSDNothing
