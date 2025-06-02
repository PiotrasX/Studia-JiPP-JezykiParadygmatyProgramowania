-- 2.1

{-
ghci> 2^100
1267650600228229401496703205376
ghci> (12+23)*(40-21)
665
ghci> (2^100)/((12+23)*(40-21))
1.9062415041026007e27
ghci> sqrt 2
1.4142135623730951
ghci> sqrt ((12+23)*(40-21))
25.787593916455254
ghci> 2+ -3

<interactive>:6:1: error:
    Precedence parsing error
        cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix expression
ghci> 2+(-3)
-1
-}

{-
ghci> :i +
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +
ghci> :i -
type Num :: * -> Constraint
class Num a where
  ...
  (-) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 -
-}

{-
ghci> :i *
type Num :: * -> Constraint
class Num a where
  ...
  (*) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 7 *
ghci> :i /
type Fractional :: * -> Constraint
class Num a => Fractional a where
  (/) :: a -> a -> a
  ...
        -- Defined in `GHC.Real'
infixl 7 /
ghci> :i ^
(^) :: (Num a, Integral b) => a -> b -> a       -- Defined in `GHC.Real'
infixr 8 ^
-}

-- 2.2

{-
ghci> rem 1234 2
0
ghci> rem 1234 3
1
ghci> 1234 `rem` 4
2
Z liczb 2, 3, 4 tylko liczba 2 jest podzielnikiem liczby 1234.

ghci> rem 113 1
0
ghci> rem 113 2
1
ghci> rem 113 3
2
ghci> rem 113 5
3
ghci> rem 113 7
1
ghci> rem 113 11
3
ghci> rem 113 13
9
ghci> rem 113 17
11
ghci> rem 113 19
18
ghci> rem 113 23
21
ghci> rem 113 29
26
ghci> rem 113 31
20
ghci> rem 113 37
2
ghci> rem 113 41
31
ghci> rem 113 43
27
ghci> rem 113 47
19
ghci> rem 113 53
7
ghci> rem 113 59
54
ghci> rem 113 113
0
Wyjaœnienie:
Liczba 113 jest pierwsza, poniewa¿ dzieli siê tylko przez 1 i przez sam¹ siebie. Z k¹d ten wniosek?
Poniewa¿ skoro reszta z dzielenia liczby 113 przez 2 nie daje 0, to znaczy ¿e ta liczba nie jest podzielna przez 2
i przez jej wielokrotnoœci (4, 6, 8, ...). Dlatego nie trzeba sprawdzaæ wielokrotnoœci danej liczby, przez któr¹
113 siê nie dzieli. Po sprawdzeniu wszystkich liczb pierwszych mniejszych b¹dŸ równych od po³owy 113, mo¿na
stwierdziæ, ¿e 113 jest pierwsza, poniewa¿ ¿adna z tych liczb (oprócz 1) nie da³a reszty z dzielenia 0.
-}

-- 2.3 

{-
ghci> :t pi
pi :: Floating a => a
ghci> pi
3.141592653589793
ghci> let f x = 2*x + 1
ghci> f 5
11
-}

{-
ghci> let sphereVolume r = (4/3) * pi * r^3
ghci> sphereVolume 1
4.1887902047863905
ghci> let coneVolume r h = (1/3) * h * pi * r^2
ghci> coneVolume 1 2
2.0943951023931953
ghci> let cuboidVolume a b c = a * b * c
ghci> cuboidVolume 1 2 3
6
-}

-- 2.4

sphereVolume :: Floating a => a -> a
sphereVolume r = (4/3) * pi * r^3

coneVolume :: Floating a => a -> a -> a
coneVolume r h = (1/3) * h * pi * r^2

cuboidVolume :: Floating a => a -> a -> a -> a
cuboidVolume a b c = a * b * c

{-
ghci> :t sphereVolume
sphereVolume :: Floating a => a -> a
ghci> :t coneVolume
coneVolume :: Floating a => a -> a -> a
ghci> :t cuboidVolume
cuboidVolume :: Floating a => a -> a -> a -> a
-}

{-
ghci> sphereVolume 1.5
14.137166941154067
ghci> coneVolume 1.3 5.5
9.733701238372376
ghci> cuboidVolume 1.1 2.2 3.3
7.986000000000001
-}

-- 2.5

pyramidVolume :: Floating a => a -> a -> a
pyramidVolume a h = (1/3) * h * a^2

{-
ghci> :t pyramidVolume
pyramidVolume :: Floating a => a -> a -> a
-}

{-
ghci> pyramidVolume 5.5 4.4
44.36666666666667
-}

-- 2.6

{-
ghci> (2 ^) 3
8
ghci> (^ 2) 3
9
-}

f1 x = x - 2
f1' x = x + (-2)
f1'' = (+ (-2))

{-
ghci> f1 1
-1
ghci> f1' 1
-1
ghci> f1'' 1
-1
-}

f2 x = rem x 5
f2' x = x `rem` 5
f2'' = (`rem` 5)

{-
ghci> f2 25
0
ghci> f2' 25
0
ghci> f2'' 25
0
-}

f3 x = x == 10
f3' = (== 10)

{-
ghci> f3 7
False
ghci> f3' 7
False
ghci> f3 10
True
ghci> f3' 10
True
-}

f4 x = div x 8
f4' x = x `div` 8
f4'' = (`div` 8)

{-
ghci> f4 16
2
ghci> f4' 16
2
ghci> f4'' 16
2
-}

f5 x = 100 < x
f5' x = x > 100
f5'' = (> 100)

{-
ghci> f5 100
False
ghci> f5' 100
False
ghci> f5'' 100
False
ghci> f5 101
True
ghci> f5' 101
True
ghci> f5'' 101
True
-}

f6 x = mod 5 x
f6' x = 5 `mod` x
f6'' = (5 `mod`)
f6''' = mod 5

{-
ghci> f6 2
1
ghci> f6' 2
1
ghci> f6'' 2
1
ghci> f6''' 2
1
-}

f7 x = div 8 x
f7' x = 8 `div` x
f7'' = (8 `div`)
f7''' = div 8

{-
ghci> f7 3
2
ghci> f7' 3
2
ghci> f7'' 3
2
ghci> f7''' 3
2
-}

f8 x = (*) x 3
f8' x = x * 3
f8'' = (* 3)

{-
ghci> f8 7
21
ghci> f8' 7
21
ghci> f8'' 7
21
-}

-- 2.7

trArea1 :: Floating a => a -> a -> a
trArea1 a h = (1/2) * a * h

trArea2 :: Floating a => a -> a -> a -> a -> a
trArea2 a b c r = (a * b * c) / (4 * r)

trArea3 :: Floating a => a -> a -> a -> a -> a
trArea3 a b c r = r * ((a + b + c) / 2)

{-
ghci> trArea1 3 4
6.0
ghci> trArea2 3 4 5 2.5
6.0
ghci> trArea3 3 4 5 1
6.0
-}
