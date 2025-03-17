module Main
where

import System.Environment

-- 6.1

silnia :: Int -> Int
silnia n | n == 0 = 1
         | n > 0 = n * silnia (n - 1)

{-
main =
  do putStrLn "Enter natural number: "
     k <- readLn                       -- 1
     let result = silnia k             -- 2
     print result                      -- 3
-}

{-
ghci> main
Enter natural number:
4
24
-}

{-
main =
  do putStrLn "Enter natural number: "
     k <- readLn                       -- 1
     print (silnia k)                  -- 2
-}

{-
ghci> main
Enter natural number:
4
24
-}

{-
main =
  do putStrLn "Enter natural number: "
     k <- getLine                      -- 1
     let result = silnia (read k)      -- 2
     putStrLn (show result)            -- 3
-}

{-
ghci> main
Enter natural number:
4
24
-}

-- 6.2

{-
main = do
       [f,g] <- getArgs
       s <- readFile f
       writeFile g s
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_2_wejscie.txt 6_2_wyjscie.txt

6_2_wejscie.txt:
"
Ala ma kota :)
Kot ma Ale!
"

6_2_wyjscie.txt przed:
"
"

6_2_wyjscie.txt po:
"
Ala ma kota :)
Kot ma Ale!
"
-}

-- 6.3

{-
clear :: String -> Bool -> String
clear [] b = []
clear (x:xs) b | x == '<' = clear xs True
               | x == '>' = clear xs False
               | b = clear xs b
               | not b = x : clear xs b
-}

{-
main = do
       [f,g] <- getArgs
       s <- readFile f
       let clear_html = clear s False
       writeFile g clear_html
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_3_wejscie.html 6_3_wyjscie.txt

6_3_wejscie.html:
"
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk³adowy plik HTML</p>
    <button>Kliknij mnie</button>
</body>

</html>
"

6_3_wyjscie.txt przed:
"
"

6_3_wyjscie.txt po:
"






    Strona internetowa



    Witaj na stronie internetowej
    To jest przyk³adowy plik HTML
    Kliknij mnie



"
-}

{-
clear' :: String -> Bool -> String
clear' [] b = []
clear' (x:xs) b | x == '>' && length xs >= 1 && (xs !! 0) == '\n' = clear' xs True
                | x == '<' = clear' xs True
                | x == '>' = clear' xs False
                | b = clear' xs b
                | not b && length xs >= 1 && (xs !! 0) == '<' = x : '\n' : clear' xs b
                | not b = x : clear' xs b
-}

{-
main = do
       [f,g] <- getArgs
       s <- readFile f
       let clear_html = clear' s False
       writeFile g clear_html
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_3_wejscie.html 6_3_wyjscie.txt

6_3_wejscie.html:
"
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk³adowy plik HTML</p>
    <button>Kliknij mnie</button>
</body>

</html>
"

6_3_wyjscie.txt przed:
"
"

6_3_wyjscie.txt po:
"
Strona internetowa
Witaj na stronie internetowej
To jest przyk³adowy plik HTML
Tu jest przyk³adowy tekst
Kliknij mnie

"
-}

-- 6.4

{-
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys
-}

{-
mergeSort :: Ord a => [a] -> [a]
mergeSort xs | len <= 1 = xs
             | otherwise = merge (mergeSort ys) (mergeSort zs)
               where len = length xs
                     half = len `div` 2
                     ys = take half xs
                     zs = drop half xs
-}

{-
main = do
       [f,g] <- getArgs
       s <- readFile f
       let lines_tekst = lines s
       let sort = mergeSort lines_tekst
       let unlines_tekst = unlines sort
       writeFile g unlines_tekst
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_4_wejscie.txt 6_4_wyjscie.txt

6_4_wejscie.txt:
"
Ala ma kota :)
Kot ma Ale
Ale to wszystko siê tutaj rozgrywa
Taka to ju¿ jest rozgrywka
Kotek ³apie Ale
Hania ³apie Kotka
Ala ³apie Hanie

"

6_4_wyjscie.txt przed:
"
"

6_4_wyjscie.txt po:
"
Ala ma kota :)
Ala ³apie Hanie
Ale to wszystko siê tutaj rozgrywa
Hania ³apie Kotka
Kot ma Ale
Kotek ³apie Ale
Taka to ju¿ jest rozgrywka

"
-}

-- 6.5

{-
search :: [[Char]] -> [Char] -> Int -> [Int]
search [] s i = []
search (y:ys) s i | y == s = [i] ++ search ys s i
                  | otherwise = search ys s i
-}

{-
searchWord :: [[Char]] -> [Char] -> Int -> [Int]
searchWord [] s i = []
searchWord (x:xs) s i = (search ys s i) ++ (searchWord xs s (i + 1))
                        where ys = words x
-}

{-
main = do
       [f,g] <- getArgs
       let slowo = f
       s <- readFile g
       let lines_tekst = lines s
       let linie_slowa = searchWord lines_tekst slowo 1
       print(linie_slowa)
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe Mruczek 6_5_wejscie.txt
[2,4]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe Ala 6_5_wejscie.txt
[1,6]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe kot 6_5_wejscie.txt
[5]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe kotek 6_5_wejscie.txt
[]

6_5_wejscie.txt:
"
Ala ma kota Mruczka
Mruczek lubi mleko
Mleko siê rozla³o
Ale Mruczek wyliza³ mleko
Teraz kot ³apie Ale
A Ala ³apie kota

"
-}

-- 6.6

{-
divideFile :: [Char] -> [Char] -> [[Char]]
divideFile [] _ = []
divideFile (x:xs) s | x == '\n' = [take 11 word] ++ divideFile xs []
                    | xs == [] = [word] ++ divideFile xs []
                    | otherwise = divideFile xs word
                      where word = s ++ [x]
-}

{-
dividePesel :: [Char] -> [Int]
dividePesel [] = []
dividePesel (x:xs) = [read [x] :: Int] ++ dividePesel xs
-}

{-
dividePesele :: [[Char]] -> [[Int]]
dividePesele [] = []
dividePesele (x:xs) = [dividePesel x] ++ dividePesele xs
-}

{-
infixl 6 +.
(+.) :: (Int, Int) -> (Int, Int) -> (Int, Int)
(a, b) +. (c, d) = (a + c, b + d)
-}

{-
plec :: [[Int]] -> (Int, Int)
plec [] = (0,0)
plec (x:xs) | (x !! 9) `mod` 2 == 0 = (1,0) +. plec xs
            | otherwise = (0,1) +. plec xs
-}

{-
grudzien :: [[Int]] -> Int
grudzien [] = 0
grudzien (x:xs) | (x !! 2) == 1 && (x !! 3) == 2 = 1 + grudzien xs
                | otherwise = grudzien xs
-}

{-
infixl 6 +..
(+..) :: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int)
(a1, b1, c1, d1, e1, f1, g1, h1, i1, j1) +.. (a2, b2, c2, d2, e2, f2, g2, h2, i2, j2) = (a1 + a2, b1 + b2, c1 + c2, d1 + d2, e1 + e2, f1 + f2, g1 + g2, h1 + h2, i1 + i2, j1 + j2)
-}

{-
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
-}

{-
dekady2list :: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> [Int]
dekady2list (a, b, c, d, e, f, g, h, i, j) = [a, b, c, d, e, f, g, h, i, j]
-}

{-
main = do
       [f] <- getArgs
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
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe pesel.txt
Kobiet: 74
Mezczyzn: 76
Osoby urodzone w grudniu: 20
Liczba osob urodzona w poszczegolnych dekadach: [0,0,0,0,0,22,28,36,58,6]
-}
