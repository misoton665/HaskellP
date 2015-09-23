import Sudoku.Data

main :: IO ()
main = do
  let sdNum = Nothing 
      sdPosition = (2, 3)
      sdSquare = SDSquare sdPosition sdNum
      sdRow = replicate 9 sdSquare
      sdStage = replicate 9 sdRow
  putStrLn $ showSDNum sdNum
  putStrLn $ showSDPos sdPosition
  putStrLn $ showSDSquare sdSquare
  putStrLn $ showSDSquareSimply sdSquare
  putStrLn $ showSDRow sdRow
  putStrLn $ showSDRowSimply sdRow
  putStrLn $ showSDStage sdStage
  putStrLn $ showSDStageSimply sdStage
