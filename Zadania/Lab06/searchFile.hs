module SearchFile
where

search :: [[Char]] -> [Char] -> Int -> [Int]
search [] s i = []
search (y:ys) s i | y == s = [i] ++ search ys s i
                  | otherwise = search ys s i

searchWord :: [[Char]] -> [Char] -> Int -> [Int]
searchWord [] s i = []
searchWord (x:xs) s i = (search ys s i) ++ (searchWord xs s (i + 1))
                        where ys = words x

searchFile = 
        do [f,g] <- getArgs
           let slowo = f
           s <- readFile g
           let lines_tekst = lines s
           let linie_slowa = searchWord lines_tekst slowo 1
           print(linie_slowa)
