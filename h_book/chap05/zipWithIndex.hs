zipWithIndex2 :: [a] -> Int -> [(a, Int)]
zipWithIndex2 [] _ = []
zipWithIndex2 (x: xs) n = (x, n) : zipWithIndex2 xs (n + 1)
zipWithIndex' :: [a] -> [(a, Int)]
zipWithIndex' [] = []
zipWithIndex' xs = zipWithIndex2 xs 0

