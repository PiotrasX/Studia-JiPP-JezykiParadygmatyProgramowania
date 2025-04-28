import Data.Char

-- Zadanie 1
{-
Zdefiniuj funkcjê zwracaj¹c¹ pole trójk¹ta 
w dwóch wersjach: 
f1 - tradycyjnej oraz f2 - u¿ywaj¹c sekcji.
-}

f1 :: Fractional a => a -> a -> a
f1 a h = a * h / 2

f2 :: Fractional a => a -> a -> a
f2 = (*) . (/ 2)

{-
ghci> f1 4 5
10.0
ghci> f2 4 5
10.0
-}



-- Zadanie 2
{-
Zdefiniuj funkcjê byte2int konwertuj¹c¹ ³añcuch 
reprezentuj¹cy bajt zapisany w systemie 
szesnastkowym na liczbê dziesiêtn¹.
Wskazówka:
import Data.Char -- dodaæ na pocz¹tku pliku
byte2int :: String -> Int
...
dec x | elem x ['0'..'9'] = ord x - ord '0'
...
-}

byte2int :: String -> Int
byte2int [y] = dec y
byte2int [x,y] = dec x * 16 + dec y
byte2int xs = error "is no byte"

dec x | elem x ['0'..'9'] = ord x - ord '0'
      | elem x ['a'..'f'] = ord x - ord 'a' + 10
      | elem x ['A'..'F'] = ord x - ord 'A' + 10
      | otherwise = error "is no byte"

{-
ghci> byte2int "0"
0
ghci> byte2int "9"
9
ghci> byte2int "a"
10
ghci> byte2int "A"
10
ghci> byte2int "f"
15
ghci> byte2int "F"
15
ghci> byte2int "g"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "G"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "00"
0
ghci> byte2int "09"
9
ghci> byte2int "0a"
10
ghci> byte2int "0A"
10
ghci> byte2int "0f"
15
ghci> byte2int "0F"
15
ghci> byte2int "0g"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "0G"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "10"
16
ghci> byte2int "99"
153
ghci> byte2int "aa"
170
ghci> byte2int "AA"
170
ghci> byte2int "ff"
255
ghci> byte2int "FF"
255
ghci> byte2int "gg"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "GG"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:46:21 in main:Main
ghci> byte2int "fff"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:41:15 in main:Main
ghci> byte2int "FFF"
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:41:15 in main:Main
ghci> byte2int ""
*** Exception: is no byte
CallStack (from HasCallStack):
  error, called at kolos2.hs:41:15 in main:Main
-}



-- Zadanie 3
{-
Przyjmijmy, ¿e liczba zespolona zdefiniowana jest 
jako para liczb typu Double. Zdefiniuj operator 
(*.) mno¿enia liczb zespolonych i okreœl jego typ.
Operator ma mieæ moc wi¹zania i rodzaj wi¹zania 
taki sam jak dla mno¿enia liczb rzeczywistych.
-}

{-
z1 = a + b*i
z2 = c + d*i

z1*z2 = (a + b*i)*(c + d*i) = a*c + a*d*i + b*c*i - b*d = (a*c - b*d) + (a*d + b*c)*i
-}

infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) *. (c, d) = (a*c - b*d, a*d + b*c)

{-
ghci> (5, 2) *. (3, -7)
(29.0,-29.0)
-}



-- Zadanie 4
{-
Zdefiniuj rekurencyjnie funkcjê digits zwracaj¹c¹ 
liczbê cyfr liczby ca³kowitej x.
Wskazówka: w implementacji wykorzystaj funkcjê quot.
-}

digits :: Int -> Int
digits x | x < 0 = digits (abs x)
         | x < 10 = 1
         | otherwise = 1 + digits (x `quot` 10)

{-
ghci> digits (-123)
3
ghci> digits (-12)
2
ghci> digits (-1)
1
ghci> digits (0)
1
ghci> digits 1
1
ghci> digits 12
2
ghci> digits 123
3
-}



-- Zadanie 5
{-
Dana jest definicja typu Tree a:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Zdefiniuj funkcjê addOddNodes zwracaj¹c¹ sumê 
wartoœci nieparzystych na wêz³ach drzewa binarnego.
Wskazówka:
addOddNodes :: Integral a => Tree a -> a
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

addOddNodes :: Integral a => Tree a -> a
addOddNodes (Null) = 0
addOddNodes (Leaf x) | x `mod` 2 == 1 = x
                     | otherwise = 0
addOddNodes (Node x left right) | x `mod` 2 == 1 = x + aonl + aonr
                                | otherwise = aonl + aonr
                                  where aonl = addOddNodes left
                                        aonr = addOddNodes right

{-
ghci> addOddNodes Null
0
ghci> addOddNodes (Leaf 5)
5
ghci> addOddNodes (Leaf 6)
0
ghci> addOddNodes (Node 5 (Leaf 3) Null)
8
ghci> addOddNodes (Node 5 (Leaf 4) Null)
5
ghci> addOddNodes (Node 6 (Leaf 3) Null)
3
ghci> addOddNodes (Node 6 (Leaf 4) Null)
0
ghci> addOddNodes (Node 5 Null (Leaf 7))
12
ghci> addOddNodes (Node 5 Null (Leaf 8))
5
ghci> addOddNodes (Node 6 Null (Leaf 7))
7
ghci> addOddNodes (Node 6 Null (Leaf 8))
0
ghci> addOddNodes bt
12
-}
