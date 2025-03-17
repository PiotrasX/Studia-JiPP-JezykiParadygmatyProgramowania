module Triangle
where

trArea1 :: Floating a => a -> a -> a            -- Liczba a pochodzi z klasy typów Floating. Funkcja pobiera dwie liczby typu a i zwraca liczbê te¿ typu a.
trArea1 a h = (1/2) * a * h                     -- Pole powierzchni = 1/2 * Podstawa * Wysokoœæ

trArea2 :: Floating a => a -> a -> a -> a -> a  -- Liczba a pochodzi z klasy typów Floating. Funkcja pobiera cztery liczby typu a i zwraca liczbê te¿ typu a.
trArea2 a b c r = (a * b * c) / (4 * r)         -- Pole powierzchni = (Mno¿one d³ugoœci boków trójk¹ta) / (4 * D³ugoœæ promienia okrêgu opisanego na trójk¹cie)

trArea3 :: Floating a => a -> a -> a -> a -> a  -- Liczba a pochodzi z klasy typów Floating. Funkcja pobiera cztery liczby typu a i zwraca liczbê te¿ typu a.
trArea3 a b c r = r * ((a + b + c) / 2)         -- Pole powierzchni = (D³ugoœæ promienia okrêgu wpisanego w trójk¹t) * ((Dodawanie d³ugoœci boków trójk¹ta) / 2)
