module Triangle
where

trArea1 :: Floating a => a -> a -> a            -- Liczba a pochodzi z klasy typ�w Floating. Funkcja pobiera dwie liczby typu a i zwraca liczb� te� typu a.
trArea1 a h = (1/2) * a * h                     -- Pole powierzchni = 1/2 * Podstawa * Wysoko��

trArea2 :: Floating a => a -> a -> a -> a -> a  -- Liczba a pochodzi z klasy typ�w Floating. Funkcja pobiera cztery liczby typu a i zwraca liczb� te� typu a.
trArea2 a b c r = (a * b * c) / (4 * r)         -- Pole powierzchni = (Mno�one d�ugo�ci bok�w tr�jk�ta) / (4 * D�ugo�� promienia okr�gu opisanego na tr�jk�cie)

trArea3 :: Floating a => a -> a -> a -> a -> a  -- Liczba a pochodzi z klasy typ�w Floating. Funkcja pobiera cztery liczby typu a i zwraca liczb� te� typu a.
trArea3 a b c r = r * ((a + b + c) / 2)         -- Pole powierzchni = (D�ugo�� promienia okr�gu wpisanego w tr�jk�t) * ((Dodawanie d�ugo�ci bok�w tr�jk�ta) / 2)
