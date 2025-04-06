module Main
where

import System.Environment
import Data.Char

{-
Proponowane nazwy plików Ÿród³owych:

lab6.1.1.hs
lab6.1.2.hs
lab6.1.3.hs

Jeœli nazwa sk³ada siê z kropki, nale¿y dodaæ rozszerzenie .hs podczas zapisywania.
Je¿eli nie zaznaczono inaczej, pozosta³e zadania powinny byæ zgodne z tym schematem nazewnictwa.
-}

-- 6.1

{-
ghci> :t putStrLn
putStrLn :: String -> IO ()
ghci> :t readLn
readLn :: Read a => IO a
ghci> :t getLine
getLine :: IO String
ghci> :t print
print :: Show a => a -> IO ()
ghci> :t read
read :: Read a => String -> a
ghci> :t show
show :: Show a => a -> String
-}

silnia :: Int -> Int
silnia n | n == 0 = 1
         | n > 0 = n * silnia (n - 1)

silnia1 =
     do putStrLn "Enter natural number: "
        k <- readLn                        -- 1
        let result = silnia k              -- 2
        print result                       -- 3

{-
ghci> silnia1
Enter natural number:
5
120
-}

silnia2 =
     do putStrLn "Enter natural number: "
        k <- readLn                        -- 1
        print (silnia k)                   -- 2

{-
ghci> silnia2
Enter natural number:
5
120
-}

silnia3 =
     do putStrLn "Enter natural number: "
        k <- getLine                       -- 1
        let result = silnia (read k)       -- 2
        putStrLn (show result)             -- 3

{-
ghci> silnia3
Enter natural number:
5
120
-}

silnia4 =
     do putStrLn "Enter natural number: "
        k <- getLine                       -- 1
        putStrLn (show (silnia (read k)))  -- 2

{-
ghci> silnia4
Enter natural number:
5
120
-}

{-
Napisz program, który przedstawia wynik w postaci:

Enter natural number:
5
5! = 120
-}

silnia5 =
     do putStrLn "Enter natural number: "
        k <- getLine                           -- 1
        let result = silnia (read k)           -- 2
        putStrLn (k ++ "! = " ++ show result)  -- 3

{-
ghci> silnia5
Enter natural number:
5
5! = 120
-}

-- 6.2

{-
ghci> :t readFile
readFile :: FilePath -> IO String
ghci> :t writeFile
writeFile :: FilePath -> String -> IO ()
ghci> :m +System.Environment
ghci> :t getArgs
getArgs :: IO [String]
-}

{-
Ile argumentów przyjmuje funkcja readFile?
Funkcja readFile przyjmuje 1 argument.

Ile argumentów przyjmuje funkcja writeFile?
Funkcja writeFile przyjmuje 2 argumenty.

Ile argumentów przyjmuje funkcja getArgs?
Funkcja getArgs przyjmuje 0 argumentów.


Jaki jest typ wyniku funkcji readFile?
Typ wyniku funkcji readFile to Monada IO String.

Jaki jest typ wyniku funkcji writeFile?
Typ wyniku funkcji writeFile to Monada IO () [Void].

Jaki jest typ wyniku funkcji getArgs?
Typ wyniku funkcji getArgs to Monada IO [String].
-}

{-
main =
  do [f,g] <- getArgs
     s <- readFile f
     writeFile g s
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:13                 0 6_2_wyjscie.txt
               2 File(s)             27 bytes
               0 Dir(s)  1 662 405 181 440 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_2_wejscie.txt
Ala ma kota :)
Kot ma Ale!
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_2_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_2_wejscie.txt 6_2_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
               2 File(s)             54 bytes
               0 Dir(s)  1 662 407 860 224 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_2_wejscie.txt
Ala ma kota :)
Kot ma Ale!
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_2_wyjscie.txt
Ala ma kota :)
Kot ma Ale!
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}

-- 6.3

{-
ghci> 'a' == 'a'
True
ghci> 'A' == 'a'
False
ghci> 'c' : "at"
"cat"
ghci> let f (x:xs) = (x,xs)
ghci> f "cat"
('c',"at")
-}

{-
Rozwa¿ dwie ga³êzie funkcji clear z flagami:

False - Do wywo³ania, jeœli bie¿¹cy znak znajduje siê poza znacznikiem html.
True  - Do wywo³ania, jeœli bie¿¹cy znak znajduje siê wewn¹trz znacznika html.
-}

clear :: String -> Bool -> String
clear [] b = []
clear (x:xs) b | x == '<' = clear xs True
               | x == '>' = clear xs False
               | b = clear xs b
               | not b = x : clear xs b

{-
clear :: String -> Bool -> String
clear ...
clear ... False | Jeœli otrzymamy '<', to pomijamy go i zmieniamy tryb dzia³ania.
                | W przeciwnym razie dodajemy bie¿¹cy znak do wyniku i kontynuujemy.
clear ... True  | Jeœli otrzymamy '>', to pomijamy go i zmieniamy tryb dzia³ania.
                | W przeciwnym razie pomijamy bie¿¹cy znak i kontynuujemy.
-}

{-
main =
  do [f,g] <- getArgs
     s <- readFile f
     let clear_html = clear s False
     writeFile g clear_html
-}

{-
ghci> clear "" False
""
ghci> clear "" True
""
ghci> clear "It is a sentence." False
"It is a sentence."
ghci> clear "It is a sentence." True
""
ghci> clear "<p>It is a paragraph." False
"It is a paragraph."
ghci> clear "<p>It is a paragraph." True
"It is a paragraph."
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt *.html
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:19                 0 6_3_wyjscie.txt
03.04.2025  10:19                 0 6_3_wyjscie_v2.txt

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

12.03.2025  19:02               380 6_3_wejscie.html
               5 File(s)            434 bytes
               0 Dir(s)  1 662 405 689 344 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wejscie.html
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk+éadowy plik HTML</p><p>Tu jest przyk+éadowy tekst</p>
    <button>Kliknij mnie</button>
</body>

</html>
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_3_wejscie.html 6_3_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt *.html
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:19                 0 6_3_wyjscie_v2.txt

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

12.03.2025  19:02               380 6_3_wejscie.html
               5 File(s)            603 bytes
               0 Dir(s)  1 662 405 591 040 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wejscie.html
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk+éadowy plik HTML</p><p>Tu jest przyk+éadowy tekst</p>
    <button>Kliknij mnie</button>
</body>

</html>
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wyjscie.txt






    Strona internetowa



    Witaj na stronie internetowej
    To jest przyk+éadowy plik HTMLTu jest przyk+éadowy tekst
    Kliknij mnie



C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}

clear' :: String -> Bool -> String
clear' [] b = []
clear' (x:xs) b | x == '>' && length xs >= 1 && (xs !! 0) == '\n' = clear' xs True
                | x == '<' = clear' xs True
                | x == '>' = clear' xs False
                | b = clear' xs b
                | not b && length xs >= 1 && (xs !! 0) == '<' = x : '\n' : clear' xs b
                | not b = x : clear' xs b

{-
main = 
  do [f,g] <- getArgs
     s <- readFile f
     let clear_html = clear' s False
     writeFile g clear_html
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt *.html
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:19                 0 6_3_wyjscie_v2.txt

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

12.03.2025  19:02               380 6_3_wejscie.html
               5 File(s)            603 bytes
               0 Dir(s)  1 662 405 943 296 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wejscie.html
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk+éadowy plik HTML</p><p>Tu jest przyk+éadowy tekst</p>
    <button>Kliknij mnie</button>
</body>

</html>
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wyjscie_v2.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_3_wejscie.html 6_3_wyjscie_v2.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt *.html
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:24               125 6_3_wyjscie_v2.txt

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

12.03.2025  19:02               380 6_3_wejscie.html
               5 File(s)            728 bytes
               0 Dir(s)  1 662 405 955 584 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wejscie.html
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona internetowa</title>
</head>

<body>
    <h1>Witaj na stronie internetowej</h1>
    <p>To jest przyk+éadowy plik HTML</p><p>Tu jest przyk+éadowy tekst</p>
    <button>Kliknij mnie</button>
</body>

</html>
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_3_wyjscie_v2.txt
Strona internetowa
Witaj na stronie internetowej
To jest przyk+éadowy plik HTML
Tu jest przyk+éadowy tekst
Kliknij mnie

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}

-- 6.4

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort xs | len <= 1 = xs
             | otherwise = merge (mergeSort ys) (mergeSort zs)
               where len = length xs
                     half = len `div` 2
                     ys = take half xs
                     zs = drop half xs

{-
main =
  do [f,g] <- getArgs
     s <- readFile f
     let lines_tekst = lines s
     let sort = mergeSort lines_tekst
     let unlines_tekst = unlines sort
     writeFile g unlines_tekst
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:24               125 6_3_wyjscie_v2.txt
03.04.2025  10:40               147 6_4_wejscie.txt
03.04.2025  10:40                 0 6_4_wyjscie.txt
               6 File(s)            495 bytes
               0 Dir(s)  1 662 393 069 568 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_4_wejscie.txt
Ala ma kota
Kot ma Ale
Ale to wszystko si¦Ö tutaj rozgrywa
Taka to ju+- jest rozgrywka
Kotek +éapie Ale
Hania +éapie Kotka
Ala +éapie Hanie

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_4_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe 6_4_wejscie.txt 6_4_wyjscie.txt

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:24               125 6_3_wyjscie_v2.txt
03.04.2025  10:40               147 6_4_wejscie.txt
03.04.2025  10:41               147 6_4_wyjscie.txt
               6 File(s)            642 bytes
               0 Dir(s)  1 662 393 069 568 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_4_wejscie.txt
Ala ma kota
Kot ma Ale
Ale to wszystko si¦Ö tutaj rozgrywa
Taka to ju+- jest rozgrywka
Kotek +éapie Ale
Hania +éapie Kotka
Ala +éapie Hanie

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_4_wyjscie.txt
Ala ma kota
Ala +éapie Hanie
Ale to wszystko si¦Ö tutaj rozgrywa
Hania +éapie Kotka
Kot ma Ale
Kotek +éapie Ale
Taka to ju+- jest rozgrywka

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}

-- 6.5

search :: [[Char]] -> [Char] -> Int -> [Int]
search [] s i = []
search (y:ys) s i | y == s = [i] ++ search ys s i
                  | otherwise = search ys s i

searchWord :: [[Char]] -> [Char] -> Int -> [Int]
searchWord [] s i = []
searchWord (x:xs) s i = (search ys s i) ++ (searchWord xs s (i + 1))
                        where ys = words x

{-
main =
  do [f,g] <- getArgs
     let slowo = f
     s <- readFile g
     let lines_tekst = lines s
     let linie_slowa = searchWord lines_tekst slowo 1
     print(linie_slowa)
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>dir *.txt
 Volume in drive C has no label.
 Volume Serial Number is ECD1-84F5

 Directory of C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6

03.04.2025  10:13                27 6_2_wejscie.txt
03.04.2025  10:14                27 6_2_wyjscie.txt
03.04.2025  10:21               169 6_3_wyjscie.txt
03.04.2025  10:24               125 6_3_wyjscie_v2.txt
03.04.2025  10:40               147 6_4_wejscie.txt
03.04.2025  10:41               147 6_4_wyjscie.txt
12.03.2025  20:30               131 6_5_wejscie.txt
               7 File(s)            773 bytes
               0 Dir(s)  1 662 400 716 800 bytes free

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>type 6_5_wejscie.txt
Ala ma kota Mruczka
Mruczek lubi mleko
Mleko si¦Ö rozla+éo
Ale Mruczek wyliza+é mleko
Teraz kot +éapie Ale
A Ala +éapie kota

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

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}

-- 6.6

{-
ghci> :t elem
elem :: (Foldable t, Eq a) => a -> t a -> Bool
ghci> elem 1 [1,3,5]
True
ghci> elem 2 [1,3,5]
False
ghci> let f [a,b,_] = (a, b)
ghci> f "cat"
('c','a')
ghci> f "zonk"
*** Exception: <interactive>:4:5-22: Non-exhaustive patterns in function f

ghci> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

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

womenCount' :: [[Char]] -> Int
womenCount' [] = 0
womenCount' (x:xs) | (read [x !! 9]) `mod` 2 == 0 = 1 + womenCount' xs
                   | otherwise = womenCount' xs

womenCount'' :: [[Char]] -> Int
womenCount'' [] = 0
womenCount'' (x:xs) | (digitToInt (x !! 9)) `mod` 2 == 0 = 1 + womenCount'' xs
                    | otherwise = womenCount'' xs

{-
Jaki jest typ funkcji womenCount?
Typ funkcji womenCount to [[Char]] -> Int.
-}

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

{-
Jak przekonwertowaæ character na string?
Aby przekonwertowaæ character na string nale¿y u¿yæ konwersji c = [c].

Jak przekonwertowaæ string na character?
Aby przekonwertowaæ string na character nale¿y u¿yæ konwersji [c] = c.


Jaki jest typ funkcji decCount?
Typ funkcji decCount to [[Char]] -> [Int] -> [Int].

Jaki jest typ parametrów a i b?
Typ parametrów a i b to Char.

Jaki jest typ wyra¿enia [a,b]?
Typ wyra¿enia [a,b] to [Char].


Jaki jest cel drugiego argumentu funkcji decCount?
Cel drugiego argumentu funkcji decCount to zliczanie osób urodzonych w poszczególnych dekadach.
-}

main =
  do [f] <- getArgs
     s <- readFile f
     let pesele = divideFile s ""
     let liczba_kobiet_1 = womenCount pesele
     let liczba_kobiet_2 = womenCount' pesele
     let liczba_kobiet_3 = womenCount'' pesele
     putStrLn ("Liczba kobiet (womenCount): " ++ show liczba_kobiet_1)
     putStrLn ("Liczba kobiet (womenCount'): " ++ show liczba_kobiet_2)
     putStrLn ("Liczba kobiet (womenCount''): " ++ show liczba_kobiet_3)
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

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>ghc --make lab6.hs -o lab6
[1 of 2] Compiling Main             ( lab6.hs, lab6.o ) [Source file changed]
[2 of 2] Linking lab6.exe [Objects changed]

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>lab6.exe pesel.txt
Liczba kobiet (womenCount): 74
Liczba kobiet (womenCount'): 74
Liczba kobiet (womenCount''): 74

Liczba osob urodzone w grudniu: 20

Liczba osob urodzona w poszczegolnych dekadach:
1901 - 1910: 0
1911 - 1920: 0
1921 - 1930: 0
1931 - 1940: 0
1941 - 1950: 3
1951 - 1960: 21
1961 - 1970: 30
1971 - 1980: 32
1981 - 1990: 60
1991 - 2000: 4

C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab6>
-}
