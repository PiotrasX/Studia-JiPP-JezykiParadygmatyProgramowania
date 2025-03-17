module Math
where

-- Wersja tradycyjna

f1 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f1 x = x - 2                   -- Funkcja f1 zmniejsza pobierany argument o 2.

f2 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f2 x = x `mod` 5               -- Funkcja f2 zwraca resztê z dzielenia argumentu przez 5.

f3 :: Integral a => a -> Bool  -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca typ logiczny Bool.
f3 x = x == 10                 -- Funkcja f3 zwraca wynik porównania argumentu z liczb¹ 10.

f4 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f4 x = x `div` 8               -- Funkcja f4 zwraca czêœæ ca³kowit¹ z dzielenia argumentu przez 8.

f5 :: Integral a => a -> Bool  -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca typ logiczny Bool.
f5 x | x > 100  = True         -- Funkcja f5 zwraca True, je¿eli argument jest wiêkszy od 100.
     | x <= 100 = False        -- Funkcja f5 zwraca False w przeciwnym przypadku.

f6 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f6 x = 5 `mod` x               -- Funkcja f6 zwraca resztê z dzielenia liczby 5 przez argument funkcji.

f7 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f7 x = 8 `div` x               -- Funkcja f7 zwraca czêœæ ca³kowit¹ z dzielenia liczby 8 przez argument funkcji.

f8 :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f8 x = x * 3                   -- Funkcja f8 potraja pobierany argument.

-- Wersja z sekcjami

f1s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f1s = (+ (-2))                  -- Funkcja f1 zmniejsza pobierany argument o 2.

f2s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f2s = (`mod` 5)                 -- Funkcja f2 zwraca resztê z dzielenia argumentu przez 5.

f3s :: Integral a => a -> Bool  -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca typ logiczny Bool.
f3s = (== 10)                   -- Funkcja f3 zwraca wynik porównania argumentu z liczb¹ 10.

f4s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f4s = (`div` 8)                 -- Funkcja f4 zwraca czêœæ ca³kowit¹ z dzielenia argumentu przez 8.

f5s :: Integral a => a -> Bool  -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca typ logiczny Bool.
f5s = (> 100)                   -- Funkcja f5 zwraca True, je¿eli argument jest wiêkszy od 100, zwraca False w przeciwnym przypadku.

f6s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f6s = (5 `mod`)                 -- Funkcja f6 zwraca resztê z dzielenia liczby 5 przez argument funkcji.

f7s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f7s = (8 `div`)                 -- Funkcja f7 zwraca czêœæ ca³kowit¹ z dzielenia liczby 8 przez argument funkcji.

f8s :: Integral a => a -> a     -- Liczba a pochodzi z klasy typów Integral. Funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
f8s = (* 3)                     -- Funkcja f8 potraja pobierany argument.
