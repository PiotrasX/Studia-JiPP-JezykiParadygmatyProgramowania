import Data.Char

-- 4.1

{-
ghci> :t map
map :: (a -> b) -> [a] -> [b]
ghci> map (^2) [1,3,5]
[1,9,25]
ghci> map (\x -> x*x) [1,3,5]
[1,9,25]
ghci> let f = (^2) in map f [1,3,5]
[1,9,25]
ghci> sum [1,3,5]
9
ghci> sqrt (sum [1,3,5])
3.0
-}

sumOfSquares' :: Num a => [a] -> a
sumOfSquares' x = sum (map (\x -> x*x) x)

{-
ghci> sumOfSquares' [1,3,5]
35
ghci> sumOfSquares' []
0
-}

{-
ghci> :t (:)
(:) :: a -> [a] -> [a]
ghci> 3:[]
[3]
ghci> 3:5:[]
[3,5]
ghci> 3:[5]
[3,5]
ghci> let f (x:xs) = (x, xs)
ghci> f [3,5,7]
(3,[5,7])
-}

sumOfSquares :: Num a => [a] -> a
sumOfSquares [] = 0
sumOfSquares (x:xs) = x^2 + sumOfSquares xs

{-
ghci> sumOfSquares [1,3,5]
35
ghci> sumOfSquares []
0
-}

-- 4.2

{-
Odd indexes are denoted with an asterisk.

           *     *
        0  1  2  3
list = [3, 5, 7, 9]
-}

{-
ghci> let f0 (x:xs) = x
ghci> let f1 (_:x:xs) = x
ghci> let f2 (_:_:x:xs) = x
ghci> f0 [3,5,7]
3
ghci> f1 [3,5,7]
5
ghci> f2 [3,5,7]
7
ghci> f0 []
*** Exception: <interactive>:3:5-17: Non-exhaustive patterns in function f0
-}

sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

{-
ghci> sum1 []
0
ghci> sum1 [3]
0
ghci> sum1 [3,5]
5
ghci> sum1 [3,5,7]
5
ghci> sum1 [3,5,7,9]
14
-}

{-
Przeanalizuj wywo³anie funkcji sum1 [3,5,7].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum1 [3,5,7] =                  * sum1 [3,5,7] = 5
  (_:x:xs) = [3,5,7]                (_:x:xs) = [3,5,7]
  _ = 3                             _ = 3
  x = 5                             x = 5
  xs = [7]                          xs = [7]
  = x + sum1 xs =                   = x + sum1 xs =
  = 5 + sum1 [7] =                  = 5 + sum1 [7] = 5 + 0 = 5

* sum1 [7] =                      * sum1 [7] = 0
  [_] = [7]                         [_] = [7]
  = 0                               = 0
-}

{-
Przeanalizuj wywo³anie funkcji sum1 [3,5,7,9].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum1 [3,5,7,9] =                * sum1 [3,5,7,9] = 14
  (_:x:xs) = [3,5,7,9]              (_:x:xs) = [3,5,7,9]
  _ = 3                             _ = 3
  x = 5                             x = 5
  xs = [7,9]                        xs = [7,9]
  = x + sum1 xs =                   = x + sum1 xs =
  = 5 + sum1 [7,9] =                = 5 + sum1 [7,9] = 5 + 9 = 14

* sum1 [7,9] =                    * sum1 [7,9] = 9
  (_:x:xs) = [7,9]                  (_:x:xs) = [7,9]
  _ = 7                             _ = 7
  x = 9                             x = 9
  xs = []                           xs = []
  = x + sum1 xs =                   = x + sum1 xs =
  = 9 + sum1 [] =                   = 9 + sum1 [] = 9 + 0 = 9

* sum1 [] =                       * sum1 [] = 0
  = 0                               = 0
-}

sum2 :: Num a => [a] -> a
sum2 [] = 0
sum2 [x] = x
sum2 (x:_:xs) = x + sum2 xs

{-
ghci> sum2 []
0
ghci> sum2 [3]
3
ghci> sum2 [3,5]
3
ghci> sum2 [3,5,7]
10
ghci> sum2 [3,5,7,9]
10
-}

{-
Przeanalizuj wywo³anie funkcji sum2 [3,5,7].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum2 [3,5,7] =                  * sum2 [3,5,7] = 10
  (x:_:xs) = [3,5,7]                (x:_:xs) = [3,5,7]
  x = 3                             x = 3
  _ = 5                             _ = 5
  xs = [7]                          xs = [7]
  = x + sum2 xs =                   = x + sum2 xs =
  = 3 + sum2 [7] =                  = 3 + sum2 [7] = 3 + 7 = 10

* sum2 [7] =                      * sum2 [7] = 7
  [x] = 7                           [x] = 7
  = 7                               = 7
-}

{-
Przeanalizuj wywo³anie funkcji sum2 [3,5,7,9].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum2 [3,5,7,9] =                * sum2 [3,5,7,9] = 10
  (x:_:xs) = [3,5,7,9]              (x:_:xs) = [3,5,7,9]
  x = 3                             x = 3
  _ = 5                             _ = 5
  xs = [7,9]                        xs = [7,9]
  = x + sum2 xs =                   = x + sum2 xs =
  = 3 + sum2 [7,9] =                = 3 + sum2 [7,9] = 3 + 7 = 10

* sum2 [7,9] =                    * sum2 [7,9] = 7
  (x:_:xs) = [7,9]                  (x:_:xs) = [7,9]
  x = 7                             x = 7
  _ = 9                             _ = 9
  xs = []                           xs = []
  = x + sum2 xs =                   = x + sum2 xs =
  = 7 + sum2 [] =                   = 7 + sum2 [] = 7 + 0 = 7

* sum2 [] =                       * sum2 [] = 0
  = 0                               = 0
-}

sum3 :: Num a => [a] -> a
sum3 [] = 0
sum3 [_] = 0
sum3 [_,_] = 0
sum3 [_,_,_] = 0
sum3 (_:_:_:x:xs) = x + sum3 (x : xs)

{-
ghci> sum3 []
0
ghci> sum3 [0]
0
ghci> sum3 [0,1]
0
ghci> sum3 [0,1,2]
0
ghci> sum3 [0,1,2,3]
3
ghci> sum3 [0,1,2,3,4]
3
ghci> sum3 [0,1,2,3,4,5]
3
ghci> sum3 [0,1,2,3,4,5,6]
9
ghci> sum3 [0,1,2,3,4,5,6,7]
9
ghci> sum3 [0,1,2,3,4,5,6,7,8]
9
ghci> sum3 [0,1,2,3,4,5,6,7,8,9]
18
-}

-- 4.3

{-
ghci> :t "cat"
"cat" :: String
ghci> ['c','a','t']
"cat"
ghci> 3 : [5,7]
[3,5,7]
ghci> [3,5] ++ [7]
[3,5,7]
ghci> 'c' : "at"
"cat"
ghci> "c" ++ "at"
"cat"
ghci> let small x = 'a' <= x && x <= 'z'
ghci> small 'c'
True
ghci> small 'X'
False
-}

countLower :: String -> Int
countLower [] = 0
countLower (x:xs) | 'a' <= x && x <= 'z' = 1 + countLower xs
                  | otherwise = countLower xs

{-
ghci> countLower "cat Bob"
5
ghci> countLower "Bob"
2
-}

{-
Przeanalizuj wywo³anie funkcji countLower "Bob".

1. Przebieg z góry do do³u:             2. Przebieg z do³u do góry:

* countLower "Bob" =                    * countLower "Bob" = 2
  (x:xs) = "Bob"                          (x:xs) = "Bob"
  x = 'B'                                 x = 'B'
  xs = "ob"                               xs = "ob"
  'a' <= x && x <= 'z'                    'a' <= x && x <= 'z'
  'a' <= 'B' && 'B' <= 'z' = False        'a' <= 'B' && 'B' <= 'z' = False
  = countLower xs =                       = countLower xs =
  = countLower "ob" =                     = countLower "ob" = 2

* countLower "ob" =                     * countLower "ob" = 2
  (x:xs) = "ob"                           (x:xs) = "ob"
  x = 'o'                                 x = 'o'
  xs = "b"                                xs = "b"
  'a' <= x && x <= 'z'                    'a' <= x && x <= 'z'
  'a' <= 'o' && 'o' <= 'z' = True         'a' <= 'o' && 'o' <= 'z' = True
  = 1 + countLower xs =                   = 1 + countLower xs =
  = 1 + countLower "b" =                  = 1 + countLower "b" = 1 + 1 = 2
  
* countLower "b" =                      * countLower "b" = 1
  (x:xs) = "b"                            (x:xs) = "b"
  x = 'b'                                 x = 'b'
  xs = ""                                 xs = ""
  'a' <= x && x <= 'z'                    'a' <= x && x <= 'z'
  'a' <= 'b' && 'b' <= 'z' = True         'a' <= 'b' && 'b' <= 'z' = True
  = 1 + countLower xs =                   = 1 + countLower xs =
  = 1 + countLower "" =                   = 1 + countLower "" = 1 + 0 = 1

* countLower "" =                       * countLower "" = 0
  = 0                                     = 0
-}

infixl 6 +.
(+.) :: (Int, Int) -> (Int, Int) -> (Int, Int)
(a, b) +. (c, d) = (a + c, b + d)

countLowerUpper :: String -> (Int, Int)
countLowerUpper [] = (0,0)
countLowerUpper (x:xs) = if 'a' <= x && x <= 'z' then (1,0) +. countLowerUpper xs
                         else if 'A' <= x && x <= 'Z' then (0,1) +. countLowerUpper xs
                         else countLowerUpper xs

countLowerUpper' :: String -> (Int, Int)
countLowerUpper' [] = (0,0)
countLowerUpper' (x:xs) | 'a' <= x && x <= 'z' = (1,0) +. countLowerUpper' xs
                        | 'A' <= x && x <= 'Z' = (0,1) +. countLowerUpper' xs
                        | otherwise = countLowerUpper' xs

countLowerUpper'' :: String -> (Int, Int)
countLowerUpper'' [] = (0,0)
countLowerUpper'' (x:xs) | 'a' <= x && x <= 'z' = (1 + fst func, 0 + snd func)
                         | 'A' <= x && x <= 'Z' = (0 + fst func, 1 + snd func)
                         | otherwise = func
                           where func = countLowerUpper'' xs

{-
ghci> countLowerUpper "lowerEXTRAupper"
(10,5)
ghci> countLowerUpper' "lowerEXTRAupper"
(10,5)
ghci> countLowerUpper'' "lowerEXTRAupper"
(10,5)
ghci> countLowerUpper "lower"
(5,0)
ghci> countLowerUpper "EXTRA"
(0,5)
ghci> countLowerUpper ""
(0,0)
ghci> countLowerUpper "smallPLUS123"
(5,4)
ghci> countLowerUpper "321super@"
(5,0)
-}

-- 4.4

string2bools :: [Char] -> [Bool]
string2bools [] = []
string2bools (x:xs) | 'a' <= x && x <= 'z' = True : string2bools xs
                    | otherwise = False : string2bools xs

{-
ghci> string2bools ""
[]
ghci> string2bools "Ala"
[False,True,True]
ghci> string2bools "ala"
[True,True,True]
ghci> string2bools "ALA"
[False,False,False]
ghci> string2bools "AlA"
[False,True,False]
-}

-- 4.5

{-
Ile argumentów przyjmuje funkcja cgtx?
Funkcja cgtx przyjmuje dwa argumenty: liczbê i listê liczb (mo¿e byæ pusta, skoñczona lub nieskoñczenie d³uga).

Ile rzeczywistych parametrów przekazujemy do cgtx?
Do cgtx s¹ przekazywane dwa parametry rzeczywiste: liczba i lista liczb (mo¿e byæ pusta, skoñczona lub nieskoñczenie d³uga).
-}

cgtx :: (Ord x, Num x) => x -> [x] -> x
cgtx _ [] = 0
cgtx x (y:ys) | x < y = 1 + cgtx x ys
              | otherwise = cgtx x ys

{-
ghci> cgtx 3 []
0
ghci> cgtx 3 [1]
0
ghci> cgtx 3 [1,2]
0
ghci> cgtx 3 [1,2,3]
0
ghci> cgtx 3 [1,2,3,4]
1
ghci> cgtx 3 [1,2,3,4,5]
2
ghci> cgtx 3 [1,2,3,4,5,6]
3
ghci> cgtx 3 [1,2,3,4,5,6,7]
4
ghci> cgtx 3 [0,1,2,3,4,5]
2
-}

cltx :: (Ord x, Num x) => x -> [x] -> x
cltx _ [] = 0
cltx x (y:ys) | y < x = 1 + cltx x ys
              | otherwise = cltx x ys

{-
ghci> cltx 3 []
0
ghci> cltx 3 [1]
1
ghci> cltx 3 [1,2]
2
ghci> cltx 3 [1,2,3]
2
ghci> cltx 3 [1,2,3,4]
2
ghci> cltx 3 [1,2,3,4,5]
2
ghci> cltx 3 [1,2,3,4,5,6]
2
ghci> cltx 3 [1,2,3,4,5,6,7]
2
ghci> cltx 3 [0,1,2,3,4,5]
3
-}

gtx :: (Ord x, Num x) => x -> [x] -> [x]
gtx _ [] = []
gtx x (y:ys) | x < y = y : gtx x ys
             | otherwise = gtx x ys

{-
ghci> gtx 3 []
[]
ghci> gtx 3 [1]
[]
ghci> gtx 3 [1,2]
[]
ghci> gtx 3 [1,2,3]
[]
ghci> gtx 3 [1,2,3,4]
[4]
ghci> gtx 3 [1,2,3,4,5]
[4,5]
ghci> gtx 3 [1,2,3,4,5,6]
[4,5,6]
ghci> gtx 3 [1,2,3,4,5,6,7]
[4,5,6,7]
ghci> gtx 3 [0,1,2,3,4,5]
[4,5]
-}

{-
Przeanalizuj wywo³anie funkcji gtx 1 [2,1,3].

1. Przebieg z góry do do³u:     2. Przebieg z do³u do góry:

* gtx 1 [2,1,3] =               * gtx 1 [2,1,3] = [2,3]
  (y:ys) = [2,1,3]                (y:ys) = [2,1,3]
  x = 1                           x = 1
  y = 2                           y = 2
  ys = [1,3]                      ys = [1,3]
  x < y                           x < y
  1 < 2 = True                    1 < 2 = True
  = y : gtx x ys =                = y : gtx x ys =
  = 2 : gtx 1 [1,3] =             = 2 : gtx 1 [1,3] = 2 : [3] = [2,3]

* gtx 1 [1,3] =                 * gtx 1 [1,3] = [3]
  (y:ys) = [1,3]                  (y:ys) = [1,3]
  x = 1                           x = 1
  y = 1                           y = 1
  ys = [3]                        ys = [3]
  x < y                           x < y
  1 < 1 = False                   1 < 1 = False
  = gtx x ys =                    = gtx x ys =
  = gtx 1 [3] =                   = gtx 1 [3] = [3]

* gtx 1 [3] =                   * gtx 1 [3] = [3]
  (y:ys) = [3]                    (y:ys) = [3]
  x = 1                           x = 1
  y = 3                           y = 3
  ys = []                         ys = []
  x < y                           x < y
  1 < 3 = True                    1 < 3 = True
  = y : gtx x ys =                = y : gtx x ys =
  = 3 : gtx 1 [] =                = 3 : gtx 1 [] = 3 : [] = [3]

* gtx 1 [] =                    * gtx 1 [] = []
  = []                            = []
-}

gtx' :: (Ord x, Num x) => x -> [x] -> [x]
gtx' _ [] = []
gtx' x (y:ys) | x < y = [y] ++ gtx' x ys
              | otherwise = gtx' x ys

{-
ghci> gtx' 3 []
[]
ghci> gtx' 3 [1]
[]
ghci> gtx' 3 [1,2]
[]
ghci> gtx' 3 [1,2,3]
[]
ghci> gtx' 3 [1,2,3,4]
[4]
ghci> gtx' 3 [1,2,3,4,5]
[4,5]
ghci> gtx' 3 [1,2,3,4,5,6]
[4,5,6]
ghci> gtx' 3 [1,2,3,4,5,6,7]
[4,5,6,7]
ghci> gtx' 3 [0,1,2,3,4,5]
[4,5]
-}

ltx :: (Ord x, Num x) => x -> [x] -> [x]
ltx _ [] = []
ltx x (y:ys) | y <= x = y : ltx x ys
             | otherwise = ltx x ys

{-
ghci> ltx 3 []
[]
ghci> ltx 3 [1]
[1]
ghci> ltx 3 [1,2]
[1,2]
ghci> ltx 3 [1,2,3]
[1,2,3]
ghci> ltx 3 [1,2,3,4]
[1,2,3]
ghci> ltx 3 [1,2,3,4,5]
[1,2,3]
ghci> ltx 3 [1,2,3,4,5,6]
[1,2,3]
ghci> ltx 3 [1,2,3,4,5,6,7]
[1,2,3]
ghci> ltx 3 [0,1,2,3,4,5]
[0,1,2,3]
-}

ltx' :: (Ord x, Num x) => x -> [x] -> [x]
ltx' _ [] = []
ltx' x (y:ys) | y <= x = [y] ++ ltx' x ys
              | otherwise = ltx' x ys

{-
ghci> ltx' 3 []
[]
ghci> ltx' 3 [1]
[1]
ghci> ltx' 3 [1,2]
[1,2]
ghci> ltx' 3 [1,2,3]
[1,2,3]
ghci> ltx' 3 [1,2,3,4]
[1,2,3]
ghci> ltx' 3 [1,2,3,4,5]
[1,2,3]
ghci> ltx' 3 [1,2,3,4,5,6]
[1,2,3]
ghci> ltx' 3 [1,2,3,4,5,6,7]
[1,2,3]
ghci> ltx' 3 [0,1,2,3,4,5]
[0,1,2,3]
-}

-- 4.6

{-
ghci> :t read
read :: Read a => String -> a
ghci> :t show
show :: Show a => a -> String
ghci> read "35"
*** Exception: Prelude.read: no parse
ghci> read "35" :: Int
35
ghci> read "35" :: Float
35.0
ghci> show 35
"35"
-}

string2int :: String -> Int
string2int [] = 0
string2int x = read x :: Int

{-
ghci> string2int "35"
35
ghci> string2int ""
0
-}

string2int' :: String -> Integer
string2int' [] = 0
string2int' x = read x

{-
ghci> string2int' "35"
35
ghci> string2int' ""
0
-}

string2int'' :: String -> Integer
string2int'' [] = 0
string2int'' x = toInteger (read x)

{-
ghci> string2int'' "35"
35
ghci> string2int'' ""
0
-}

string2int''' :: String -> Int
string2int''' [] = 0
string2int''' (x:xs) = (ord x - ord '0') * (10 ^ length xs) + string2int''' xs

{-
ghci> string2int''' "35"
35
ghci> string2int''' ""
0
-}

-- 4.7

{-
ghci> :t sum
sum :: (Foldable t, Num a) => t a -> a
ghci> :t product
product :: (Foldable t, Num a) => t a -> a
ghci> sum [1,3,5]
9
ghci> product [1,3,5]
15
ghci> [1..5]
[1,2,3,4,5]
ghci> [n | n <- [1..5]]
[1,2,3,4,5]
-}

{-
suma1 = 1 + 1/2 + 1/3 + ... + 1/100
-}

-- Z wykorzystaniem sekcji.
suma1 :: Double
suma1 = sum (map (1 /) [1..100])

-- Z wykorzystaniem notacji lambda.
suma1' :: Double
suma1' = sum (map (\n -> 1/n) [1..100])

-- Z wykorzystaniem notacji zbiorów.
suma1'' :: Double
suma1'' = sum [1/n | n <- [1..100]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma1''' :: Double
suma1''' = foldl (+) 0 [1/n | n <- [1..100]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma1'''' :: Double
suma1'''' = foldr (+) 0 [1/n | n <- [1..100]]

{-
ghci> suma1
5.187377517639621
ghci> suma1'
5.187377517639621
ghci> suma1''
5.187377517639621
ghci> suma1'''
5.187377517639621
ghci> suma1''''
5.1873775176396215
-}

-- Z wykorzystaniem notacji lambda.
iloczyn1 :: Double
iloczyn1 = product (map (\n -> (1 + n)/(2 + n)) [1..50])

-- Z wykorzystaniem notacji zbiorów.
iloczyn1' :: Double
iloczyn1' = product [(1 + n)/(2 + n) | n <- [1..50]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'product'.
iloczyn1'' :: Double
iloczyn1'' = foldl (*) 1 [(1 + n)/(2 + n) | n <- [1..50]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'product'.
iloczyn1''' :: Double
iloczyn1''' = foldr (*) 1 [(1 + n)/(2 + n) | n <- [1..50]]

{-
ghci> iloczyn1
3.846153846153846e-2
ghci> iloczyn1'
3.846153846153846e-2
ghci> iloczyn1''
3.846153846153846e-2
ghci> iloczyn1'''
3.846153846153844e-2
-}

-- Z wykorzystaniem notacji lambda.
suma2 :: Double
suma2 = sum (map (\i -> 1/(i^2)) [1..1000])

-- Z wykorzystaniem notacji zbiorów.
suma2' :: Double
suma2' = sum ([1/(i^2) | i <- [1..1000]])

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma2'' :: Double
suma2'' = foldl (+) 0 [1/(i^2) | i <- [1..1000]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma2''' :: Double
suma2''' = foldr (+) 0 [1/(i^2) | i <- [1..1000]]

{-
ghci> suma2
1.6439345666815615
ghci> suma2'
1.6439345666815615
ghci> suma2''
1.6439345666815615
ghci> suma2'''
1.6439345666815597
-}

-- Z wykorzystaniem notacji lambda.
suma3 :: Double
suma3 = sum (map (\i -> (sqrt i) - (1/i)) [1..1000])

-- Z wykorzystaniem notacji zbiorów.
suma3' :: Double
suma3' = sum ([(sqrt i) - (1/i) | i <- [1..1000]])

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma3'' :: Double
suma3'' = foldl (+) 0 [(sqrt i) - (1/i) | i <- [1..1000]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'sum'.
suma3''' :: Double
suma3''' = foldr (+) 0 [(sqrt i) - (1/i) | i <- [1..1000]]

{-
ghci> suma3
21089.970416620185
ghci> suma3'
21089.970416620185
ghci> suma3''
21089.970416620185
ghci> suma3'''
21089.970416620174
-}

-- Z wykorzystaniem notacji lambda.
iloczyn2 :: Double
iloczyn2 = product (map (\i -> (i + 1)/(i^3)) [1..1000])

-- Z wykorzystaniem notacji zbiorów.
iloczyn2' :: Double
iloczyn2' = product ([(i + 1)/(i^3) | i <- [1..1000]])

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'product'.
iloczyn2'' :: Double
iloczyn2'' = foldl (*) 1 [(i + 1)/(i^3) | i <- [1..1000]]

-- Z wykorzystaniem jednej z funkcji sk³adania zamiast 'product'.
iloczyn2''' :: Double
iloczyn2''' = foldr (*) 1 [(i + 1)/(i^3) | i <- [1..1000]]

{-
ghci> iloczyn2
0.0
ghci> iloczyn2'
0.0
ghci> iloczyn2''
0.0
ghci> iloczyn2'''
0.0
-}

-- 4.8

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

{-
ghci> factors 0
[]
ghci> factors 1
[1]
ghci> factors 2
[1,2]
ghci> factors 3
[1,3]
ghci> factors 4
[1,2,4]
ghci> factors 5
[1,5]
ghci> factors 6
[1,2,3,6]
ghci> factors 7
[1,7]
ghci> factors 8
[1,2,4,8]
ghci> factors 9
[1,3,9]
ghci> factors 17
[1,17]
ghci> factors 21
[1,3,7,21]
-}

prime :: Int -> Bool
prime n = factors n == [1,n]

{-
ghci> prime 0
False
ghci> prime 1
False
ghci> prime 2
True
ghci> prime 3
True
ghci> prime 4
False
ghci> prime 5
True
ghci> prime 6
False
ghci> prime 7
True
ghci> prime 8
False
ghci> prime 9
False
ghci> prime 17
True
ghci> prime 21
False
-}

primes :: [Int]
primes = filter prime [2 ..]

{-
ghci> primes
[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509,521,523,541,547,557,563,569,571,577,587,593,599,601,607,613,617,619,631,641,643,647,653,659,661,673,677,683,691,701,709,719,727,733,739,743,751,757,761,769,773,787,797,809,811,821,823,827,829,839,853,857,859,863,877Interrupted.
-}

pairs :: [Int] -> [(Int, Int)]
pairs (x:y:[])  | x + 2 == y = [(x,y)]
                | otherwise  = []
pairs (x:y:xys) | x + 2 == y = (x,y) : pairs (y:xys)
                | otherwise  = pairs (y:xys)

{-
ghci> pairs [1,3,5,7]
[(1,3),(3,5),(5,7)]
ghci> pairs [1,4,7,9]
[(7,9)]
ghci> pairs [1,3,6,9]
[(1,3)]
ghci> pairs [1,4,6,9]
[(4,6)]
ghci> pairs [1,3,3,7]
[(1,3)]
ghci> pairs [1,4,7,10]
[]
ghci> pairs [1,4,7,10,6,8,11]
[(6,8)]
-}

primePairs :: [(Int, Int)]
primePairs = [(x,y) | x <- primes, y <- [x + 2], prime y]

{-
ghci> primePairs
[(3,5),(5,7),(11,13),(17,19),(29,31),(41,43),(59,61),(71,73),(101,103),(107,109),(137,139),(149,151),(179,181),(191,193),(197,199),(227,229),(239,241),(269,271),(281,283),(311,313),(347,349),(419,421),(431,433),(461,463),(521,523),(569,571),(599,601),(617,619),(641,643),(659,661),(809,811),(821,823),(827,829),(857,859),(881,883),(1019,1021),
-}

primeTriples :: [(Int, Int, Int)]
primeTriples = [(x,y,z) | x <- primes, y <- [x + 2], z <- [y + 2], prime y, prime z]

{-
ghci> primeTriples
[(3,5,7)
-}
