import Data.Char

-- Zadanie 1
{-
Podaj definicjê operatora ?? sprawdzaj¹cego, 
czy dwa punkty na podzbiorze [a] p³aszczyzny le¿¹
na prostej równoleg³ej do osi x lub osi y.
Moc wi¹zania okreœl na 4. 
Jaki rodzaj wi¹zania powinien mieæ ten operator?
-}

infixl 4 ??
(??) :: (Double, Double) -> (Double, Double) -> Bool
(a, b) ?? (c, d) | a == c = True
                 | b == d = True
                 | otherwise = False

{-
ghci> (2,3) ?? (2,5)
True
ghci> (2,3) ?? (5,3)
True
ghci> (2,3) ?? (5,7)
False
-}



-- Zadanie 2
{-
Zdefiniuj funkcjê, która zwraca listê elementów 
o indeksach nieparzystych z danej listy.
oddElements :: [t] -> [t]
-}

oddElements :: [t] -> [t]
oddElements [] = []
oddElements [_] = []
oddElements (x1:x2:xs) = x2 : oddElements xs

{-
ghci> oddElements [0,1,2,3,4,5]
[1,3,5]
ghci> oddElements [0,1,2,3,4]
[1,3]
ghci> oddElements [0,1,2,3]
[1,3]
ghci> oddElements [0,1,2]
[1]
ghci> oddElements [0,1]
[1]
ghci> oddElements [0]
[]
ghci> oddElements []
[]
-}



-- Zadanie 3
{-
Zdefiniuj funkcjê litera :: Char -> Bool, 
która sprawdza, czy podany znak przechowuje 
du¿¹ lub ma³¹ literê alfabetu.
-}

litera :: Char -> Bool
litera x = (v >= 65 && v <= 90) || (v >= 97 && v <= 122)
           where v = ord x

{-
ghci> litera 's'
True
ghci> litera 'S'
True
ghci> litera '/'
False
ghci> litera '3'
False
-}



-- Zadanie 4
{-
Podaj implementacjê funkcji, które wyliczaj¹:
 1. Iloczyn od 1 do n liczb postaci (i+2)/(i^3)  -- rekurencyjnie
 2. Sumê szeregu 1 + 3 + 5 + ... + 2n-1          -- na listach
-}

iloczyn :: Int -> Double
iloczyn n | n < 1 = 0
          | n == 1 = (i+2)/(i^3)
          | otherwise = (i+2)/(i^3) * iloczyn (n - 1)
            where i = fromIntegral n

{-
ghci> iloczyn 0
0.0
ghci> iloczyn 1
3.0
ghci> iloczyn 2
1.5
ghci> iloczyn 3
0.2777777777777778
ghci> iloczyn 4
2.6041666666666668e-2
ghci> iloczyn 5
1.4583333333333334e-3
ghci> iloczyn 6
5.401234567901234e-5
ghci> iloczyn 7
1.417233560090703e-6
-}

suma :: Int -> Int
suma n = sum [2*x - 1 | x <- [1..n]]

{-
ghci> suma 0
0
ghci> suma 1
1
ghci> suma 2
4
ghci> suma 3
9
ghci> suma 4
16
ghci> suma 5
25
-}



-- Zadanie 5
{-
Dana jest definicja typu Tree a:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji tree2List
przekszta³caj¹cej drzewo na listê wartoœci.
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

tree2List :: Ord a => Tree a -> [a]
tree2List (Null) = []
tree2List (Leaf x) = [x]
tree2List (Node x left right) = tree2List left ++ [x] ++ tree2List right

{-
ghci> tree2List Null
[]
ghci> tree2List (Leaf 5)
[5]
ghci> tree2List (Leaf 6)
[6]
ghci> tree2List (Node 5 (Leaf 3) Null)
[3,5]
ghci> tree2List (Node 5 (Leaf 4) Null)
[4,5]
ghci> tree2List (Node 6 (Leaf 3) Null)
[3,6]
ghci> tree2List (Node 6 (Leaf 4) Null)
[4,6]
ghci> tree2List (Node 5 Null (Leaf 7))
[5,7]
ghci> tree2List (Node 5 Null (Leaf 8))
[5,8]
ghci> tree2List (Node 6 Null (Leaf 7))
[6,7]
ghci> tree2List (Node 6 Null (Leaf 8))
[6,8]
ghci> tree2List bt
[2,4,5,7,10]
-}
