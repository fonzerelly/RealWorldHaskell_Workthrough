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

type ErrorMessage = String
decimalDigitToInt_either :: Char -> (Either ErrorMessage Int, Int) -> (Either ErrorMessage Int, Int)
decimalDigitToInt_either c (Left error, base) = (Left error, base)
decimalDigitToInt_either c (Right result, base)
   | elem c ['0'..'f'] = (Right (digitToInt c * base + result), base *10)
   | otherwise = (Left ("non-digit " ++ [c]), base)

asInt_either :: String -> Either ErrorMessage Int
asInt_either cs = fst (foldr decimalDigitToInt_either (Right 0, 1) cs)

myconcat :: [[a]] -> [a]
myconcat xss = foldr (++) [] xss

takeWhile_recursive :: (a -> Bool) -> [a] -> [a]
takeWhile_recursive _ [] = []
takeWhile_recursive f (x:xs)
   | f x       = x : takeWhile_recursive f xs
   | otherwise = []

takeWhile_foldr :: (a -> Bool) -> [a] -> [a]
takeWhile_foldr f xs = foldr takeWhile_iter [] xs
   where
      takeWhile_iter x acc
         | f x       = [x] ++ acc
         | otherwise = []
