import Data.Char

-- Zadanie 1
{-
Podaj rekurencyjne implementacje nastêpuj¹cych funkcji:
 1. sp' wylicza: sp'(n) = 2 + 4 + 6 + ... + 2n
 2. ip' wylicza: ip'(n) = 2 * 4 * 6 * ... * 2n
 3. sn' wylicza: sn'(n) = 1 + 3 + 5 + ... + 2n-1
 4. in' wylicza: in'(n) = 1 * 3 * 5 * ... * 2n-1
-}

sp' :: Int -> Int
sp' n | n  < 1 = 0
      | n == 1 = i
      | n  > 1 = i + sp' (n - 1)
        where i = 2*n

{-
ghci> sp' 0
0
ghci> sp' 1
2
ghci> sp' 2
6
ghci> sp' 3
12
ghci> sp' 4
20
ghci> sp' 5
30
-}

ip' :: Int -> Int
ip' n | n  < 1 = 0
      | n == 1 = i
      | n  > 1 = i * ip' (n - 1)
        where i = 2*n

{-
ghci> ip' 0
0
ghci> ip' 1
2
ghci> ip' 2
8
ghci> ip' 3
48
ghci> ip' 4
384
ghci> ip' 5
3840
-}

sn' :: Int -> Int
sn' n | n  < 1 = 0
      | n == 1 = i
      | n  > 1 = i + sn' (n - 1)
        where i = 2*n - 1

{-
ghci> sn' 0
0
ghci> sn' 1
1
ghci> sn' 2
4
ghci> sn' 3
9
ghci> sn' 4
16
ghci> sn' 5
25
-}

in' :: Int -> Int
in' n | n  < 1 = 0
      | n == 1 = i
      | n  > 1 = i * in' (n - 1)
        where i = 2*n - 1

{-
ghci> in' 0
0
ghci> in' 1
1
ghci> in' 2
3
ghci> in' 3
15
ghci> in' 4
105
ghci> in' 5
945
-}



-- Zadanie 2
{-
Zaimplementuj poni¿sze funkcje z wykorzystaniem list:
 1. sp'' wylicza: sp''(n) = 2 + 4 + 6 + ... + 2n
 2. ip'' wylicza: ip''(n) = 2 * 4 * 6 * ... * 2n
 3. sn'' wylicza: sn''(n) = 1 + 3 + 5 + ... + 2n-1
 4. in'' wylicza: in''(n) = 1 * 3 * 5 * ... * 2n-1
-}

sp'' :: Int -> Int
sp'' n = sum [2*x | x <- [1..n]]

{-
ghci> sp'' 0
0
ghci> sp'' 1
2
ghci> sp'' 2
6
ghci> sp'' 3
12
ghci> sp'' 4
20
ghci> sp'' 5
30
-}

ip'' :: Int -> Int
ip'' n = product [2*x | x <- [1..n]]

{-
ghci> ip'' 0
1
ghci> ip'' 1
2
ghci> ip'' 2
8
ghci> ip'' 3
48
ghci> ip'' 4
384
ghci> ip'' 5
3840
-}

sn'' :: Int -> Int
sn'' n = sum [2*x - 1 | x <- [1..n]]

{-
ghci> sn'' 0
0
ghci> sn'' 1
1
ghci> sn'' 2
4
ghci> sn'' 3
9
ghci> sn'' 4
16
ghci> sn'' 5
25
-}

in'' :: Int -> Int
in'' n = product [2*x - 1 | x <- [1..n]]

{-
ghci> in'' 0
1
ghci> in'' 1
1
ghci> in'' 2
3
ghci> in'' 3
15
ghci> in'' 4
105
ghci> in'' 5
945
-}



-- Zadanie 3
{-
Podaj rekurencyjne implementacje nastêpuj¹cych funkcji:
 1. suma'1 wylicza: suma od 1 do n liczb postaci 1/i
 2. suma'2 wylicza: suma od 1 do n liczb postaci 1/(i^2)
 3. suma'3 wylicza: suma od 1 do n liczb postaci (sqrt i)-1/i
 4. iloczyn'1 wylicza: iloczyn od 1 do n liczb postaci (1+i)/(2+i)
 5. iloczyn'2 wylicza: iloczyn od 1 do n liczb postaci (i+1)/(i^3)
-}

suma'1 :: Int -> Double
suma'1 n | n < 1 = 0
         | otherwise = 1/i + suma'1 (n - 1)
           where i = fromIntegral n

{-
ghci> suma'1 0
0.0
ghci> suma'1 1
1.0
ghci> suma'1 2
1.5
ghci> suma'1 3
1.8333333333333333
ghci> suma'1 4
2.083333333333333
ghci> suma'1 5
2.283333333333333
ghci> suma'1 50
4.499205338329423
ghci> suma'1 500
6.79282342999052
-}

suma'2 :: Int -> Double
suma'2 n | n < 1 = 0
         | otherwise = 1/(i^2) + suma'2 (n - 1)
           where i = fromIntegral n

{-
ghci> suma'2 0
0.0
ghci> suma'2 1
1.0
ghci> suma'2 2
1.25
ghci> suma'2 3
1.3611111111111112
ghci> suma'2 4
1.4236111111111112
ghci> suma'2 5
1.4636111111111112
ghci> suma'2 50
1.625132733621529
ghci> suma'2 500
1.642936065514894
-}

suma'3 :: Int -> Double
suma'3 n | n < 1 = 0
         | otherwise = (sqrt i)-(1/i) + suma'3 (n - 1)
           where i = fromIntegral n

{-
ghci> suma'3 0
0.0
ghci> suma'3 1
0.0
ghci> suma'3 2
0.9142135623730951
ghci> suma'3 3
2.312931036608639
ghci> suma'3 4
4.062931036608639
ghci> suma'3 5
6.098999014108428
ghci> suma'3 50
234.53659526519138
ghci> suma'3 500
7457.741418621717
-}

iloczyn'1 :: Int -> Double
iloczyn'1 n | n < 1 = 1
            | otherwise = (1+i)/(2+i) * iloczyn'1 (n - 1)
              where i = fromIntegral n

{-
ghci> iloczyn'1 0
1.0
ghci> iloczyn'1 1
0.6666666666666666
ghci> iloczyn'1 2
0.5
ghci> iloczyn'1 3
0.4
ghci> iloczyn'1 4
0.33333333333333337
ghci> iloczyn'1 5
0.28571428571428575
ghci> iloczyn'1 50
3.846153846153846e-2
ghci> iloczyn'1 500
3.984063745019925e-3
-}

iloczyn'2 :: Int -> Double
iloczyn'2 n | n < 1 = 1
            | otherwise = (i+1)/(i^3) * iloczyn'2 (n - 1)
              where i = fromIntegral n

{-
ghci> iloczyn'2 0
1.0
ghci> iloczyn'2 1
2.0
ghci> iloczyn'2 2
0.75
ghci> iloczyn'2 3
0.1111111111111111
ghci> iloczyn'2 4
8.680555555555556e-3
ghci> iloczyn'2 5
4.166666666666667e-4
ghci> iloczyn'2 50
5.513411796832546e-128
ghci> iloczyn'2 500
0.0
-}



-- Zadanie 4
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji root zwracaj¹cej wartoœæ 
na korzeniu drzewa binarnego: root :: Tree t -> t.
Dla drzewa pustego funkcja root ma wyrzucaæ wyj¹tek:
"there is no root in empty tree".
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))

root :: Tree t -> t
root (Null) = error "there is no root in empty tree"
root (Leaf x) = x
root (Node x left right) = x

{-
ghci> root Null
*** Exception: there is no root in empty tree
CallStack (from HasCallStack):
  error, called at kolos6.hs:331:15 in main:Main
ghci> root (Leaf 5)
5
ghci> root (Node 3 (Leaf 1) (Leaf 5))
3
ghci> root bt1
7
ghci> root bt2
7
-}



-- Zadanie 5
{-
Zdefiniuj w dwóch wersjach funkcjê, która zamienia 
na liczbê znak przechowuj¹cy cyfrê.
cyfra'1 :: Char -> Int
cyfra'2 :: Char -> Int
 1. cyfra'1 - wykorzystaæ funkcjê read :: Read a => String -> a
 2. cyfra'2 - wykorzystaæ funkcjê ord :: Char -> Int z modu³u Data.Char
Je¿eli podany znak nie przechowuje cyfry, to funkcje 
maj¹ wyrzucaæ wyj¹tek "not a digit".
-}

cyfra'1 :: Char -> Int
cyfra'1 x | elem x "0123456789" = read [x]
          | otherwise = error "not a digit"

{-
ghci> cyfra'1 '3'
3
ghci> cyfra'1 '?'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos6.hs:368:25 in main:Main
ghci> cyfra'1 'd'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos6.hs:368:25 in main:Main
-}

cyfra'2 :: Char -> Int
cyfra'2 x | isDigit x = ord x - ord '0'
          | otherwise = error "not a digit"

{-
ghci> cyfra'2 '3'
3
ghci> cyfra'2 '?'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos6.hs:381:25 in main:Main
ghci> cyfra'2 'd'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos6.hs:381:25 in main:Main
-}



-- Zadanie 6
{-
Zdefiniuj w dwóch wersjach funkcjê, która wyszukuje 
najmniejszy element listy.
 1. min'1 :: Ord b => [b] -> b - rekurencyjnie, 
    gdy pusta lista to wyj¹tek: empty list
 2. min'2 :: Ord b => [b] -> b - wykorzystaæ funkcje 
    foldl lub foldr oraz min
-}

min'1 :: Ord b => [b] -> b
min'1 [] = error "empty list"
min'1 [x] = x
min'1 (x1:x2:xs) | x1 < x2 = min'1 (x1:xs)
                 | otherwise = min'1 (x2:xs)

{-
ghci> min'1 []
*** Exception: empty list
CallStack (from HasCallStack):
  error, called at kolos6.hs:413:12 in main:Main
ghci> min'1 [7]
7
ghci> min'1 [7,5]
5
ghci> min'1 [5,7]
5
ghci> min'1 [2,9,4]
2
ghci> min'1 [4,9,2]
2
ghci> min'1 [4,9,2,1,-4,7,3,8]
-4
-}

min'2 :: Ord b => [b] -> b
min'2 [] = error "empty list"
min'2 xs = foldr (min) (xs !! 0) xs

{-
ghci> min'2 []
*** Exception: empty list
CallStack (from HasCallStack):
  error, called at kolos6.hs:438:12 in main:Main
ghci> min'2 [7]
7
ghci> min'2 [7,5]
5
ghci> min'2 [5,7]
5
ghci> min'2 [2,9,4]
2
ghci> min'2 [4,9,2]
2
ghci> min'2 [4,9,2,1,-4,7,3,8]
-4
-}



-- Zadanie 7
{-
Zdefiniuj funkcjê, która sprawdza, czy liczba ca³kowita 
reprezentuje liczbê binarn¹.
binary :: Int -> Bool
binary x | isBin x = True
         | otherwise = /* ... */
           where isBin x = x == 0 || abs x == 1
Wskazówka: W implementacji u¿yj funkcji quot oraz rem.
-}

binary :: Int -> Bool
binary x | isBin x = True
         | x < 0 = binary (-x)
         | r == 0 || r == 1 = binary q
         | otherwise = False
           where isBin x = x == 0 || abs x == 1
                 q = quot x 10
                 r = rem x 10

{-
ghci> binary 0
True
ghci> binary 1
True
ghci> binary 2
False
ghci> binary 3
False
ghci> binary 10
True
ghci> binary 11
True
ghci> binary 12
False
ghci> binary 100
True
ghci> binary 101
True
ghci> binary 102
False
ghci> binary 110
True
ghci> binary 111
True
ghci> binary 112
False
ghci> binary 1000
True
ghci> binary (-1000)
True
-}



-- Zadanie 8
{-
Zdefiniuj funkcjê, która konwertuje liczbê dziesiêtn¹ 
na liczbê binarn¹.
dec2bin :: Int -> Int
dec2bin x | x == 0 || abs x == 1 = x
          | /* ... */
Wskazówka: W implementacji u¿yj funkcji quot oraz rem.
-}

dec2bin :: Int -> Int
dec2bin x | x == 0 || abs x == 1 = x
          | otherwise = r + 10 * dec2bin q
            where q = quot x 2
                  r = rem x 2

{-
ghci> dec2bin 0
0
ghci> dec2bin 1
1
ghci> dec2bin 2
10
ghci> dec2bin 3
11
ghci> dec2bin 4
100
ghci> dec2bin 5
101
ghci> dec2bin 6
110
ghci> dec2bin 7
111
ghci> dec2bin 8
1000
ghci> dec2bin 13
1101
-}



-- Zadanie 9
{-
Zdefiniuj funkcjê, która konwertuje liczbê dziesiêtn¹ 
na liczbê binarn¹.
bin2dec :: Int -> Int
bin2dec x | x == 0 || abs x == 1 = x
          | /* ... */
Wskazówka: W implementacji u¿yj funkcji quot oraz rem.
-}

bin2dec :: Int -> Int
bin2dec x | x == 0 || abs x == 1 = x
          | otherwise = r + 2 * bin2dec q
            where q = quot x 10
                  r = rem x 10

{-
ghci> bin2dec 0
0
ghci> bin2dec 1
1
ghci> bin2dec 10
2
ghci> bin2dec 11
3
ghci> bin2dec 100
4
ghci> bin2dec 101
5
ghci> bin2dec 110
6
ghci> bin2dec 111
7
ghci> bin2dec 1000
8
ghci> bin2dec 1101
13
-}
