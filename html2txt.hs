module Html2txt
where

clear :: String -> Bool -> String
clear [] b = []
clear (x:xs) b | x == '<' = clear xs True
               | x == '>' = clear xs False
               | b = clear xs b
               | not b = x : clear xs b

html2txt =
      do [f,g] <- getArgs
         s <- readFile f
         let clear_html = clear s False
         writeFile g clear_html
