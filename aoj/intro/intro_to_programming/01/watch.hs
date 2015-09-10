main = do
  inputs <- readLn
  let h = inputs `div` 60 `div` 60
  let m = (inputs - h * 60 * 60) `div` 60
  let s = inputs - h * 60 * 60 - m * 60
  putStrLn $ (show h) ++ ":" ++ (show m) ++ ":" ++ (show s)
