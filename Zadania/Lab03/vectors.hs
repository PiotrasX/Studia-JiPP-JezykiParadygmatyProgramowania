module Vectors
where

infixl 6 +.
(+.) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a1, b1, c1) +. (a2, b2, c2) = (a1 + a2, b1 + b2, c1 + c2)

infixl 6 -.
(-.) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a1, b1, c1) -. (a2, b2, c2) = (a1 - a2, b1 - b2, c1 - c2)

infixl 7 *.
(*.) :: (Double, Double, Double) -> Double -> (Double, Double, Double)
(a, b, c) *. r = (a * r, b * r, c * r)

infixl 7 ***
(***) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a1, b1, c1) *** (a2, b2, c2) = (b1 * c2 - c1 * b2, c1 * a2 - a1 * c2, a1 * b2 - b1 * a2)
