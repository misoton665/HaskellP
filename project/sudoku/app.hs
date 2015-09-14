import qualified Random.MyRandom as Random
import qualified Stage.SDNum as SN
import qualified Stage.SDStage as SS
import qualified Stage.Printer as SPrinter

main = do
  randomNum <- Random.rand3
  let sdnum = SN.mkSDNum 4
      stage = SS.mkEmptySDStage
  SPrinter.stagePrintSimply stage
  print $ SN.num sdnum
  print randomNum
  putStrLn "Sudoku"
  putStrLn $ SPrinter.mkString show "." [1]
  Random.randomSelect ["hoge", "fuga", "maguro"] >>= putStrLn
