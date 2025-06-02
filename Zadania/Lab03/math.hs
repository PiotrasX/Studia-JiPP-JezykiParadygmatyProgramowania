module Math
where

f x | x < -10 = x*x
    | x >= -10 && x < 0 = sin x
    | x >= 0 && x <= 2 = sqrt x

factorial :: Integer -> Integer
factorial n | n == 0 = 1
            | n > 0 = n * factorial(n - 1)
            | otherwise = undefined

binomialCoefficient :: Integer -> Integer -> Integer
binomialCoefficient k n | 0 <= k && k <= n = factorial(n) `div` (factorial(k) * factorial(n - k))
                        | otherwise = undefined

factorial2 :: Integer -> Integer
factorial2 n | n == 0 || n == 1 = 1
             | n > 1 = n * factorial2(n - 2)
             | otherwise = undefined

divides :: Int -> Int -> Bool
divides k n = rem n k == 0

seq' n | n == 1 = 3
       | n == 2 = 4
       | n > 2 = 0.5 * seq'(n - 1) + 2 * seq'(n - 2)
       | otherwise = undefined

gcd' a b | a < 0 = gcd' (-a) b
         | b < 0 = gcd' a (-b)
         | a == b = a
         | a < b = gcd' b a
         | otherwise = gcd' (a - b) b

(><) :: Integral a => a -> a -> Bool
x >< y = gcd x y == 1
