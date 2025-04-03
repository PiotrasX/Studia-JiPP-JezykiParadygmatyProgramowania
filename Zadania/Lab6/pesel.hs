module Pesel
where

divideFile :: [Char] -> [Char] -> [[Char]]
divideFile [] _ = []
divideFile (x:xs) s | x == '\n' = [take 11 word] ++ divideFile xs []
                    | xs == [] = [word] ++ divideFile xs []
                    | otherwise = divideFile xs word
                      where word = s ++ [x]

dividePesel :: [Char] -> [Int]
dividePesel [] = []
dividePesel (x:xs) = [read [x] :: Int] ++ dividePesel xs

dividePesele :: [[Char]] -> [[Int]]
dividePesele [] = []
dividePesele (x:xs) = [dividePesel x] ++ dividePesele xs

infixl 6 +.
(+.) :: (Int, Int) -> (Int, Int) -> (Int, Int)
(a, b) +. (c, d) = (a + c, b + d)

plec :: [[Int]] -> (Int, Int)
plec [] = (0,0)
plec (x:xs) | (x !! 9) `mod` 2 == 0 = (1,0) +. plec xs
            | otherwise = (0,1) +. plec xs

grudzien :: [[Int]] -> Int
grudzien [] = 0
grudzien (x:xs) | (x !! 2) == 1 && (x !! 3) == 2 = 1 + grudzien xs
                | otherwise = grudzien xs

infixl 6 +..
(+..) :: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int)
(a1, b1, c1, d1, e1, f1, g1, h1, i1, j1) +.. (a2, b2, c2, d2, e2, f2, g2, h2, i2, j2) = (a1 + a2, b1 + b2, c1 + c2, d1 + d2, e1 + e2, f1 + f2, g1 + g2, h1 + h2, i1 + i2, j1 + j2)

dekady :: [[Int]] -> (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int)
dekady [] = (0,0,0,0,0,0,0,0,0,0)
dekady (x:xs) | (x !! 0) == 0 = (1,0,0,0,0,0,0,0,0,0) +.. dekady xs
              | (x !! 0) == 1 = (0,1,0,0,0,0,0,0,0,0) +.. dekady xs
              | (x !! 0) == 2 = (0,0,1,0,0,0,0,0,0,0) +.. dekady xs
              | (x !! 0) == 3 = (0,0,0,1,0,0,0,0,0,0) +.. dekady xs
              | (x !! 0) == 4 = (0,0,0,0,1,0,0,0,0,0) +.. dekady xs
              | (x !! 0) == 5 = (0,0,0,0,0,1,0,0,0,0) +.. dekady xs
              | (x !! 0) == 6 = (0,0,0,0,0,0,1,0,0,0) +.. dekady xs
              | (x !! 0) == 7 = (0,0,0,0,0,0,0,1,0,0) +.. dekady xs
              | (x !! 0) == 8 = (0,0,0,0,0,0,0,0,1,0) +.. dekady xs
              | (x !! 0) == 9 = (0,0,0,0,0,0,0,0,0,1) +.. dekady xs
              | otherwise = dekady xs

dekady2list :: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> [Int]
dekady2list (a, b, c, d, e, f, g, h, i, j) = [a, b, c, d, e, f, g, h, i, j]

pesel = 
   do [f] <- getArgs
      s <- readFile f
      let pesele = divideFile s ""
      let cyfry_pesele = dividePesele pesele
      let podzial_plci = plec cyfry_pesele
      putStrLn ("Kobiet: " ++ show (fst podzial_plci))
      putStrLn ("Mezczyzn: " ++ show (snd podzial_plci))
      let osoby_grudzien = grudzien cyfry_pesele
      putStrLn ("Osoby urodzone w grudniu: " ++ show osoby_grudzien)
      let osoby_dekady = dekady2list (dekady cyfry_pesele)
      putStrLn ("Liczba osob urodzona w poszczegolnych dekadach: " ++ show osoby_dekady)
