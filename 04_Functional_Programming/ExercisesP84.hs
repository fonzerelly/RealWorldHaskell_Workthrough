module ExercisesP84 where

import Data.Maybe (fromMaybe, listToMaybe)
import Safe (tailMay, tailSafe)

safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just(x)
safeHead [] = Nothing

safeTail :: [a] -> Maybe [a]
safeTail (x:xs) = Just xs
safeTail [] = Nothing

safeLast :: [a] -> Maybe a
safeLast []     = Nothing
safeLast (x:[]) = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit []     = Nothing
safeInit (x:[]) = Just []
safeInit (x:xs) = Just ([x]++(unwrap (safeInit xs)))

unwrap :: Maybe [a] -> [a]
unwrap Nothing = []
unwrap (Just xs) = xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p (ns) = pre ns : (post ns)
   where
      pre (x:xs)
         | p x       = [x]++(pre xs)
         | otherwise = []
      pre []         = []
      post (x:xs)
         | p x       = post xs
         | otherwise = splitWith p xs
      post []        = []

firstWords :: String -> String
firstWords cs = unlines (map unwrap (map safeHead (map words (lines cs))))

firstChars :: [String] -> [Maybe Char]
firstChars = foldr appendMaybeHead []
    where appendMaybeHead s a = (listToMaybe s) : a

firstCharsOrElse :: Char -> [String] -> String
firstCharsOrElse r = map (fromMaybe r) . firstChars

transposeStrings :: [String] -> [String]
transposeStrings ss
   | all (=="") ss = []
   | otherwise     = firstCharsOrElse ' ' ss : transposeStrings (map tailSafe ss)

transposeLines :: String -> String
transposeLines = unlines . transposeStrings . lines
