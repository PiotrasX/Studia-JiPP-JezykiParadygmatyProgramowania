-- Zadanie 1
{-
Zdefiniuj poni¿sze funkcje analogicznie do funkcji 
string2int x = (read x) :: Integer.
 1. string2int'2 - rekurencyjnie, wykorzystaæ funkcjê length 
    dla list, wyj¹tek "pusta lista", trzy wiersze definicji
 2. string2int'3 - analogicznie do funkcji string2int'2, 
    wykorzystaæ instrukcjê if..else, dwa wiersze definicji
 3. string2int'4 - bez jawnej rekurencji, wykorzystaæ funkcjê 
    foldl dla list, a w niej funkcjê dwuargumentow¹,
    jeden wiersz definicji
Wskazówka: W ka¿dym podpunkcie wykorzystaæ jedn¹ z definicji 
funkcji cyfra.
• Definicja 1
cyfra :: Num a => Char -> a
cyfra '0' = 0
--
-- ... uzupe³niæ resztê
--
cyfra '9' = 9
• Definicja 2
cyfra :: Num a => Char -> a
cyfra x | x == '0' = 0
        --
        -- ... uzupe³niæ resztê
        --
        | x == '9' = 9
-}

cyfra :: Num a => Char -> a
cyfra '0' = 0
cyfra '1' = 1
cyfra '2' = 2
cyfra '3' = 3
cyfra '4' = 4
cyfra '5' = 5
cyfra '6' = 6
cyfra '7' = 7
cyfra '8' = 8
cyfra '9' = 9

cyfra' :: Num a => Char -> a
cyfra' x | x == '0' = 0
         | x == '1' = 1
         | x == '2' = 2
         | x == '3' = 3
         | x == '4' = 4
         | x == '5' = 5
         | x == '6' = 6
         | x == '7' = 7
         | x == '8' = 8
         | x == '9' = 9

string2int :: String -> Integer
string2int [] = error "pusta lista"
string2int x = (read x) :: Integer

{-
ghci> string2int ""
*** Exception: pusta lista
CallStack (from HasCallStack):
  error, called at kolos7.hs:55:17 in main:Main
ghci> string2int "35"
35
ghci> string2int "1337"
1337
-}

string2int'2 :: String -> Integer
string2int'2 xs | length xs == 0 = error "pusta lista"
                | length xs == 1 = cyfra (xs !! 0)
                | otherwise = (cyfra (xs !! 0)) * (10^(length xs - 1)) + (string2int'2 (drop 1 xs))

{-
ghci> string2int'2 ""
*** Exception: pusta lista
CallStack (from HasCallStack):
  error, called at kolos7.hs:68:36 in main:Main
ghci> string2int'2 "35"
35
ghci> string2int'2 "1337"
1337
-}

string2int'3 :: String -> Integer
string2int'3 xs = if length xs == 0 then 0
                  else (cyfra' (xs !! 0)) * (10^(length xs - 1)) + (string2int'3 (drop 1 xs))

{-
ghci> string2int'3 ""
0
ghci> string2int'3 "35"
35
ghci> string2int'3 "1337"
1337
-}

string2int'4 :: String -> Integer
string2int'4 xs = foldl (\acc x -> acc * 10 + x) 0 [cyfra x | x <- xs]

{-
ghci> string2int'3 ""
0
ghci> string2int'3 "35"
35
ghci> string2int'3 "1337"
1337
-}



-- Zadanie 2
{-
Podaj implementacjê funkcji horner wyliczaj¹cej 
wartoœæ wielomianu w punkcie x metod¹ hornera.
horner :: Num a => [a] -> a -> a
Funkcja pobiera listê wspó³czynników wielomianu 
oraz liczbê x dla której liczymy wartoœæ wielomianu.
[1,2,3,4] x  <=>  1 + 2·x + 3·x^2 + 4·x^3  =  1 + x(2 + x(3 + x4))
Rozwi¹zaæ na dwa sposoby:
 1. rekurencyjnie, trzy wiersze definicji
 2. z wykorzystaniem funkcji foldr
-}

horner :: Num a => [a] -> a -> a
horner [] _ = error "Brak argumentow"
horner [a] _ = a
horner (a:as) x = a + x * horner as x

{-
ghci> horner [] 5
*** Exception: Brak argumentow
CallStack (from HasCallStack):
  error, called at kolos7.hs:126:15 in main:Main
ghci> horner [7] 5
7
ghci> horner [1] 5
1
ghci> horner [1,2] 5
11
ghci> horner [1,2,3] 5
86
ghci> horner [1,2,3,4] 5
586
-}

horner' :: Num a => [a] -> a -> a
horner' es x | length es < 1 = error "Brak argumentow"
             | otherwise = foldr (\a acc -> a + x * acc) 0 es

{-
ghci> horner' [] 5
*** Exception: Brak argumentow
CallStack (from HasCallStack):
  error, called at kolos7.hs:148:32 in main:Main
ghci> horner' [7] 5
7
ghci> horner' [1] 5
1
ghci> horner' [1,2] 5
11
ghci> horner' [1,2,3] 5
86
ghci> horner' [1,2,3,4] 5
586
-}



-- Zadanie 3
{-
Podaj implementacjê funkcji polinomial 
wyliczaj¹cej wartoœæ wielomianu w dowolnym punkcie.
polinomial :: Num a => [a] -> a -> a
Funkcja pobiera listê wspó³czynników wielomianu 
oraz liczbê x dla której liczymy wartoœæ wielomianu.
[1,2,3,4] x  <=>  1 + 2·x + 3·x^2 + 4·x^3
Implementacja funkcji nie mo¿e siê opieraæ na schemacie hornera.
-}

polinomial :: Num a => [a] -> a -> a
polinomial es x | length es < 1 = error "Brak argumentow"
                | length es == 1 = es !! 0
                | otherwise = (es !! (length es - 1)) * x^(length es - 1) + polinomial (take (length es - 1) es) x

{-
ghci> polinomial [] 5
*** Exception: Brak argumentow
CallStack (from HasCallStack):
  error, called at kolos7.hs:182:35 in main:Main
ghci> polinomial [7] 5
7
ghci> polinomial [1] 5
1
ghci> polinomial [1,2] 5
11
ghci> polinomial [1,2,3] 5
86
ghci> polinomial [1,2,3,4] 5
586
-}

polinomial' :: Num a => [a] -> a -> a
polinomial' es x | length es < 1 = error "Brak argumentow"
                 | otherwise = foldr (+) 0 [(es !! y) * x^y | y <- [0..(length es - 1)]]

{-
ghci> polinomial' [] 5
*** Exception: Brak argumentow
CallStack (from HasCallStack):
  error, called at kolos7.hs:191:36 in main:Main
ghci> polinomial' [7] 5
7
ghci> polinomial' [1] 5
1
ghci> polinomial' [1,2] 5
11
ghci> polinomial' [1,2,3] 5
86
ghci> polinomial' [1,2,3,4] 5
586
-}



-- Zadanie 4
{-
Podaj implementacjê funkcji bin2dec 
zamieniaj¹cej liczbê binarn¹ na liczbê dziesiêtn¹.
bin2dec :: [Int] -> Int
Funkcja pobiera liczbê binarn¹ w postaci listy 
wartoœci 0 lub 1 i zamienia j¹ na liczbê dziesiêtn¹.
[1,0,1,1] === (1011)\/2 = 1·2^0 + 1·2^1 + 0·2^2 + 1·2^3 = 11
Jeœli lista nie zawiera liczby binarnej, to pojawia 
siê komunikat o b³êdzie o treœci: not a binary number.
Rozwi¹zaæ na dwa sposoby:
 1. rekurencyjnie
 2. z wykorzystaniem funkcji foldl
    wskazówka: (1011)\/2 = (((0·2 + 1)·2 + 0)·2 + 1)·2 + 1
Wskazówka: W obu przypadkach wykorzystaæ funkcjê
pomocnicz¹ notBin b = b /= 0 && b /= 1.
-}

notBin :: Int -> Bool
notBin b = b /= 0 && b /= 1

bin2dec :: [Int] -> Int
bin2dec xs | length xs < 1 = error "no arguments"
           | notBin (xs !! (length xs - 1)) = error "not a binary number"
           | length xs == 1 = (xs !! 0)
           | otherwise = (xs !! 0) * 2^(length xs - 1) + bin2dec (drop 1 xs)

{-
ghci> bin2dec []
*** Exception: no arguments
CallStack (from HasCallStack):
  error, called at kolos7.hs:248:30 in main:Main
ghci> bin2dec [0]
0
ghci> bin2dec [1]
1
ghci> bin2dec [2]
*** Exception: not a binary number
CallStack (from HasCallStack):
  error, called at kolos7.hs:249:47 in main:Main
ghci> bin2dec [1,0]
2
ghci> bin2dec [1,1]
3
ghci> bin2dec [1,0,0]
4
ghci> bin2dec [1,0,1]
5
ghci> bin2dec [1,1,0]
6
ghci> bin2dec [1,1,1]
7
ghci> bin2dec [1,0,0,0]
8
ghci> bin2dec [1,1,0,1]
13
ghci> bin2dec [1,0,1,1]
11
-}

bin2dec' :: [Int] -> Int
bin2dec' xs | length xs < 1 = error "no arguments"
            | all notBin xs = error "not a binary number"
            | otherwise = foldl (\acc x -> acc * 2 + x) 0 [x | x <- xs]

{-
ghci> bin2dec' []
*** Exception: no arguments
CallStack (from HasCallStack):
  error, called at kolos7.hs:287:31 in main:Main
ghci> bin2dec' [0]
0
ghci> bin2dec' [1]
1
ghci> bin2dec' [2]
*** Exception: not a binary number
CallStack (from HasCallStack):
  error, called at kolos7.hs:288:31 in main:Main
ghci> bin2dec' [1,0]
2
ghci> bin2dec' [1,1]
3
ghci> bin2dec' [1,0,0]
4
ghci> bin2dec' [1,0,1]
5
ghci> bin2dec' [1,1,0]
6
ghci> bin2dec' [1,1,1]
7
ghci> bin2dec' [1,0,0,0]
8
ghci> bin2dec' [1,1,0,1]
13
ghci> bin2dec' [1,0,1,1]
11
-}



-- Zadanie 5
{-
Podaj implementacjê funkcji dec2bin zamieniaj¹cej 
dodatni¹ liczbê dziesiêtn¹ na liczbê binarn¹.
dec2bin :: Int -> [Int]
dec2bin x | x == 0 || x == 1 = [x]
          | /* uzupe³niæ */
Funkcja pobiera dodatni¹ liczbê dziesiêtn¹ i zamienia 
j¹ na liczbê binarn¹ w postaci listy wartoœci 0 lub 1.
Wskazówka:
11 / 2 = 5   r = 1
5 / 2 = 2    r = 1
2 / 2 = 1    r = 0
1 / 2 = 0    r = 1
11 = (1011)\/2 === [1,0,1,1]
W implementacji u¿yj funkcji quot oraz rem.
-}

dec2bin :: Int -> [Int]
dec2bin x | x == 0 || x == 1 = [x]
          | otherwise = dec2bin q ++ [r]
            where q = quot x 2
                  r = rem x 2

{-
ghci> dec2bin 0
[0]
ghci> dec2bin 1
[1]
ghci> dec2bin 2
[1,0]
ghci> dec2bin 3
[1,1]
ghci> dec2bin 4
[1,0,0]
ghci> dec2bin 5
[1,0,1]
ghci> dec2bin 6
[1,1,0]
ghci> dec2bin 7
[1,1,1]
ghci> dec2bin 8
[1,0,0,0]
ghci> dec2bin 13
[1,1,0,1]
ghci> dec2bin 11
[1,0,1,1]
-}



-- Zadanie 6
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji leafs zwracaj¹cej 
listê wartoœci na liœciach drzewa binarnego.
leafs :: Tree a -> [a]
-}

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

leafs :: Tree a -> [a]
leafs (Null) = []
leafs (Leaf x) = [x]
leafs (Node x left right) = leafs left ++ leafs right

{-
ghci> leafs Null
[]
ghci> leafs (Leaf 5)
[5]
ghci> leafs (Leaf 6)
[6]
ghci> leafs (Node 5 (Leaf 3) Null)
[3]
ghci> leafs (Node 5 (Leaf 4) Null)
[4]
ghci> leafs (Node 6 (Leaf 3) Null)
[3]
ghci> leafs (Node 6 (Leaf 4) Null)
[4]
ghci> leafs (Node 5 Null (Leaf 7))
[7]
ghci> leafs (Node 5 Null (Leaf 8))
[8]
ghci> leafs (Node 6 Null (Leaf 7))
[7]
ghci> leafs (Node 6 Null (Leaf 8))
[8]
ghci> leafs bt1
[2,5,10]
ghci> leafs bt2
[2,5,9,11,15]
-}



-- Zadanie 7
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji cgtx4tree zwracaj¹cej 
liczbê wêz³ów w drzewie binarnym z wartoœciami wiêkszymi od x.
cgtx4tree :: (Num a, Ord a1) => a1 -> Tree a1 -> a
-}

cgtx4tree :: (Num a, Ord a1) => a1 -> Tree a1 -> a
cgtx4tree x (Null) = 0
cgtx4tree x (Leaf y) | y > x = 1
                     | otherwise = 0
cgtx4tree x (Node y left right) | y > x = 1 + addl + addr
                                | otherwise = addl + addr
                                  where addl = cgtx4tree x left
                                        addr = cgtx4tree x right

{-
ghci> cgtx4tree 5 Null
0
ghci> cgtx4tree 5 (Leaf 5)
0
ghci> cgtx4tree 5 (Leaf 6)
1
ghci> cgtx4tree 5 (Node 5 (Leaf 3) Null)
0
ghci> cgtx4tree 5 (Node 5 (Leaf 4) Null)
0
ghci> cgtx4tree 5 (Node 6 (Leaf 3) Null)
1
ghci> cgtx4tree 5 (Node 6 (Leaf 4) Null)
1
ghci> cgtx4tree 5 (Node 5 Null (Leaf 7))
1
ghci> cgtx4tree 5 (Node 5 Null (Leaf 8))
1
ghci> cgtx4tree 5 (Node 6 Null (Leaf 7))
2
ghci> cgtx4tree 5 (Node 6 Null (Leaf 8))
2
ghci> cgtx4tree 5 bt1
2
ghci> cgtx4tree 5 bt2
6
-}



-- Zadanie 8
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji gtx4tree zwracaj¹cej 
listê wartoœci wêz³ów w drzewie binarnym wiêkszych od x.
gtx4tree :: Ord a => a -> Tree a -> [a]
-}

gtx4tree :: Ord a => a -> Tree a -> [a]
gtx4tree x (Null) = []
gtx4tree x (Leaf y) | y > x = [y]
                    | otherwise = []
gtx4tree x (Node y left right) | y > x = gtxl ++ [y] ++ gtxr
                               | otherwise = gtxl ++ gtxr
                                 where gtxl = gtx4tree x left
                                       gtxr = gtx4tree x right

{-
ghci> gtx4tree 5 Null
[]
ghci> gtx4tree 5 (Leaf 5)
[]
ghci> gtx4tree 5 (Leaf 6)
[6]
ghci> gtx4tree 5 (Node 5 (Leaf 3) Null)
[]
ghci> gtx4tree 5 (Node 5 (Leaf 4) Null)
[]
ghci> gtx4tree 5 (Node 6 (Leaf 3) Null)
[6]
ghci> gtx4tree 5 (Node 6 (Leaf 4) Null)
[6]
ghci> gtx4tree 5 (Node 5 Null (Leaf 7))
[7]
ghci> gtx4tree 5 (Node 5 Null (Leaf 8))
[8]
ghci> gtx4tree 5 (Node 6 Null (Leaf 7))
[6,7]
ghci> gtx4tree 5 (Node 6 Null (Leaf 8))
[6,8]
ghci> gtx4tree 5 bt1
[7,10]
ghci> gtx4tree 5 bt2
[7,9,10,11,13,15]
-}



-- Zadanie 9
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji cgtx4leafs zwracaj¹cej 
liczbê liœci w drzewie binarnym z wartoœciami wiêkszymi od x.
cgtx4leafs :: (Num a, Ord a1) => a1 -> Tree a1 -> a
-}

cgtx4leafs :: (Num a, Ord a1) => a1 -> Tree a1 -> a
cgtx4leafs x (Null) = 0
cgtx4leafs x (Leaf y) | y > x = 1
                      | otherwise = 0
cgtx4leafs x (Node y left right) = cgtx4leafs x left + cgtx4leafs x right

{-
ghci> cgtx4leafs 5 Null
0
ghci> cgtx4leafs 5 (Leaf 5)
0
ghci> cgtx4leafs 5 (Leaf 6)
1
ghci> cgtx4leafs 5 (Node 5 (Leaf 3) Null)
0
ghci> cgtx4leafs 5 (Node 5 (Leaf 4) Null)
0
ghci> cgtx4leafs 5 (Node 6 (Leaf 3) Null)
0
ghci> cgtx4leafs 5 (Node 6 (Leaf 4) Null)
0
ghci> cgtx4leafs 5 (Node 5 Null (Leaf 7))
1
ghci> cgtx4leafs 5 (Node 5 Null (Leaf 8))
1
ghci> cgtx4leafs 5 (Node 6 Null (Leaf 7))
1
ghci> cgtx4leafs 5 (Node 6 Null (Leaf 8))
1
ghci> cgtx4leafs 5 bt1
1
ghci> cgtx4leafs 5 bt2
3
-}



-- Zadanie 10
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji gtx4leafs zwracaj¹cej 
listê wartoœci liœci w drzewie binarnym wiêkszych od x.
gtx4leafs :: Ord a => a -> Tree a -> [a]
-}

gtx4leafs :: Ord a => a -> Tree a -> [a]
gtx4leafs x (Null) = []
gtx4leafs x (Leaf y) | y > x = [y]
                     | otherwise = []
gtx4leafs x (Node y left right) = gtx4leafs x left ++ gtx4leafs x right

{-
ghci> gtx4leafs 5 Null
[]
ghci> gtx4leafs 5 (Leaf 5)
[]
ghci> gtx4leafs 5 (Leaf 6)
[6]
ghci> gtx4leafs 5 (Node 5 (Leaf 3) Null)
[]
ghci> gtx4leafs 5 (Node 5 (Leaf 4) Null)
[]
ghci> gtx4leafs 5 (Node 6 (Leaf 3) Null)
[]
ghci> gtx4leafs 5 (Node 6 (Leaf 4) Null)
[]
ghci> gtx4leafs 5 (Node 5 Null (Leaf 7))
[7]
ghci> gtx4leafs 5 (Node 5 Null (Leaf 8))
[8]
ghci> gtx4leafs 5 (Node 6 Null (Leaf 7))
[7]
ghci> gtx4leafs 5 (Node 6 Null (Leaf 8))
[8]
ghci> gtx4leafs 5 bt1
[10]
ghci> gtx4leafs 5 bt2
[9,11,15]
-}



-- Zadanie 11
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj implementacjê funkcji equal sprawdzaj¹cej, 
czy dwa drzewa binarne s¹ identyczne.
Wskazówka:
equal :: Eq a => Tree a -> Tree a -> Bool
equal Null Null = /* ... */
equal /* ... */ = a == b
equal (Node a1 left1 right1) /* ... */ = a1 == a2 && /* ... */
equal _ _ = False
W powy¿szym zarysie implementacji zamieñ komentarze /* ... */ na odpowiedni kod.
-}

equal :: Eq a => Tree a -> Tree a -> Bool
equal Null Null = True
equal (Leaf a) (Leaf b) = a == b
equal (Node a1 left1 right1) (Node a2 left2 right2) = a1 == a2 && (equal left1 left2) && (equal right1 right2)
equal _ _ = False

{-
ghci> equal Null Null
True
ghci> equal Null (Leaf 3)
False
ghci> equal Null bt1
False
ghci> equal (Leaf 3) (Leaf 3)
True
ghci> equal (Leaf 3) (Leaf 7)
False
ghci> equal (Leaf 3) bt1
False
ghci> equal (Node 5 (Leaf 3) Null) (Node 5 (Leaf 3) Null)
True
ghci> equal (Node 5 (Leaf 3) Null) (Node 5 (Leaf 1) Null)
False
ghci> equal (Node 5 (Leaf 3) Null) (Node 4 (Leaf 3) Null)
False
ghci> equal (Node 5 (Leaf 3) Null) (Node 5 Null (Leaf 7))
False
ghci> equal (Node 5 (Leaf 3) Null) (Node 5 (Leaf 3) (Leaf 7))
False
ghci> equal bt1 bt2
False
ghci> equal bt2 (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15))))
True
-}



-- Zadanie 12
{-
Definicja drzewa binarnego ma postaæ:
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null
Podaj definicjê funkcji ordered sprawdzaj¹cej, 
czy drzewo binarne jest uporz¹dkowane.
Wskazówka:
ordered :: Ord a => Tree a -> Bool
ordered Null = True
ordered (Leaf _) = /* ... */
ordered (Node a Null Null) = True
ordered (Node a Null right) = a < root right && /* ... */
ordered (Node a left Null) = /* ... */ && ordered left
ordered (Node a left right) = /* ... */
root :: Tree t -> t
root Null = error "there is no root in empty tree"
root /* ... */
root /* ... */
W powy¿szym zarysie implementacji zamieñ komentarze /* ... */ na odpowiedni kod.
-}

ordered :: Ord a => Tree a -> Bool
ordered Null = True
ordered (Leaf _) = True
ordered (Node a Null Null) = True
ordered (Node a Null right) = a < root right && ordered right
ordered (Node a left Null) = a > root left && ordered left
ordered (Node a left right) = a < root right && a > root left && ordered right && ordered left

root :: Tree t -> t
root Null = error "there is no root in empty tree"
root (Leaf x) = x
root (Node x left right) = x

{-
ghci> ordered Null
True
ghci> ordered (Leaf 3)
True
ghci> ordered (Leaf 7)
True
ghci> ordered (Node 5 (Leaf 3) Null)
True
ghci> ordered (Node 5 (Leaf 7) Null)
False
ghci> ordered (Node 5 Null (Leaf 7))
True
ghci> ordered (Node 5 Null (Leaf 3))
False
ghci> ordered bt1
True
ghci> ordered bt2
True
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15))))
True
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 13))))
False
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 9) (Node 13 (Leaf 14) (Leaf 15))))
False
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 10 (Leaf 11) (Node 13 (Leaf 11) (Leaf 15))))
False
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 12 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15))))
True
ghci> ordered (Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Node 12 (Leaf 9) (Node 11 (Leaf 10) (Leaf 15))))
False
-}
