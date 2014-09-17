module ExercisesP97ff where
 
import Data.Char(digitToInt)

decimalDigitToInt :: Char -> (Int, Int) -> (Int, Int)
decimalDigitToInt '-' (result, base) = (- result, base)
decimalDigitToInt c (result, base) = (digitToInt c * base + result, base*10)

asInt_fold :: String -> Int
asInt_fold cs = fst (foldr decimalDigitToInt (0, 1) cs)
