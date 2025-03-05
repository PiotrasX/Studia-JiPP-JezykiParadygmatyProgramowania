module Lists where

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
sum1 (x1:x2:xs) = x2 + sum1 xs

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
  (x1:x2:xs) = [3,5,7]              (x1:x2:xs) = [3,5,7]
  x1 = 3                            x1 = 3
  x2 = 5                            x2 = 5
  xs = [7]                          xs = [7]
  = x2 + sum1 xs =                  = x2 + sum1 xs =
  = 5 + sum1 [7] =                  = 5 + sum1 [7] = 5 + 0 = 5

* sum1 [7] =                      * sum1 [7] = 0
  [_] = [7]                         [_] = [7]
  = 0                               = 0
-}

{-
Przeanalizuj wywo³anie funkcji sum1 [3,5,7,9].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum1 [3,5,7,9] =                * sum1 [3,5,7,9] = 14
  (x1:x2:xs) = [3,5,7,9]            (x1:x2:xs) = [3,5,7,9]
  x1 = 3                            x1 = 3
  x2 = 5                            x2 = 5
  xs = [7,9]                        xs = [7,9]
  = x2 + sum1 xs =                  = x2 + sum1 xs =
  = 5 + sum1 [7,9] =                = 5 + sum1 [7,9] = 5 + 9 = 14

* sum1 [7,9] =                    * sum1 [7,9] = 9
  x1 = 7                            x1 = 7
  x2 = 9                            x2 = 9
  xs = []                           xs = []
  = x2 + sum1 xs =                  = x2 + sum1 xs =
  = 9 + sum1 [] =                   = 9 + sum1 [] = 9 + 0 = 9

* sum1 [] =                       * sum1 [] = 0
  = 0                               = 0
-}

sum2 :: Num a => [a] -> a
sum2 [] = 0
sum2 [x] = x
sum2 (x1:x2:xs) = x1 + sum2 xs

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
  (x1:x2:xs) = [3,5,7]              (x1:x2:xs) = [3,5,7]
  x1 = 3                            x1 = 3
  x2 = 5                            x2 = 5
  xs = [7]                          xs = [7]
  = x1 + sum2 xs =                  = x1 + sum2 xs =
  = 3 + sum2 [7] =                  = 3 + sum2 [7] = 3 + 7 = 10

* sum2 [7] =                      * sum2 [7] = 7
  [x] = 7                           [x] = 7
  = 7                               = 7
-}

{-
Przeanalizuj wywo³anie funkcji sum2 [3,5,7,9].

1. Przebieg z góry do do³u:       2. Przebieg z do³u do góry:

* sum2 [3,5,7,9] =                * sum2 [3,5,7,9] = 10
  (x1:x2:xs) = [3,5,7,9]            (x1:x2:xs) = [3,5,7,9]
  x1 = 3                            x1 = 3
  x2 = 5                            x2 = 5
  xs = [7,9]                        xs = [7,9]
  = x1 + sum2 xs =                  = x1 + sum2 xs =
  = 3 + sum2 [7,9] =                = 3 + sum2 [7,9] = 3 + 7 = 10

* sum2 [7,9] =                    * sum2 [7,9] = 7
  x1 = 7                            x1 = 7
  x2 = 9                            x2 = 9
  xs = []                           xs = []
  = x1 + sum2 xs =                  = x1 + sum2 xs =
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
countLower "" = 0
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
  = countLower "ob" =                     = countLower "ob" = 2

* countLower "ob" =                     * countLower "ob" = 2
  (x:xs) = "ob"                           (x:xs) = "ob"
  x = 'o'                                 x = 'o'
  xs = "b"                                xs = "b"
  'a' <= x && x <= 'z'                    'a' <= x && x <= 'z'
  'a' <= 'o' && 'o' <= 'z' = True         'a' <= 'o' && 'o' <= 'z' = True
  = 1 + countLower "b" =                  = 1 + countLower "b" = 1 + 1 = 2
  
* countLower "b" =                      * countLower "b" = 1
  (x:xs) = "b"                            (x:xs) = "b"
  x = 'b'                                 x = 'b'
  xs = ""                                 xs = ""
  'a' <= x && x <= 'z'                    'a' <= x && x <= 'z'
  'a' <= 'b' && 'b' <= 'z' = True         'a' <= 'b' && 'b' <= 'z' = True
  = 1 + countLower "" =                   = 1 + countLower "" = 1 + 0 = 1

* countLower "" =                       * countLower "" = 0
  = 0                                     = 0
-}

infixl 6 +.
(+.) :: (Int, Int) -> (Int, Int) -> (Int, Int)
(a, b) +. (c, d) = (a + c, b + d)

countLowerUpper :: String -> (Int, Int)
countLowerUpper "" = (0,0)
countLowerUpper (x:xs) = if 'a' <= x && x <= 'z' then (1,0) +. countLowerUpper xs
                         else if 'A' <= x && x <= 'Z' then (0,1) +. countLowerUpper xs
                         else countLowerUpper' xs

countLowerUpper' :: String -> (Int, Int)
countLowerUpper' "" = (0,0)
countLowerUpper' (x:xs) | 'a' <= x && x <= 'z' = (1,0) +. countLowerUpper' xs
                        | 'A' <= x && x <= 'Z' = (0,1) +. countLowerUpper' xs
                        | otherwise = countLowerUpper' xs

countLowerUpper'' :: String -> (Int, Int)
countLowerUpper'' "" = (0,0)
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








