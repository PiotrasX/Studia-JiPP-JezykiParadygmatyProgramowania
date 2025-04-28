-- Zadanie 1
{-
Zdefiniuj funkcjê zwracaj¹c¹ pole 
prostok¹ta w dwóch wersjach:
f1 - tradycyjnej oraz f2 - u¿ywaj¹c sekcji.
-}

f1 :: Fractional a => a -> a -> a
f1 a b = a * b

f2 :: Fractional a => a -> a -> a
f2 = (*)

{-
ghci> f1 6 3
18
ghci> f2 6 3
18
-}



-- Zadanie 2
{-
Zdefiniuj funkcjê isHexByte sprawdzaj¹c¹ 
czy podany ³añcuch reprezentuje bajt 
zapisany w systemie szesnastkowym.
Wskazówka:
isHexByte :: String -> Bool
...
hexDigit x = x `elem` ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']
-}

hexDigit :: Char -> Bool
hexDigit x = x `elem` ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']

isHexByte :: String -> Bool
isHexByte [y] = hexDigit y
isHexByte [x,y] = hexDigit x && hexDigit y
isHexByte xs = False

{-
ghci> isHexByte "0"
True
ghci> isHexByte "9"
True
ghci> isHexByte "a"
True
ghci> isHexByte "A"
True
ghci> isHexByte "f"
True
ghci> isHexByte "F"
True
ghci> isHexByte "g"
False
ghci> isHexByte "G"
False
ghci> isHexByte "00"
True
ghci> isHexByte "ff"
True
ghci> isHexByte "FF"
True
ghci> isHexByte "gg"
False
ghci> isHexByte "GG"
False
ghci> isHexByte "0f"
True
ghci> isHexByte "0F"
True
ghci> isHexByte "0g"
False
ghci> isHexByte "0G"
False
ghci> isHexByte ""
False
ghci> isHexByte "fff"
False
ghci> isHexByte "FFF"
False
-}



-- Zadanie 3
{-
Przyjmijmy, ¿e wektor w przestrzeni R^3 jest 
zdefiniowany jako trójka liczb typu Double. 
Zdefiniuj operator (*.) mno¿enia skalarnego
wektorów i okreœl jego typ. Operator ma byæ 
prawostronnie ³¹czny z moc¹ wi¹zania 4.
-}

infixr 4 *.
(*.) :: (Double, Double, Double) -> (Double, Double, Double) -> Double
(a1, b1, c1) *. (a2, b2, c2) = a1 * a2 + b1 * b2 + c1 * c2

{-
ghci> (1,2,3) *. (4,5,6)
32.0
-}



-- Zadanie 4
{-
Zdefiniuj rekurencyjnie funkcjê factors zwracaj¹c¹ 
listê podzielników liczby naturalnej n.
Wskazówka:
factors :: Int -> [Int]
factors n = aux n n
...
-}

aux :: Int -> Int -> [Int]
aux x n | x == 1 = [x]
        | n `mod` x == 0 = x : aux (x - 1) n
        | otherwise = aux (x - 1) n

factors :: Int -> [Int]
factors n = aux n n

{-
ghci> factors 5
[5,1]
ghci> factors 7
[7,1]
ghci> factors 9
[9,3,1]
ghci> factors 12
[12,6,4,3,2,1]
ghci> factors 15
[15,5,3,1]
ghci> factors 19
[19,1]
-}



-- Zadanie 5
{-
Dana jest definicja typu Tree a:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Zdefiniuj funkcjê evenLeafs zwracaj¹c¹ listê 
wartoœci parzystych na liœciach drzewa binarnego.
Wskazówka:
evenLeafs :: Integral a => Tree a -> [a]
Obowi¹zkowy test wszystkich czêœci funkcji 
i wywo³ania dla drzewa:
       7
      / \
     4   10
    / \
   2   5
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

evenLeafs :: Integral a => Tree a -> [a]
evenLeafs (Null) = []
evenLeafs (Leaf x) | x `mod` 2 == 0 = [x]
                   | otherwise = []
evenLeafs (Node x left right) = evenLeafs left ++ evenLeafs right

{-
ghci> evenLeafs Null
[]
ghci> evenLeafs (Leaf 5)
[]
ghci> evenLeafs (Leaf 10)
[10]
ghci> evenLeafs (Node 7 (Leaf 5) (Null))
[]
ghci> evenLeafs (Node 7 (Null) (Leaf 10))
[10]
ghci> evenLeafs bt
[2,10]
-}
