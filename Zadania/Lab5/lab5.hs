-- 5.1

-- Funkcja until implementuje iteracje.
-- Jej parametry to:
--    * funkcja definiuj¹ca w³asnoœæ jak¹ powinien spe³niaæ koñcowy wynik;
--    * funkcja stosowana w ka¿dej iteracji do korekty wyniku;
--    * wartoœæ pocz¹tkowa;
-- Wywo³anie until p f x nale¿y rozumieæ jako:
--    Dopóki nie jest spe³nione p stosuj funkcjê f do wartoœci x.
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

-- f    -> Funkcja podca³kowa.
-- a, b -> Koñce przedzia³u ca³kowania.
-- n    -> Liczba przedzia³ów na które dzielimy przedzia³ ca³kowania.

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


Jaki jest typ wyra¿enia (b - a)?
Typ wyra¿enia (b - a) to Float.

Dlaczego musimy u¿yæ funkcji fromIntegral w wyra¿eniu dla h?
Poniewa¿ nie mo¿na dzieliæ Float / Int, bêdzie b³¹d, dlatego n trzeba przekonwertowaæ na dowolny typ numeryczny.

Dlaczego musimy u¿yæ funkcji fromIntegral w wyra¿eniu dla points?
Poniewa¿ nie mo¿na mno¿yæ Int * Float, bêdzie b³¹d, dlatego i trzeba przekonwertowaæ na dowolny typ numeryczny.


Jaki jest typ h?
Typ h to Float.

Jaki jest typ points?
Typ points to [Float].


Co oznacza sta³a h?
Sta³a h to szerokoœæ ka¿dego z podprzedzia³ów, na które dzielony jest przedzia³ [a, b].

Co oznacza sta³a points?
Sta³a points to lista punktów, które s¹ prawymi koñcami poszczególnych podprzedzia³ów, na które dzielony jest przedzia³ [a, b].
-}

integral1 = rectangleRule sin 0 pi 100
integral1' = rectangleRule sin 0 pi 1000

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000

integral3 = rectangleRule (^ 2) 0 1 100
integral3' = rectangleRule (^ 2) 0 1 1000
integral3'' = rectangleRule (\x -> x^2) 0 1 100
integral3''' = rectangleRule (\x -> x^2) 0 1 1000

integral4 = rectangleRule ((+) . (* 2) <*> (^ 3)) 0 2 100
integral4' = rectangleRule ((+) . (* 2) <*> (^ 3)) 0 2 1000
integral4'' = rectangleRule (\x -> x^3 + 2*x) 0 2 100
integral4''' = rectangleRule (\x -> x^3 + 2*x) 0 2 1000

{-
ghci> integral1
1.9998356
ghci> integral1'
1.999998
ghci> 2/3
0.6666666666666666
ghci> integral2
0.6714627
ghci> integral2'
0.66716015
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

-- f    -> Funkcja podca³kowa.
-- a, b -> Koñce przedzia³u ca³kowania.
-- n    -> Liczba przedzia³ów na które dzielimy przedzia³ ca³kowania.

trapezoidalRule :: (Float -> Float) -> Float -> Float -> Int -> Float
trapezoidalRule (f) a b n = (h/2) * (f a + f b) + sum [h * f x | x <- points]
                            where h = (b - a) / fromIntegral(n)
                                  points = [a + fromIntegral(i) * h | i <- [1..(n - 1)]]

integral5 = trapezoidalRule sin 0 pi 100
integral5' = trapezoidalRule sin 0 pi 1000

integral6 = trapezoidalRule sqrt 0 1 100
integral6' = trapezoidalRule sqrt 0 1 1000

integral7 = trapezoidalRule (^ 2) 0 1 100
integral7' = trapezoidalRule (^ 2) 0 1 1000
integral7'' = trapezoidalRule (\x -> x^2) 0 1 100
integral7''' = trapezoidalRule (\x -> x^2) 0 1 1000

integral8 = trapezoidalRule ((+) . (* 2) <*> (^ 3)) 0 2 100
integral8' = trapezoidalRule ((+) . (* 2) <*> (^ 3)) 0 2 1000
integral8'' = trapezoidalRule (\x -> x^3 + 2*x) 0 2 100
integral8''' = trapezoidalRule (\x -> x^3 + 2*x) 0 2 1000

{-
ghci> integral5
1.9998356
ghci> integral5'
1.999998
ghci> 2/3
0.6666666666666666
ghci> integral6
0.6664627
ghci> integral6'
0.6666602
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
Bêdziemy u¿ywaæ nastêpuj¹cych symboli:

o     -> Pusty wêze³

5
*     -> Wêze³ o wartoœci 5
 _
/ \   -> Poddrzewo
 _
/5\   -> Poddrzewo o wartoœci 5
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
bt3 = Node 7 (Leaf 1) Null

{-
Wykorzystuj¹c typ danych 'Tree a' zdefiniuj nastêpuj¹ce drzewa:

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
bt_2 = Node 5 Null Null
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

treeSize :: Tree a -> Int
treeSize (Null) = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

{-
ghci> treeSize bt1
5
ghci> treeSize bt2
9
ghci> treeSize bt3
2
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

showTree :: Show a => Tree a -> String
showTree (Null) = "()"
showTree (Leaf x) = show x
showTree (Node x left right) = show x ++ " L(" ++ showTree left ++ ") R(" ++ showTree right ++ ")"

{-
ghci> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
ghci> showTree bt3
"7 L(1) R(())"
-}

-- 5.5

{-
1. Dodawanie wartoœci do pustego drzewa.

              5
add 5 o   =   *

2. Dodawanie wartoœci do drzewa jednoelementowego.

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

3. Dodawanie wartoœci do drzewa nietrywialnego.

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
add n (Null) = Leaf n
add n (Leaf x) | n < x = Node x (Leaf n) Null
               | n > x = Node x Null (Leaf n)
               | otherwise = Leaf x
add n (Node x left right) | n < x = Node x (add n left) right
                          | n > x = Node x left (add n right)
                          | otherwise = Node x left right

{-
       7
bt1   / \
     4   10
    / \
   2   5

1. Dodaj wartoœæ 6 do rysunku drzewa b1.

         7         7
add 6   / \   =   / \
       4   10    4   10
      / \       / \
     2   5     2   5
                  / \
                 o   6

2. Dodaj wartoœæ 8 do wyniku poprzedniego zadania.

         7         __7__
add 8   / \   =   /     \
       4   10    4       10
      / \       / \     / \
     2   5     2   5   8   o
        / \       / \
       o   6     o   6
-}

{-
ghci> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
ghci> showTree (add 7 bt1)
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree (add 8 bt1)
"7 L(4 L(2) R(5)) R(10 L(8) R(()))"
ghci> showTree (add 8 (add 6 bt1))
"7 L(4 L(2) R(5 L(()) R(6))) R(10 L(8) R(()))"
ghci> showTree (add 9 bt1)
"7 L(4 L(2) R(5)) R(10 L(9) R(()))"
ghci> showTree (add 10 bt1)
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree (add 11 bt1)
"7 L(4 L(2) R(5)) R(10 L(()) R(11))"
-}

-- 5.6

elemTree :: Ord a => a -> Tree a -> Bool
elemTree e (Null) = False
elemTree e (Leaf x) = e == x
elemTree e (Node x left right) | e == x = True
                               | e < x = elemTree e left
                               | e > x = elemTree e right

{-
ghci> elemTree 9 bt1
False
ghci> elemTree 9 bt2
True
ghci> elemTree 9 bt3
False
ghci> elemTree 3 Null
False
ghci> elemTree 3 (Leaf 3)
True
ghci> elemTree 3 (Leaf 5)
False
ghci> elemTree 3 bt1
False
ghci> elemTree 4 bt1
True
-}

{-
Czy funkcja elemTree dzia³a poprawnie dla wszystkich drzew binarnych?
Nie, funkcja elemTree nie dzia³a poprawnie dla wszystkich drzew binarnych.
Funkcja elemTree dzia³a poprawnie tylko dla drzew binarnych, gdzie elementy s¹ uporz¹dkowane zgodnie z regu³¹:
   * Wartoœci w lewym poddrzewie ka¿dego wêz³a s¹ mniejsze ni¿ wartoœæ tego wêz³a.
   * Wartoœci w prawym poddrzewie ka¿dego wêz³a s¹ wieksze ni¿ wartoœæ tego wêze³.
-}

countLeaves :: Tree a -> Int
countLeaves (Null) = 0
countLeaves (Leaf _) = 1
countLeaves (Node _ left right) = countLeaves left + countLeaves right

{-
ghci> countLeaves bt1
3
ghci> countLeaves bt2
5
ghci> countLeaves bt3
1
ghci> countLeaves Null
0
ghci> countLeaves (Leaf 5)
1
ghci> countLeaves (add 6 bt1)
3
-}

-- 5.7

tree2list :: Tree a -> [a]
tree2list (Null) = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = tree2list left ++ [x] ++ tree2list right

{-
ghci> tree2list bt1
[2,4,5,7,10]
ghci> tree2list bt2
[2,4,5,7,9,10,11,13,15]
ghci> tree2list bt3
[1,7]
ghci> tree2list Null
[]
ghci> tree2list (Leaf 5)
[5]
ghci> tree2list bt1
[2,4,5,7,10]
ghci> tree2list (add 6 bt1)
[2,4,5,6,7,10]
-}

{-
Co oznacza m?
Symbol m oznacza indeks œrodkowego elementu listy.

Co oznacza x?
Symbol x oznacza wartoœæ elementu na indeksie m.

              m
        0  1  2  3
list = [1, 3, 5, 7]
              x

              m
        0  1  2  3  4
list = [1, 3, 5, 7, 9]
              x

Etapy tworzenia drzewa dla listy [1,3,5,7].

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
Narysuj etapy tworzenia drzewa dla listy [1,3,5,7,9].

Etapy tworzenia drzewa dla listy [1,3,5,7,9].

      __5__
     /     \
[1,3]       [7,9]

      __5__
     /     \
    3       7
   / \     / \
[1]   [] []   [9]

      __5__
     /     \
    3       7
   / \     / \
  1   o   o   9
-}

{-
ghci> let list = [1,3,5,7]
ghci> length list
4
ghci> length list `div` 2
2
ghci> list !! 2
5
ghci> :t take
take :: Int -> [a] -> [a]
ghci> take 2 list
[1,3]
ghci> :t drop
drop :: Int -> [a] -> [a]
ghci> drop (2 + 1) list
[7]
-}

list2tree :: [a] -> Tree a
list2tree [] = Null
list2tree [x] = Leaf x
list2tree xs = Node (xs !! mid) (list2tree left) (list2tree right)
               where mid = length xs `div` 2
                     left = take mid xs
                     right = drop (mid + 1) xs

{-
ghci> showTree (list2tree [2,4,5,7,10])
"5 L(4 L(2) R(())) R(10 L(7) R(()))"
ghci> showTree (list2tree [2,4,5,7,9,10,11,13,15])
"9 L(5 L(4 L(2) R(())) R(7)) R(13 L(11 L(10) R(())) R(15))"
ghci> showTree (list2tree [1,7])
"7 L(1) R(())"
ghci> showTree (list2tree [])
"()"
ghci> showTree (list2tree [5])
"5"
ghci> showTree (list2tree [1,3,5,7])
"5 L(3 L(1) R(())) R(7)"
ghci> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
ghci> showTree (list2tree (tree2list (add 6 bt1))))
"6 L(4 L(2) R(5)) R(10 L(7) R(()))"
-}

{-
1. Narysuj drzewo, które powstaje w wyniku (add 6 bt1).

      __7__
     /     \
    4       10
   / \
  2   5
     / \
    o   6

2. Narysuj drzewo, które powstaje w wyniku (list2tree (tree2list (add 6 bt1)).

      __6__
     /     \
    4       10
   / \     / \
  2   5   7   o

3. Wyjaœnij ró¿nice miêdzy dwoma powy¿szymi drzewami.
Drzewo (add 6 bt1) powstaje, gdzie element 6 jest bezpoœrednio dodawane do drzewa jako liœæ do odpowiedniego wêz³a.
Drzewo (list2tree (tree2list (add 6 bt1)) na pocz¹tku dzia³a tak samo, ale tree2list sprawia, ¿e lista staje siê uporz¹dkowana.
Po wywo³aniu list2tree powstaje drzewo zbalansowane, czyli wysokoœci podrzew ka¿dego wêz³a ró¿ni¹ siê co najwy¿ej o 1.
-}
