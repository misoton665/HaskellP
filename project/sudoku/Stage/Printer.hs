module Stage.Printer(
  mkString,
  stagePrint,
  stagePrintSimply,
  showRow,
  showSquare,
  showNum
) where

import qualified Stage.SDStage as SS
import qualified Stage.SDSquare as SQ
import qualified Stage.SDPosition as SP
import qualified Stage.SDNum as SN

-- each 3 squares
lineInRowSpace = halfRowSpace ++ "|" ++ halfRowSpace

-- between of squares
rowSpace = halfRowSpace ++ " " ++ halfRowSpace

-- half of (rowSpace - 1)
halfRowSpace = "   "

-- underbars which length equals (halfRowSpace ++ row ++ halfRowSpace)
lineString :: String
lineString = 
  let len = length SS.mkEmptyRow
  in replicate len '_'

lineSpace :: String
lineSpace = replicate 70 ' '

mkString :: (a -> String) -> String -> [a] -> String
mkString showFunc space (x:xs)
  |(length xs) == 0 = showFunc x 
  |otherwise        = (showFunc x) ++ space ++ (mkString showFunc space xs)

stagePrintSimply :: SS.SDStage -> IO[()]
stagePrintSimply sdstage = sequence $ map (putStrLn . showRowSimply) $ SS.sdsquares sdstage

showRowSimply :: [SQ.SDSquare] -> String
showRowSimply = mkString showSquare " "

stagePrint :: SS.SDStage -> IO [()]
stagePrint sdstage = sequence $ map (putStrLn . (\s -> lineString ++ "\n|" ++ lineSpace ++ "|\n|" ++ s) . showRow) $ SS.sdsquares sdstage 

showRow :: [SQ.SDSquare] -> String
showRow = (\s -> "|   " ++ s ++ "   |") . (mkString showSquare "       ")

showSquare :: SQ.SDSquare -> String
showSquare squ = showNum $ SQ.sdnum squ

showNum :: SN.SDNum -> String
showNum num
  |num == nothing = "."
  |otherwise      = show . SN.num $ num
  where nothing = SN.mkSDNum (-1)
