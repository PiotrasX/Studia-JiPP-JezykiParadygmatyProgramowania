module Lists
where

import Data.Char

sumOfSquares' :: Num a => [a] -> a
sumOfSquares' x = sum (map (\x -> x*x) x)

sumOfSquares :: Num a => [a] -> a
sumOfSquares [] = 0
sumOfSquares (x:xs) = x^2 + sumOfSquares xs

sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

sum2 :: Num a => [a] -> a
sum2 [] = 0
sum2 [x] = x
sum2 (x:_:xs) = x + sum2 xs

sum3 :: Num a => [a] -> a
sum3 [] = 0
sum3 [_] = 0
sum3 [_,_] = 0
sum3 [_,_,_] = 0
sum3 (_:_:_:x:xs) = x + sum3 (x : xs)

countLower :: String -> Int
countLower [] = 0
countLower (x:xs) | 'a' <= x && x <= 'z' = 1 + countLower xs
                  | otherwise = countLower xs
                  
countLowerUpper :: String -> (Int, Int)
countLowerUpper [] = (0,0)
countLowerUpper (x:xs) | 'a' <= x && x <= 'z' = (1 + fst func, 0 + snd func)
                       | 'A' <= x && x <= 'Z' = (0 + fst func, 1 + snd func)
                       | otherwise = func
                         where func = countLowerUpper xs

string2bools :: [Char] -> [Bool]
string2bools [] = []
string2bools (x:xs) | 'a' <= x && x <= 'z' = True : string2bools xs
                    | otherwise = False : string2bools xs

cgtx :: (Ord x, Num x) => x -> [x] -> x
cgtx _ [] = 0
cgtx x (y:ys) | x < y = 1 + cgtx x ys
              | otherwise = cgtx x ys

cltx :: (Ord x, Num x) => x -> [x] -> x
cltx _ [] = 0
cltx x (y:ys) | y < x = 1 + (cltx x ys)
              | otherwise = cltx x ys

gtx :: (Ord x, Num x) => x -> [x] -> [x]
gtx _ [] = []
gtx x (y:ys) | x < y = y : gtx x ys
             | otherwise = gtx x ys

ltx :: (Ord x, Num x) => x -> [x] -> [x]
ltx _ [] = []
ltx x (y:ys) | y <= x = y : (ltx x ys)
             | otherwise = ltx x ys

string2int :: String -> Int
string2int [] = 0
string2int x = read x :: Int

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: [Int]
primes = filter prime [2 ..]

pairs :: [Int] -> [(Int, Int)]
pairs (x:y:[])  | x + 2 == y = [(x,y)]
                | otherwise  = []
pairs (x:y:xys) | x + 2 == y = (x,y) : pairs (y:xys)
                | otherwise  = pairs (y:xys)
                
primePairs :: [(Int, Int)]
primePairs = [(x,y) | x <- primes, y <- [x + 2], prime y]

primeTriples :: [(Int, Int, Int)]
primeTriples = [(x,y,z) | x <- primes, y <- [x + 2], z <- [y + 2], prime y, prime z]
