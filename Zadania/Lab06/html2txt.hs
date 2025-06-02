module Html2txt
where

clear :: String -> Bool -> String
clear [] _ = []
clear (x:xs) False | x == '<' = clear xs True
                   | otherwise = x : clear xs False
clear (x:xs) True  | x == '>' = clear xs False
                   | otherwise = clear xs True

html2txt =
      do [f,g] <- getArgs
         s <- readFile f
         let clear_html = clear s False
         writeFile g clear_html
