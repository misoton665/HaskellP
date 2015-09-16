module Stage.SDStage(
  SDStage,
  sdsquares,
  mkEmptySDStage,
  mkEmptyRow,
  replaceNum
  ) where

import qualified Stage.SDNum as SN
import qualified Stage.SDPosition as SP
import qualified Stage.SDSquare as SQ

data SDStage = SDStage {
  sdsquares :: [[SQ.SDSquare]]
  } deriving (Show)

mkEmptySDStage :: SDStage
mkEmptySDStage = SDStage $ replicate 9 mkEmptyRow

mkEmptyRow :: [SQ.SDSquare]
mkEmptyRow = replicate 9 SQ.mkEmptySDSquare

replaceNum :: SP.SDPosition -> SN.SDNum -> SDStage -> SDStage
replaceNum position num stage = replaceSquare (SQ.mkSDSquare position num) stage 

replaceSquare :: SQ.SDSquare -> SDStage -> SDStage 
replaceSquare squ stage = toSDStage $ map (\x -> if x `SQ.isSamePositionBy` squ then squ else x) $ concat $ sdsquares stage

toSDStage :: [SQ.SDSquare] -> SDStage
toSDStage squs = SDStage $ unconcatSDSquares squs

unconcatSDSquares :: [SQ.SDSquare] -> [[SQ.SDSquare]]
unconcatSDSquares [] = [[]]
unconcatSDSquares xs = (take 9 xs) : (unconcatSDSquares $ drop 9 xs)
