module Integration
where

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule (f) a b n = sum [h * f x | x <- points]
                          where h = (b - a) / fromIntegral(n)
                                points = [a + fromIntegral(i) * h | i <- [1..n]]

trapezoidalRule :: (Float -> Float) -> Float -> Float -> Int -> Float
trapezoidalRule (f) a b n = (h/2) * (f a + f b) + sum [h * f x | x <- points]
                            where h = (b - a) / fromIntegral(n)
                                  points = [a + fromIntegral(i) * h | i <- [1..(n - 1)]]
