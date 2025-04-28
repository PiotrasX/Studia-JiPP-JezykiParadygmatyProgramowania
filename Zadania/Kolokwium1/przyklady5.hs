-- Zadanie 1
{-
Podaj implementacjê funkcji leg :: Int -> Int -> Int, 
która przyjmuje dwa argumenty a i b i zwraca:
 * 1  gdy a < b
 * -1 gdy b < a
 *  0 gdy a = b
-}

leg :: Int -> Int -> Int
leg a b | a < b = 1
        | a > b = -1
        | a == b = 0

{-
ghci> leg 3 5
1
ghci> leg 5 3
-1
ghci> leg 3 3
0
-}



-- Zadanie 2
{-
Przyjmijmy, ¿e liczba zespolona jest zapisywana jako 
dwuelementowa lista wartoœci typu Double. 
Podaj implementacjê operatora mno¿enia
liczb zespolonych.
-}

{-
z1 = a + b*i
z2 = c + d*i

z1*z2 = (a + b*i)*(c + d*i) = a*c + a*d*i + b*c*i - b*d = (a*c - b*d) + (a*d + b*c)*i
-}

infixl 7 *.
(*.) :: [Double] -> [Double] -> [Double]
[a, b] *. [c, d] = [a*c - b*d, a*d + b*c]

{-
ghci> [3, 4] *. [5, 7]
[-13.0,41.0]
-}



-- Zadanie 3
{-
Podaj implementacjê funkcji f, która jako argument 
przyjmuje listê dowolnych wartoœci i zwraca listê 
wartoœci o indeksach nieparzystych. 
(Uwaga: funkcja dzia³a dla list dowolnych typów.)
-}

f :: [a] -> [a]
f [] = []
f [_] = []
f (x1:x2:xs) = x2 : f xs

{-
ghci> f [0,1,2,3,4,5]
[1,3,5]
ghci> f [0,1,2,3,4]
[1,3]
ghci> f [0,1,2,3]
[1,3]
ghci> f [0,1,2]
[1]
ghci> f [0,1]
[1]
ghci> f [0]
[]
ghci> f []
[]
-}



-- Zadanie 4
{-
Podaj kod pozwalaj¹cy na obliczenie:
 1. Suma od 1 do 2000 liczb postaci 2/(i^2 + 1)
 2. Iloczyn od 20 do 45 liczb postaci sin x * cos x
-}

suma :: Double
suma = sum [2/(i^2 + 1) | i <- [1..2000]]

{-
ghci> suma
2.1523483449787726
-}

iloczyn :: Double
iloczyn = product [sin x * cos x | x <- [20..45]]

{-
ghci> iloczyn
1.7351710457045287e-17
-}



-- Zadanie 5
{-
Dana jest definicja typu Tree a:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji sumTree, która zwraca 
sumê liczb przechowywanych w drzewie 
(zak³adamy, ¿e typ a nale¿y do klasy Num).
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

sumTree :: Num a => Tree a -> a
sumTree (Null) = 0
sumTree (Leaf x) = x
sumTree (Node x left right) = x + sumTree left + sumTree right

{-
ghci> sumTree Null
0
ghci> sumTree (Leaf 5)
5
ghci> sumTree (Leaf 6)
6
ghci> sumTree (Node 5 (Leaf 3) Null)
8
ghci> sumTree (Node 5 (Leaf 4) Null)
9
ghci> sumTree (Node 6 (Leaf 3) Null)
9
ghci> sumTree (Node 6 (Leaf 4) Null)
10
ghci> sumTree (Node 5 Null (Leaf 7))
12
ghci> sumTree (Node 5 Null (Leaf 8))
13
ghci> sumTree (Node 6 Null (Leaf 7))
13
ghci> sumTree (Node 6 Null (Leaf 8))
14
ghci> sumTree bt
28
-}
