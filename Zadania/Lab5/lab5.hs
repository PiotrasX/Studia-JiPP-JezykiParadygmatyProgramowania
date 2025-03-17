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
a ~= b = (a - b < h) && (b - a < h)
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

-- f    -> Funkcja podca³kowa.
-- a, b -> Koñce przedzia³u ca³kowania.
-- n    -> Liczba przedzia³ów na które dzielimy przedzia³ ca³kowania.

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule (f) a b n = sum [h * f x | x <- points]
                          where h = (b - a) / fromIntegral(n)
                                points = [a + fromIntegral(i) * h | i <- [1..n]]

{-
ghci> rectangleRule sin 0 pi 10000
1.9999982
ghci> rectangleRule sqrt 0 1 10000
0.6667168
ghci> rectangleRule (^ 2) 0 1 10000
0.33338326
ghci> rectangleRule (\x -> x^2) 0 1 10000
0.33338326
ghci> rectangleRule ((+) . (* 2) <*> (^ 3)) 0 2 10000
8.001194
ghci> rectangleRule (\x -> x^3 + 2*x) 0 2 10000
8.001194
-}

-- 5.3

-- f    -> Funkcja podca³kowa.
-- a, b -> Koñce przedzia³u ca³kowania.
-- n    -> Liczba przedzia³ów na które dzielimy przedzia³ ca³kowania.

trapezoidalRule :: (Float -> Float) -> Float -> Float -> Int -> Float
trapezoidalRule (f) a b n = (h / 2) * (f a + f b) + sum [h * f x | x <- points]
                            where h = (b - a) / fromIntegral(n)
                                  points = [a + fromIntegral(i) * h | i <- [1..(n - 1)]]

{-
ghci> trapezoidalRule sin 0 pi 10000
1.9999982
ghci> trapezoidalRule sqrt 0 1 10000
0.6666668
ghci> trapezoidalRule (^ 2) 0 1 10000
0.33333328
ghci> trapezoidalRule (\x -> x^2) 0 1 10000
0.33333328
ghci> trapezoidalRule ((+) . (* 2) <*> (^ 3)) 0 2 10000
7.999994
ghci> trapezoidalRule (\x -> x^3 + 2*x) 0 2 10000
7.999994
-}

-- 5.4

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
bt3 = Node 7 (Leaf 1) Null

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
-}

showTree :: Show a => Tree a -> String
showTree (Null) = "()"
showTree (Leaf x) = show x
showTree (Node x left right) = show x ++ " L(" ++ showTree left ++ ")" ++ " R(" ++ showTree right ++ ")"

{-
ghci> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
ghci> showTree bt3
"7 L(1) R(())"
-}

-- 5.5

add :: Ord a => a -> Tree a -> Tree a
add n (Null) = Leaf n
add n (Leaf x) | n < x = Node x (Leaf n) Null
               | n > x = Node x Null (Leaf n)
               | otherwise = Leaf x
add n (Node x left right) | n < x = Node x (add n left) right
                          | n > x = Node x left (add n right)
                          | otherwise = Node x left right

{-
ghci> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
ghci> showTree (add 7 bt1)
"7 L(4 L(2) R(5)) R(10)"
ghci> showTree (add 8 bt1)
"7 L(4 L(2) R(5)) R(10 L(8) R(()))"
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
ghci> elemTree 7 bt3
True
ghci> elemTree 5 bt3
False
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
-}
