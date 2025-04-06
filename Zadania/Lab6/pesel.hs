module Pesel
where

import Data.Char

divideFile :: [Char] -> [Char] -> [[Char]]
divideFile [] _ = []
divideFile (x:xs) s | x == '\n' = [take 11 word] ++ divideFile xs []
                    | xs == [] = [word] ++ divideFile xs []
                    | otherwise = divideFile xs word
                      where word = s ++ [x]

womenCount :: [[Char]] -> Int
womenCount [] = 0
womenCount (x:xs) | (ord (x !! 9) - ord '0') `mod` 2 == 0 = 1 + womenCount xs
                  | otherwise = womenCount xs

grudzien :: [[Char]] -> Int
grudzien [] = 0
grudzien (x:xs) | (x !! 2) == '1' && (x !! 3) == '2' = 1 + grudzien xs
                | otherwise = grudzien xs

decCount :: [[Char]] -> [Int] -> [Int]
decCount [] ds = ds
decCount ([a,b,_,_,_,_,_,_,_,_,_]:xs) [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
         | a == '0' && b == '0' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10 + 1]
         | a == '0' = decCount xs [d1 + 1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
         | a == '1' && b == '0' = decCount xs [d1 + 1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
         | a == '1' = decCount xs [d1,d2 + 1,d3,d4,d5,d6,d7,d8,d9,d10]
         | a == '2' && b == '0' = decCount xs [d1,d2 + 1,d3,d4,d5,d6,d7,d8,d9,d10]
         | a == '2' = decCount xs [d1,d2,d3 + 1,d4,d5,d6,d7,d8,d9,d10]
         | a == '3' && b == '0' = decCount xs [d1,d2,d3 + 1,d4,d5,d6,d7,d8,d9,d10]
         | a == '3' = decCount xs [d1,d2,d3,d4 + 1,d5,d6,d7,d8,d9,d10]
         | a == '4' && b == '0' = decCount xs [d1,d2,d3,d4 + 1,d5,d6,d7,d8,d9,d10]
         | a == '4' = decCount xs [d1,d2,d3,d4,d5 + 1,d6,d7,d8,d9,d10]
         | a == '5' && b == '0' = decCount xs [d1,d2,d3,d4,d5 + 1,d6,d7,d8,d9,d10]
         | a == '5' = decCount xs [d1,d2,d3,d4,d5,d6 + 1,d7,d8,d9,d10]
         | a == '6' && b == '0' = decCount xs [d1,d2,d3,d4,d5,d6 + 1,d7,d8,d9,d10]
         | a == '6' = decCount xs [d1,d2,d3,d4,d5,d6,d7 + 1,d8,d9,d10]
         | a == '7' && b == '0' = decCount xs [d1,d2,d3,d4,d5,d6,d7 + 1,d8,d9,d10]
         | a == '7' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8 + 1,d9,d10]
         | a == '8' && b == '0' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8 + 1,d9,d10]
         | a == '8' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9 + 1,d10]
         | a == '9' && b == '0' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9 + 1,d10]
         | a == '9' = decCount xs [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10 + 1]

pesel =
   do [f] <- getArgs
      s <- readFile f
      let pesele = divideFile s ""
      let liczba_kobiet = womenCount pesele
      putStrLn ("Liczba kobiet: " ++ show liczba_kobiet)
      let osoby_grudzien = grudzien pesele
      putStrLn ("\nLiczba osob urodzone w grudniu: " ++ show osoby_grudzien)
      let osoby_dekady = decCount pesele [0,0,0,0,0,0,0,0,0,0]
      putStrLn ("\nLiczba osob urodzona w poszczegolnych dekadach: ")
      putStrLn ("1901 - 1910: " ++ show (osoby_dekady !! 0))
      putStrLn ("1911 - 1920: " ++ show (osoby_dekady !! 1))
      putStrLn ("1921 - 1930: " ++ show (osoby_dekady !! 2))
      putStrLn ("1931 - 1940: " ++ show (osoby_dekady !! 3))
      putStrLn ("1941 - 1950: " ++ show (osoby_dekady !! 4))
      putStrLn ("1951 - 1960: " ++ show (osoby_dekady !! 5))
      putStrLn ("1961 - 1970: " ++ show (osoby_dekady !! 6))
      putStrLn ("1971 - 1980: " ++ show (osoby_dekady !! 7))
      putStrLn ("1981 - 1990: " ++ show (osoby_dekady !! 8))
      putStrLn ("1991 - 2000: " ++ show (osoby_dekady !! 9))
