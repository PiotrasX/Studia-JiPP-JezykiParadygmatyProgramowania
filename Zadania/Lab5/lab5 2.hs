-- 5.1
 
-- Funkcja until implementuje iteracje.
-- Jej parametry to:
--    * funkcja definiuj1ca w3asnooa jak1 powinien spe3niaa koncowy wynik;
--    * funkcja stosowana w ka?dej iteracji do korekty wyniku;
--    * wartooa pocz1tkowa;
-- Wywo3anie until p f x nale?y rozumiea jako:
--    Dopóki nie jest spe3nione p stosuj funkcje f do wartooci x.
--
-- until :: (a -> Bool) -> (a -> a) -> a -> a
-- until p f x | p x = x
--             | otherwise = until p f (f x)
 
infix 5 ~=
a ~= b = abs (a - b) < h
         where h = 0.000001
 
cubeRoot :: Double -> Double
cubeRoot 0 = 0
cubeRoot x = until goodEnough improve 1.0
             where improve y = (1/3)*(2*y + x/(y^2))
                   goodEnough y = y*y*y ~= x
 
{-
ghci> cubeRoot 1
1.0
ghci> cubeRoot 2
1.2599210500177698
ghci> cubeRoot 3
1.4422495703074418
ghci> cubeRoot 4
1.5874010520152706
ghci> cubeRoot 5
1.709975950782189
ghci> cubeRoot 6
1.817120681877066
ghci> cubeRoot 7
1.9129311827727737
ghci> cubeRoot 8
2.000000000012062
ghci> cubeRoot 27
3.0000000000000977
ghci> cubeRoot 64
4.00000000007612
ghci> cubeRoot 0
0.0
ghci> cubeRoot (-1)
-1.0000000017946067
ghci> cubeRoot (-8)
-2.0
ghci> cubeRoot (-27)
-3.0000000053838205
ghci> cubeRoot (-64)
-4.000000000004643
-}
 
-- 5.2
 
{-
* Suma Riemanna po prawej stronie.
 
   y               / y = f(x)
   |            __/
   |           | /|
   |           |/ |
   |         __/  |
   |        | /|  |
   |        |/ |  |
   |      __/  |  |
   |     | /|  |  |
   |     |/ |  |  |
   |     /  |  |  |
---+--+--+--+--+--+--+--+---> x
   |     x0 x1 x2 x3
   |     a        b
 
Partycje: 3
 
Area(3) = (x1 - x0)*f(x1) + (x2 - x1)*f(x2) + (x3 - x2)*f(x3)
 
A:  x_i - x_i-1 = h = (b - a)/3  for  i = 1..3
 
                                          3_
                                          \
Area(3) = h*(f(x1) + f(x2) + f(x3)) = h * /_ f(x_i)
                                          i=1
 
Partycje: n
 
Area(n) = (x1 - x0)*f(x1) + (x2 - x1)*f(x2) + ... + (x_n - x_n-1)*f(x_n)
 
A:  x_i - x_i-1 = h = (b - a)/n  for  i = 1..n
 
                                                 n_
                                                 \
Area(n) = h*(f(x1) + f(x2) + ... + f(x_n)) = h * /_ f(x_i)
                                                 i=1
-}
 
{-
Podaj analogiczne wyprowadzenie dla sumy Riemanna po lewej stronie.
 
* Suma Riemanna po lewej stronie.
 
   y               / y = f(x)
   |            __/
   |           | /|
   |           |/ |
   |         __/  |
   |        | /|  |
   |        |/ |  |
   |      __/  |  |
   |     | /|  |  |
   |     |/ |  |  |
   |     /  |  |  |
---+--+--+--+--+--+--+--+---> x
   |     x0 x1 x2 x3
   |     a        b
 
Partycje: 3
 
Area(3) = (x1 - x0)*f(x0) + (x2 - x1)*f(x1) + (x3 - x2)*f(x2)
 
A:  x_i - x_i-1 = h = (b - a)/3  for  i = 1..3
 
                                          2_
                                          \
Area(3) = h*(f(x0) + f(x1) + f(x2)) = h * /_ f(x_i)
                                          i=0
 
Partycje: n
 
Area(n) = (x1 - x0)*f(x0) + (x2 - x1)*f(x1) + ... + (x_n - x_n-1)*f(x_n-1)
 
A:  x_i - x_i-1 = h = (b - a)/n  for  i = 1..n
 
                                                 n-1_
                                                   \
Area(n) = h*(f(x0) + f(x1) + ... + f(x_n-1)) = h * /_ f(x_i)
                                                   i=0
-}
 
{-
ghci> :t (/)
(/) :: Fractional a => a -> a -> a
ghci> (3 :: Float) / (5 :: Int)
 
<interactive>:6:17: error:
    * Couldn't match expected type `Float' with actual type `Int'
    * In the second argument of `(/)', namely `(5 :: Int)'
      In the expression: (3 :: Float) / (5 :: Int)
      In an equation for `it': it = (3 :: Float) / (5 :: Int)
ghci> (3 :: Int) * (5 :: Float)
 
<interactive>:7:15: error:
    * Couldn't match expected type `Int' with actual type `Float'
    * In the second argument of `(*)', namely `(5 :: Float)'
      In the expression: (3 :: Int) * (5 :: Float)
      In an equation for `it': it = (3 :: Int) * (5 :: Float)
ghci> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
ghci> (3 :: Float) / fromIntegral (5 :: Int)
0.6
ghci> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}
 
-- f    -> Funkcja podca3kowa.
-- a, b -> Konce przedzia3u ca3kowania.
-- n    -> Liczba przedzia3ów na które dzielimy przedzia3 ca3kowania.
 
rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule (f) a b n = sum [h * f x | x <- points]
                          where h = (b - a) / fromIntegral(n)
                                points = [a + fromIntegral(i) * h | i <- [1..n]]
 
{-
Ile argumentów przyjmuje funkcja rectangleRule?
Funkcja rectangleRule przyjmuje 4 argumenty.
 
 
Jaki jest typ parametru f?
Typ parametru f to (Float -> Float).
 
Jaki jest typ parametru a?
Typ parametru a to Float.
 
Jaki jest typ parametru b?
Typ parametru b to Float.
 
Jaki jest typ parametru n?
Typ parametru n to Int.
 
 
Jaki jest typ wyra?enia (b - a)?
Typ wyra?enia (b - a) to Float.
 
Dlaczego musimy u?ya funkcji fromIntegral w wyra?eniu dla h?
Poniewa? nie mo?na dzielia Float / Int, bedzie b31d, dlatego n trzeba przekonwertowaa na dowolny typ numeryczny.
 
Dlaczego musimy u?ya funkcji fromIntegral w wyra?eniu dla points?
Poniewa? nie mo?na mno?ya Int * Float, bedzie b31d, dlatego i trzeba przekonwertowaa na dowolny typ numeryczny.
 
 
Jaki jest typ h?
Typ h to Float.
 
Jaki jest typ points?
Typ points to [Float].
 
 
Co oznacza sta3a h?
Sta3a h to szerokooa ka?dego z podprzedzia3ów, na które dzielony jest przedzia3 [a, b].
 
Co oznacza sta3a points?
Sta3a points to lista punktów, które s1 prawymi koncami poszczególnych podprzedzia3ów, na które dzielony jest przedzia3 [a, b].
-}
 
integral1 = rectangleRule sin 0 pi 100
integral1' = rectangleRule sin 0 pi 1000

{-
ghci> 2
2
ghci> integral1
1.9998356
ghci> integral1'
1.999998
-}

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000

{-
ghci> 2/3
0.6666666666666666
ghci> integral2
0.6714627
ghci> integral2'
0.66716015
-}

integral3 = rectangleRule (^2) 0 1 100
integral3' = rectangleRule (^2) 0 1 1000
integral3'' = rectangleRule (\x -> x^2) 0 1 100
integral3''' = rectangleRule (\x -> x^2) 0 1 1000
 
{-
ghci> 1/3
0.3333333333333333
ghci> integral3
0.33834997
ghci> integral3'
0.33383346
ghci> integral3''
0.33834997
ghci> integral3'''
0.33383346
-}

integral4 = rectangleRule ((+) . (*2) <*> (^3)) 0 2 100
integral4' = rectangleRule ((+) . (*2) <*> (^3)) 0 2 1000
integral4'' = rectangleRule (\x -> x^3 + 2*x) 0 2 100
integral4''' = rectangleRule (\x -> x^3 + 2*x) 0 2 1000
 
{-
ghci> 8
8
ghci> integral4
8.1203985
ghci> integral4'
8.012007
ghci> integral4''
8.1203985
ghci> integral4'''
8.012007
-}
 
-- 5.3
 
-- f    -> Funkcja podca3kowa.
-- a, b -> Konce przedzia3u ca3kowania.
-- n    -> Liczba przedzia3ów na które dzielimy przedzia3 ca3kowania.
 
trapezoidalRule :: (Float -> Float) -> Float -> Float -> Int -> Float
trapezoidalRule (f) a b n = (h/2) * (f a + f b) + sum [h * f x | x <- points]
                            where h = (b - a) / fromIntegral(n)
                                  points = [a + fromIntegral(i) * h | i <- [1..(n - 1)]]
 
integral5 = trapezoidalRule sin 0 pi 100
integral5' = trapezoidalRule sin 0 pi 1000

{-
ghci> 2
2
ghci> integral5
1.9998356
ghci> integral5'
1.999998
-}

integral6 = trapezoidalRule sqrt 0 1 100
integral6' = trapezoidalRule sqrt 0 1 1000

{-
ghci> 2/3
0.6666666666666666
ghci> integral6
0.6664627
ghci> integral6'
0.6666602
-}

integral7 = trapezoidalRule (^2) 0 1 100
integral7' = trapezoidalRule (^2) 0 1 1000
integral7'' = trapezoidalRule (\x -> x^2) 0 1 100
integral7''' = trapezoidalRule (\x -> x^2) 0 1 1000
 
{-
ghci> 1/3
0.3333333333333333
ghci> integral7
0.33334997
ghci> integral7'
0.33333346
ghci> integral7''
0.33334997
ghci> integral7'''
0.33333346
-}

integral8 = trapezoidalRule ((+) . (*2) <*> (^3)) 0 2 100
integral8' = trapezoidalRule ((+) . (*2) <*> (^3)) 0 2 1000
integral8'' = trapezoidalRule (\x -> x^3 + 2*x) 0 2 100
integral8''' = trapezoidalRule (\x -> x^3 + 2*x) 0 2 1000
 
{-
ghci> 8
8
ghci> integral8
8.000399
ghci> integral8'
8.000007
ghci> integral8''
8.000399
ghci> integral8'''
8.000007
-}

-- 5.4

{-
We will use the following symbols:

o    - empty node

5
*    - node with value 5
 _
/ \  - subtree
 _
/5\  - subtree with value 5
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

{-
With the use of data type 'Tree a' define the following trees:

bt_1   o

       5
bt_2   *

       5  
bt_3   *
      / \ 
    3*   o

       5   
bt_4   *   
      / \  
     o   *7
     
       5
bt_5   *
      / \
    3*   *7
-}

bt_1 = Null
bt_2 = Leaf 5
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

treeSize :: Tree a -> Int
treeSize (Null) = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

{-
ghci> treeSize bt_1
0
ghci> treeSize bt_2
1
ghci> treeSize bt_3
2
ghci> treeSize bt_4
2
ghci> treeSize bt_5
3
-}

showTree :: (Show a) => Tree a -> String
showTree (Null) = "()"
showTree (Leaf x) = show x
showTree (Node x left right) = show x ++ " L(" ++ showTree left ++ ") R(" ++ showTree right ++ ")"
 
bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
bt3 = Node 7 (Leaf 1) Null

{-
*Main> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
*Main> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
*Main> showTree bt3
"7 L(1) R(())"
-}

-- 5.5

{-
1. Adding value to an empty tree

              5
add 5 o   =   *

2. Adding value to a one-element tree

      5       5
add 5 *   =   *

      5       5
add 3 *   =   *
             / \
           3*   o

      5       5
add 7 *   =   *
             / \
            o   *7

3. Adding value to a non-trivial tree

      5       5
add 5 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ / \

      5       5
add 3 *   =   *
    _/ \_   _/ \_
   / \ / \ /3\ / \

      5       5
add 7 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ /7\
-}

add :: Ord a => a -> Tree a -> Tree a
add x Null = Leaf x
add x (Leaf y) | x == y = Leaf y
               | x < y = Node y (Leaf x) Null
               | x > y = Node y Null (Leaf x)
add x (Node y left right) | x == y = Node y left right
                          | x < y = Node y (add x left) right
                          | x > y = Node y left (add x right)

{- Task 3

1. Add value 6 to the drawing of the b1 tree.

2. Add value 8 to the result of the previous task.

       7
bt1   / \
     4   10
    / \
   2   5
-}

-- solution here

{-
       7
bt1   / \
     4   10
    / \
   2   5
      / \
     o   6
-}

{-
       __7__
bt1   /     \
     4       10
    / \     / \
   2   5   8   o
      / \
     o   6
-}

{-
*Main> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
*Main> showTree (add 8 (add 6 bt1))
"7 L(4 L(2) R(5 L(()) R(6))) R(10 L(8) R(()))"
-}


-- 5.6

elemTree :: Ord a => a -> Tree a -> Bool
elemTree _ (Null) = False
elemTree e (Leaf x) = e == x
elemTree e (Node x left right) | e == x = True
                               | e < x = elemTree e left
                               | e > x = elemTree e right

{-
*Main> elemTree 3 Null
False
*Main> elemTree 3 (Leaf 3)
True
*Main> elemTree 3 (Leaf 5)
False
*Main> elemTree 3 bt1
False
*Main> elemTree 4 bt1
True
-}

-- 5.7

tree2list :: Ord a => Tree a -> [a]
tree2list Null = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = tree2list left ++ [x] ++ tree2list right

{-
*Main> tree2list Null
[]
*Main> tree2list (Leaf 5)
[5]
*Main> tree2list bt1
[2,4,5,7,10]
*Main> tree2list (add 6 bt1)
[2,4,5,6,7,10]
*Main> tree2list bt2
[2,4,5,7,9,10,11,13,15]
*Main> tree2list bt3
[1,7]
-}

{-
What does m stand for?
m to indeks srodka listy

What does x stand for?

              m
        0  1  2  3
list = [1, 3, 5, 7]
              x

              m
        0  1  2  3  4
list = [1, 3, 5, 7, 9]
              x

Stages of creation of a tree for the list [1,3,5,7]

      5
     / \
[1,3]   [7]

      5
     / \
    3   7
   / \
[1]   []

      5
     / \
    3   7
   / \
  1   o
-}

{-
*Main> let list = [1,3,5,7]
*Main> length list
4
*Main> length list `div` 2
2
*Main> list !! 2
5
*Main> :t take
take :: Int -> [a] -> [a]
*Main> take 2 list
[1,3]
*Main> :t drop
drop :: Int -> [a] -> [a]
*Main> drop (2 + 1) list
[7]
-}

list2tree :: Ord a => [a] -> Tree a
list2tree [] = Null
list2tree [x] = Leaf x
list2tree list = Node x (list2tree ltx) (list2tree gtx)
                 where mid = length list `div` 2
                       x = list !! mid
                       ltx = take mid list
                       gtx = drop (mid + 1) list

{-
*Main> showTree (list2tree [])
"()"
*Main> showTree (list2tree [5])
"5"
*Main> showTree (list2tree [1,3,5,7])
"5 L(3 L(1) R(())) R(7)"
*Main> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
*Main> showTree (list2tree (tree2list (add 6 bt1)))
"6 L(4 L(2) R(5)) R(10 L(7) R(()))"
-}
