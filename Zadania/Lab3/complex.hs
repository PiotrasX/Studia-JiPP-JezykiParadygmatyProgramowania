module Complex
where

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 + z2 = a + b*i + c + d*i = a + c + (b + d)*i
-}

infixl 6 +.
(+.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) +. (c, d) = (a + c, b + d)

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 - z2 = a + b*i - (c + d*i) = a - c + b*i - d*i = a - c + (b - d)*i
-}

infixl 6 -.
(-.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) -. (c, d) = (a - c, b - d)

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 * z2 = (a + b*i) * (c + d*i) = a*c + a*d*i + b*c*i + b*d*i*i = a*c - b*d + (a*d + b*c)*i
-}

infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) *. (c, d) = (a * c - b * d, a * d + b * c)

{-
z1 = a + b*i   i*i = -1
z2 = c + d*i

z1 / z2 = (a + b*i)/(c + d*i) = ((a + b*i)*(c - d*i))/((c + d*i)*(c - d*i)) = (a*c - a*d*i + b*c*i - b*d*i*i)/(c*c - c*d*i + c*d*i - d*d*i*i) = (a*c + b*d + b*c*i - a*d*i)/(c*c + d*d) = (a*c + b*d)/(c*c + d*d) + ((b*c - a*d)/(c*c + d*d))*i
-}

infixl 7 /.
(/.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) /. (c, d) = ((a * c + b * d) / (c * c + d * d), (b * c - a * d) / (c * c + d * d))

re :: (Double, Double) -> Double
re (a, b) = a

im :: (Double, Double) -> Double
im (a, b) = b

i :: (Double, Double)
i = (0, 1)

i' :: (Double, Double)
i' = (re i, im i)

i'' :: (Double, Double)
i'' = (2, -1) -. (2, -2)
