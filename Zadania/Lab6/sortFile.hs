module SortFile
where

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort xs | len <= 1 = xs
             | otherwise = merge (mergeSort ys) (mergeSort zs)
               where half = length xs ‘div‘ 2
                     ys = take half xs
                     zs = drop half xs

sortFile = do
           [f,g] <- getArgs
           s <- readFile f
           let lines_tekst = lines s
           let sort = mergeSort lines_tekst
           let unlines_tekst = unlines sort
           writeFile g unlines_tekst
