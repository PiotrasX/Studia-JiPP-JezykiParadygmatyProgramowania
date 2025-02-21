-- 1.1

{-
Podaj wspolczynniki trojmianu
a = 0
Wspolczynnik a musi byc rozny od 0
a = 1
b = 2
c = 3
Brak pierwiastkow
-}

{-
Podaj wspolczynniki trojmianu
a = 1
b = 2
c = 1
Pierwiastkiem jest liczba -1.00
-}

{-
Podaj wspolczynniki trojmianu
a = 2
b = 3
c = 1
Pierwiastkami sa liczby -1.00, -0.50
-}

-- 1.2

{-
liczby.txt:
2 7

wynik.txt:
9
-}

-- 1.3

{-
Podaj wspó³czynniki trójmianu.
a = x
x nie jest poprawnym zapisem liczby.
a = 0
a nie mo¿e byæ równe 0.
a = 1
b = 2
c = 3
Brak rozwi¹zañ rzeczywistych.
-}

{-
Podaj wspó³czynniki trójmianu.
a = 2
b = 3,0
c = 1.0
1.0 nie jest poprawnym zapisem liczby.
c = 1
Rozwi¹zania rzeczywiste: x1 = -1.0, x2 = -0.5.
-}

{-
Podaj wspó³czynniki trójmianu.
a = 1
b = x2
x2 nie jest poprawnym zapisem liczby.
b = 2
c = 1
Rozwi¹zanie rzeczywiste: x1 = -1.0.
-}

-- 1.4

{-
tab[0] = 3
tab[1] = 5
tab[2] = 6
tab[3] = 4
tab[4] = 6
tab[5] = 3
tab[6] = 3
tab[7] = 5
tab[8] = 1
tab[9] = 2
-}

{-
tab[0] = 1
tab[1] = 2
tab[2] = 2
tab[3] = 6
tab[4] = 4
tab[5] = 2
tab[6] = 2
tab[7] = 3
tab[8] = 3
tab[9] = 4
-}

-- 1.5

{-
liczby2.txt:
2 9 5 3

wynik2.txt:
19
-}

-- 1.6

{-
ghci> f x = 2*x + 1
ghci> f 5
11
ghci>
-}

{-
rem - reszta z dzielenia
rem:
integer remainder, satisfying

gcd - najwiêkszy wspólny dzielnik
gcd:
gcd x y is the non-negative factor of both x and y of which every common factor of x and y is also a factor; for example gcd 4 2 = 2, gcd (-4) 6 = 2, gcd 0 4 = 4. gcd 0 0 = 0. (That is, the common divisor that is "greatest" in the divisibility preordering.)

Jak nazywa siê standardowy modu³ w Haskell?
Standardowy modu³ w Haskell nazywa siê: Prelude.

Ile argumentów przyjmuj¹ funkcje rem i gcd?
Obie funkcje przyjmuj¹ dwa argumenty.
-}

{-
rem:
integer remainder, satisfying

gcd:
gcd x y is the non-negative factor of both x and y of which every common factor of x and y is also a factor; for example gcd 4 2 = 2, gcd (-4) 6 = 2, gcd 0 4 = 4. gcd 0 0 = 0. (That is, the common divisor that is "greatest" in the divisibility preordering.)
-}

{-
ghci> 2+3*6
20
ghci> (12+6)*(7-2)
90
ghci> sqrt 3
1.7320508075688772
ghci> sqrt (12+4)
4.0
ghci> gcd 12 8
4
ghci> rem 12 5
2
ghci> :q
Leaving GHCi.
-}

-- 1.7

{-
Podaj liczbe naturalna:
5
120

ghci> :l silnia.hs
Ok, one module loaded.
ghci> silnia 5
120

ghci> :l silnia.hs
Ok, one module loaded.
ghci> main
Podaj liczbe naturalna:
5
120

Do czego s³u¿y program runhaskell?
Program runhaskell mo¿e uruchomiæ programu Haskell jako skrypt, bez koniecznoœci jego wczeœniejszej kompilacji. Taki program musi zawieraæ funkcje main.
-}

{-
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab1>ghc --make silnia.hs -o silnia
C:\Users\Piotr\Desktop\Studia\Semestr 6\JiPP\Zadania\Lab1>silnia.exe
Podaj liczbe naturalna:
4
24
-}

{-
Podaj liczbe naturalna:
-1
silnia: silnia.hs:(5,1)-(6,38): Non-exhaustive patterns in function silnia
-}

{-
Podaj liczbe naturalna:
0
1
-}

{-
Podaj liczbe naturalna:
1
1
-}

{-
Podaj liczbe naturalna:
2
2
-}

{-
Podaj liczbe naturalna:
3
6
-}
