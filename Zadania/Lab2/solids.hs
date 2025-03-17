module Solids
where

sphereVolume :: Floating a => a -> a            -- Niech a to bêdzie liczba z klasy typów Floating. Teraz funkcja pobiera liczbê typu a i zwraca liczbê te¿ typu a.
sphereVolume r = (4/3) * pi * r^3               -- Obliczanie objêtoœci kuli = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a         -- Niech a to bêdzie liczba z klasy typów Floating. Teraz funkcja pobiera dwie liczby typu a i zwraca liczbê te¿ typu a.
coneVolume r h = (1/3) * h * pi * r^2           -- Obliczanie objêtoœci sto¿ka = 1/3 * Wysokoœæ * Pole podstawy

cuboidVolume :: Floating a => a -> a -> a -> a  -- Niech a to bêdzie liczba z klasy typów Floating. Teraz funkcja pobiera trzy liczby typu a i zwraca liczbê te¿ typu a.
cuboidVolume a b c = a * b * c                  -- Obliczanie objêtoœci prostopad³oœcianu = Szerokoœæ * D³ugoœæ * Wysokoœæ

pyramidVolume :: Floating a => a -> a -> a      -- Niech a to bêdzie liczba z klasy typów Floating. Teraz funkcja pobiera dwie liczby typu a i zwraca liczbê te¿ typu a.
pyramidVolume a h = (1/3) * h * a^2             -- Obliczanie objêtoœci ostros³upa = 1/3 * Wysokoœæ * Pole podstawy (kwadrat)
