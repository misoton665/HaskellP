import Sudoku.Data
import Sudoku.Generater
import Sudoku.Editor

main :: IO ()
main = do
  let sdNum = Nothing 
      sdPosition = (2, 3)
      sdSquare = SDSquare sdPosition sdNum
      sdRow = replicate 9 sdSquare
      sdStage = replicate 9 sdRow
      formedStage = newFormedSDStage
      sdEdittedSquare = editSDSquare (Just 5) sdSquare
      sdEdittedStage = editSDStage sdEdittedSquare formedStage
  putStrLn $ showSDNum sdNum
  putStrLn $ showSDPos sdPosition
  putStrLn $ showSDSquare sdSquare
  putStrLn $ showSDSquareSimply sdSquare
  putStrLn $ "-----------------------"
  putStrLn $ showSDSquareSimply $ sdEdittedSquare
  putStrLn $ showSDRow sdRow
  putStrLn $ showSDRowSimply sdRow
  putStrLn $ showSDStage sdStage
  putStrLn $ showSDStageSimply sdStage
  putStrLn $ showSDStageSimply sdEdittedStage
