import qualified Random.MyRandom as Random
import qualified Stage.SDNum as SN
import qualified Stage.SDStage as SS
import qualified Stage.SDPosition as SP
import qualified Stage.Printer as SPrinter

main = do
  randomNum <- Random.rand3
  let sdnum = SN.mkSDNum 4
      stage = SS.mkEmptySDStage
      tpos = SP.mkSDPosition sdnum sdnum
      sdnum8 = SN.mkSDNum 8
      stage2 = SS.replaceNum tpos sdnum8 stage
  SPrinter.stagePrintSimply stage
  SPrinter.stagePrintSimply stage2
  print $ SN.num sdnum
  print randomNum
  putStrLn "Sudoku"
  putStrLn $ SPrinter.mkString show "." [1]
  Random.randomSelect ["hoge", "fuga", "maguro"] >>= putStrLn
