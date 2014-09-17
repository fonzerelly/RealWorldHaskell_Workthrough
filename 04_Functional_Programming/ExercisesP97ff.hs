module ExercisesP97ff where
 
import Data.Char(digitToInt)

decimalDigitToInt :: Char -> (Int, Int) -> (Int, Int)
decimalDigitToInt '-' (result, base) = (- result, base)
decimalDigitToInt '.' _ = error "Float is no int!"
decimalDigitToInt c (result, base)
   | ((maxBound::Int) - result) < ((digitToInt c) * base) = error "Too big for Int!"
   | otherwise                                    = (digitToInt c * base + result, base*10)

asInt_fold :: String -> Int
asInt_fold "" = error "Empty String is not allowed!"
asInt_fold "-" = error "Minus only is no int!"
asInt_fold "-3" = error "What ever the boss says."
asInt_fold cs = fst (foldr decimalDigitToInt (0, 1) cs)
