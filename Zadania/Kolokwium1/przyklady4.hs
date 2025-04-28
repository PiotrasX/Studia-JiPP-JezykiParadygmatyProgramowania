import Data.Char

-- Zadanie 1
{-
Napisz funkcjê, która sprawdza, czy punkt 
na p³aszczyŸnie znajduje siê w podanej æwiartce 
uk³adu wspó³rzêdnych.
data Quadrant = I | II | III | IV deriving Show
quadrant :: (Double, Double) -> Quadrant -> Bool
quadrant (0,0) _ = error "the point lies on the origin"
quadrant (x, _) _ | x == 0 = error "the point lies on the axis x"
quadrant (_, y) _ | y == 0 = error "the point lies on the axis y"
-- uzupe³niæ
-}

data Quadrant = I | II | III | IV deriving (Show, Eq)

quadrant :: (Double, Double) -> Quadrant -> Bool
quadrant (0,0) _ = error "the point lies on the origin"
quadrant (x, _) _ | x == 0 = error "the point lies on the axis x"
quadrant (_, y) _ | y == 0 = error "the point lies on the axis y"
quadrant (x, y) z | x > 0 && y > 0 && z == I = True
                  | x < 0 && y > 0 && z == II = True
                  | x < 0 && y < 0 && z == III = True
                  | x > 0 && y < 0 && z == IV = True
                  | otherwise = False

{-
ghci> quadrant (3,5) I
True
ghci> quadrant (3,5) III
False
ghci> quadrant (-3,5) III
False
ghci> quadrant (-3,-5) III
True
ghci> quadrant (3,-5) IV
True
ghci> quadrant (3,-5) I
False
-}



-- Zadanie 2
{-
Podaj implementacjê funkcji, które wyliczaj¹:
 1. Sumê szeregu 2 + 4 + 6 + ... + 2n     -- na listach
 2. Sumê od 1 do n liczb postaci 1/(i^2)  -- rekurencyjnie
-}

suma1 :: Int -> Int
suma1 x = sum [2 * n | n <- [1..x]]

{-
ghci> suma1 0
0
ghci> suma1 1
2
ghci> suma1 2
6
ghci> suma1 3
12
ghci> suma1 4
20
ghci> suma1 5
30
-}

suma2 :: Int -> Double
suma2 n | n < 1 = 0
        | n == 1 = 1/(i^2)
        | otherwise = 1/(i^2) + suma2 (n - 1)
          where i = fromIntegral n

{-
ghci> suma2 (-1)
0.0
ghci> suma2 0
0.0
ghci> suma2 1
1.0
ghci> suma2 2
1.25
ghci> suma2 3
1.3611111111111112
ghci> suma2 4
1.4236111111111112
ghci> suma2 5
1.4636111111111112
ghci> suma2 6
1.4913888888888889
ghci> suma2 7
1.511797052154195
ghci> suma2 8
1.527422052154195
ghci> suma2 9
1.5397677311665408
-}



-- Zadanie 3
{-
Zdefiniuj funkcjê cyfra :: Char -> Int, która zamienia 
na liczbê znak przechowuj¹cy cyfrê. W implementacji 
wykorzystaj funkcjê read. Je¿eli podany znak nie 
przechowuje cyfry, to funkcja wyrzuca wyj¹tek 
"not a digit".
-}

cyfra :: Char -> Int
cyfra x | isDigit x = read [x]
        | otherwise = error "not a digit"

{-
ghci> cyfra '3'
3
ghci> cyfra 'a'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos4.hs:114:23 in main:Main
ghci> cyfra '/'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at kolos4.hs:114:23 in main:Main
-}



-- Zadanie 4
{-
Zdefiniuj rekurencyjnie funkcjê 
odwroc :: String -> String
odwracaj¹ca podany napis.
-}

odwroc :: String -> String
odwroc [] = []
odwroc (x:xs) = odwroc xs ++ [x]

{-
ghci> odwroc "kotek"
"ketok"
ghci> odwroc "Piotr"
"rtoiP"
-}



-- Zadanie 5
{-
Dana jest definicja typu Tree a:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji elemTree sprawdzaj¹cej, 
czy podana wartoœæ znajduje siê 
w drzewie uporz¹dkowanym.
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

elemTree :: Ord a => a -> Tree a -> Bool
elemTree _ (Null) = False
elemTree e (Leaf x) = e == x
elemTree e (Node x left right) | e == x = True
                               | e < x = elemTree e left
                               | e > x = elemTree e right

{-
ghci> elemTree 5 Null
False
ghci> elemTree 5 (Leaf 5)
True
ghci> elemTree 5 (Leaf 6)
False
ghci> elemTree 3 (Node 5 (Leaf 3) Null)
True
ghci> elemTree 3 (Node 5 (Leaf 4) Null)
False
ghci> elemTree 3 (Node 6 (Leaf 3) Null)
True
ghci> elemTree 3 (Node 6 (Leaf 4) Null)
False
ghci> elemTree 5 (Node 5 Null (Leaf 7))
True
ghci> elemTree 5 (Node 5 Null (Leaf 8))
True
ghci> elemTree 5 (Node 6 Null (Leaf 7))
False
ghci> elemTree 5 (Node 6 Null (Leaf 8))
False
ghci> elemTree 5 bt
True
-}
