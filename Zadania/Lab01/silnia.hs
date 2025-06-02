module Main
where

silnia :: Integer -> Integer
silnia n | n == 0 = 1
         | n > 0  = n * silnia (n - 1)

main = 
  do putStrLn "Podaj liczbe naturalna: "
     k <- getLine
     let result = silnia (read k)
     putStrLn (show result)
