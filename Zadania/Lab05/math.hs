module Math
where

infix 5 ~=
a ~= b = abs (a - b) < h
         where h = 0.000001

cubeRoot :: Double -> Double
cubeRoot 0 = 0
cubeRoot x = until goodEnough improve 1.0
             where improve y = (1/3)*(2*y + x/(y^2))
                   goodEnough y = y*y*y ~= x
