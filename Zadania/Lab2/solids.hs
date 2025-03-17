module Solids
where

sphereVolume :: Floating a => a -> a            -- Niech a to b�dzie liczba z klasy typ�w Floating. Teraz funkcja pobiera liczb� typu a i zwraca liczb� te� typu a.
sphereVolume r = (4/3) * pi * r^3               -- Obliczanie obj�to�ci kuli = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a         -- Niech a to b�dzie liczba z klasy typ�w Floating. Teraz funkcja pobiera dwie liczby typu a i zwraca liczb� te� typu a.
coneVolume r h = (1/3) * h * pi * r^2           -- Obliczanie obj�to�ci sto�ka = 1/3 * Wysoko�� * Pole podstawy

cuboidVolume :: Floating a => a -> a -> a -> a  -- Niech a to b�dzie liczba z klasy typ�w Floating. Teraz funkcja pobiera trzy liczby typu a i zwraca liczb� te� typu a.
cuboidVolume a b c = a * b * c                  -- Obliczanie obj�to�ci prostopad�o�cianu = Szeroko�� * D�ugo�� * Wysoko��

pyramidVolume :: Floating a => a -> a -> a      -- Niech a to b�dzie liczba z klasy typ�w Floating. Teraz funkcja pobiera dwie liczby typu a i zwraca liczb� te� typu a.
pyramidVolume a h = (1/3) * h * a^2             -- Obliczanie obj�to�ci ostros�upa = 1/3 * Wysoko�� * Pole podstawy (kwadrat)
