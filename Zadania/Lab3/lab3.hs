module Math where

-- 3.1

{-
ghci> not True
False
ghci> not False
True
ghci> True && True
True
ghci> True && False
False
ghci> False && False
False
ghci> True || True
True
ghci> True || False
True
ghci> False || False
False
-}

{-
ghci> let f1 x | x == 0 = "zero"
ghci> f1 0
"zero"
ghci> f1 1
"*** Exception: <interactive>:9:5-26: Non-exhaustive patterns in function f1

ghci> let f2 x = if x == 0 then "zero" else undefined
ghci> f2 0
"zero"
ghci> f2 1
"*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at <interactive>:12:39 in interactive:Ghci11
ghci> :t otherwise
otherwise :: Bool
ghci> otherwise
True
-}

f x | x < -10 = x*x
    | x >= -10 && x < 0 = sin x
    | x >= 0 && x <= 2 = sqrt x

{-
ghci> f (-12)
144.0
ghci> f (-pi)
-1.2246063538223773e-16
ghci> f 1
1.0
ghci> f 5
*** Exception: lab3.hs:(44,1)-(46,31): Non-exhaustive patterns in function f
-}

f' x | x < -10 = x*x
     | x >= -10 && x < 0 = sin x
     | x >= 0 && x <= 2 = sqrt x
     | x > 2 = undefined

{-
ghci> f' (-12)
144.0
ghci> f' (-pi)
-1.2246063538223773e-16
ghci> f' 1
1.0
ghci> f' 5
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:62:16 in main:Math
-}

f'' x | x < -10 = x*x
      | x < 0 = sin x
      | x <= 2 = sqrt x
      | otherwise = undefined

{-
ghci> f'' (-12)
144.0
ghci> f'' (-pi)
-1.2246063538223773e-16
ghci> f'' 1
1.0
ghci> f'' 5
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:80:21 in main:Math
-}

-- 3.2

{-
ghci> :t div
div :: Integral a => a -> a -> a
ghci> :t (/)
(/) :: Fractional a => a -> a -> a
ghci> 6 `div` 4
1
ghci> 6 / 4
1.5
ghci> (6 :: Int) `div` (4 :: Int)
1
ghci> (6 :: Int) / (4 :: Int)

<interactive>:44:12: error:
    * No instance for (Fractional Int) arising from a use of `/'
    * In the expression: (6 :: Int) / (4 :: Int)
      In an equation for `it': it = (6 :: Int) / (4 :: Int)
-}

factorial :: Integer -> Integer
factorial n | n == 0 = 1
            | n > 0 = n * factorial(n - 1)
            | otherwise = undefined

{-
ghci> factorial (-1)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:117:23 in main:Math
ghci> factorial 0
1
ghci> factorial 1
1
ghci> factorial 2
2
ghci> factorial 3
6
ghci> factorial 4
24
ghci> factorial 5
120
-}

binomialCoefficient :: Integer -> Integer -> Integer
binomialCoefficient k n | 0 <= k && k <= n = factorial(n) `div` (factorial(k) * factorial(n - k))
                        | otherwise = undefined

{-
ghci> binomialCoefficient (-1) (-1)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:142:39 in main:Math
ghci> binomialCoefficient 0 0
1
ghci> binomialCoefficient 1 0
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:142:39 in main:Math
ghci> binomialCoefficient 0 1
1
ghci> binomialCoefficient 3 2
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:142:39 in main:Math
ghci> binomialCoefficient 2 3
3
ghci> binomialCoefficient 2 4
6
ghci> binomialCoefficient 3 4
4
ghci> binomialCoefficient 3 5
10
-}

-- 3.3

factorial2 :: Integer -> Integer
factorial2 n | n == 0 || n == 1 = 1
             | n > 1 = n * factorial2(n - 2)
             | otherwise = undefined

{-
ghci> factorial2 (-1)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:176:28 in main:Math
ghci> factorial2 0
1
ghci> factorial2 1
1
ghci> factorial2 2
2
ghci> factorial2 3
3
ghci> factorial2 4
8
ghci> factorial2 5
15
ghci> factorial2 6
48
ghci> factorial2 7
105
-}

-- 3.4

{-
ghci> :t rem
rem :: Integral a => a -> a -> a
ghci> rem 3 2
1
ghci> rem 3 3
0
-}

divides :: Int -> Int -> Bool
divides k n = rem n k == 0

{-
ghci> divides 2 5
False
ghci> divides 2 6
True
-}

-- 3.5

seq' 1 = 3
seq' 2 = 4
seq' n = if n > 2 then 0.5 * seq'(n - 1) + 2 * seq'(n - 2)
         else undefined

{-
ghci> seq' 0
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:227:15 in main:Math
ghci> seq' 1
3.0
ghci> seq' 2
4.0
ghci> seq' 3
8.0
ghci> seq' 4
12.0
ghci> seq' 5
22.0
-}

seq'' n | n == 1 = 3
        | n == 2 = 4
        | n > 2 = 0.5 * seq'(n - 1) + 2 * seq'(n - 2)
        | otherwise = undefined

{-
ghci> seq'' (-1)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:249:23 in main:Math
ghci> seq'' 0
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:249:23 in main:Math
ghci> seq'' 1
3.0
ghci> seq'' 2
4.0
ghci> seq'' 3
8.0
ghci> seq'' 4
12.0
ghci> seq'' 5
22.0
-}

-- 3.6

gcd' a b | a < 0 = gcd' (-a) b
         | b < 0 = gcd' a (-b)
         | a == b = a
         | a < b = gcd' b a
         | otherwise = gcd' (a - b) b

{-
ghci> gcd' (-5) 10
5
ghci> gcd' (-5) (-10)
5
ghci> gcd' 5 (-10)
5
ghci> gcd' (-5) 5
5
ghci> gcd' (-5) (-5)
5
ghci> gcd' 5 (-5)
5
ghci> gcd' 3 9
3
ghci> gcd' 3 10
1
ghci> gcd' 4 22
2
-}

{-
ghci> gcd' 282 78
6
ghci> gcd' 78 282
6
-}

-- 3.7

{-
ghci> 3 * 5
15
ghci> (*) 3 5
15
ghci> :t gcd
gcd :: Integral a => a -> a -> a
ghci> gcd 12 6
6
ghci> gcd 15 8
1
-}

(><) :: Integral a => a -> a -> Bool
x >< y = gcd x y == 1

{-
ghci> :t (><)
(><) :: Integral a => a -> a -> Bool
ghci> 12 >< 6
False
ghci> 15 >< 8
True
-}

-- 3.8

{-
ghci> :i +
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +
-}

{-
z1 = a + b*i
z2 = c + d*i
i*i = -1
-}

{-
z1 = 2 + 3i -> (2, 3)
z2 = 4 + 5i -> (4, 5)

ghci> (2, 3) +. (4, 5)
(6.0,8.0)
ghci> (2, 3) -. (4, 5)
(-2.0,-2.0)
ghci> (2, 3) *. (4, 5)
(-7.0,22.0)
ghci> (2, 3) /. (4, 5)
(0.5609756097560976,4.878048780487805e-2)
ghci> re (2, 3)
2.0
ghci> im (2, 3)
3.0
ghci> i
(0.0,1.0)
ghci> i *. i
(-1.0,0.0)
-}

{-
z1 = 3.14 - i -> (3.14, -1)
z2 = -1 + 5i -> (-1, 5)

ghci> (3.14, -1) +. (-1, 5)
(2.14,4.0)
ghci> (3.14, -1) -. (-1, 5)
(4.140000000000001,-6.0)
ghci> (3.14, -1) *. (-1, 5)
(1.8599999999999999,16.700000000000003)
ghci> (3.14, -1) /. (-1, 5)
(-0.3130769230769231,-0.5653846153846154)
ghci> re (3.14, -1)
3.14
ghci> im (3.14, -1)
-1.0
-}

{-
ghci> i
(0.0,1.0)
ghci> i'
(0.0,1.0)
ghci> i''
(0.0,1.0)
-}

-- 3.9

{-
v1 = [2, 3, 4] -> (2, 3, 4)
v2 = [5, 6, 7] -> (5, 6, 7)

ghci> (2, 3, 4) +. (5, 6, 7)
(7.0,9.0,11.0)
ghci> (2, 3, 4) -. (5, 6, 7)
(-3.0,-3.0,-3.0)
ghci> (2, 3, 4) *. 3
(6.0,9.0,12.0)
ghci> (2, 3, 4) *** (5, 6, 7)
(-3.0,6.0,-3.0)
-}
