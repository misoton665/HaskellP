import SDStage

main = do
  let num = mkSDNum 1
  let x = mkSDNum 2
  let y = mkSDNum 3
  let pos = mkSDPosition x y
  let sq = mkSDSquare pos num
  print num
  print pos
  print sq
