module Complex
where

infixl 6 +.
(+.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, bi) +. (c, di) = (a + c, bi + di)

infixl 6 -.
(-.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, bi) -. (c, di) = (a - c, bi - di)

infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, bi) *. (c, di) = (a * c - bi * di, bi * c + a * di)

infixl 7 /.
(/.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, bi) /. (c, di) = ((a * c + bi * di) / (c * c + di * di), (bi * c - a * di) / (c * c + di * di))

re :: (Double, Double) -> Double
re (a, bi) = a

im :: (Double, Double) -> Double
im (a, bi) = bi

i :: (Double, Double)
i = (0, 1)

i' :: (Double, Double)
i' = (re i, im i)

i'' :: (Double, Double)
i'' = (2, -1) -. (2, -2)
