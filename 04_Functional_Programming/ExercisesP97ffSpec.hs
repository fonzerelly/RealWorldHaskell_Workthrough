-- file ExercisesP97ffSpec.hs
module ExercisesP97ffSpec where

import Test.Hspec
import ExercisesP97ff
import Control.Exception.Base
import Data.List

main :: IO ()
main = hspec $ do

   describe "1. Use a fold(choosing the appropriate fold will make your code \
   \ much simpler) to rewrite and improve upon 'asInt' function from the earlier \
   \ section 'Explicid Recursion' on page 85." $ do

      describe "decimalDigitToInt" $ do
         it "should convert digits and multiplies them by the base provided" $ do
            decimalDigitToInt '5' (0, 1) `shouldBe` (5, 10)
            decimalDigitToInt '8' (0, 10) `shouldBe` (80, 100)

	 it "should add the result to the function found integer" $ do
            decimalDigitToInt '4' (2,10) `shouldBe` (42, 100)

         it "should negate the result if char is a dash" $ do
            decimalDigitToInt '-' (3, 10) `shouldBe` (-3, 10)

         it "should except on points" $ do
            evaluate (decimalDigitToInt '.' (0, 1)) `shouldThrow` errorCall "Float is no int!"

         it "should except on overflowing max Int" $ do
            evaluate (decimalDigitToInt '1' (maxBound::Int, 1)) `shouldThrow` errorCall "Too big for Int!"


   describe "2. Your function should behave as follows" $ do
      it "should convert the string '101' to int 101" $ do
         asInt_fold "101" `shouldBe` 101
      it "should convert the string '-31337' to int -31337" $ do
         asInt_fold "-31337" `shouldBe` -31337
      it "should convert the string '1798' to int 1798" $ do
         asInt_fold "1798" `shouldBe` 1798

   describe "3. Extend your function to handle the following kinds of exceptional \
   \ conditions by calling error" $ do
      it "should except on empty string" $ do
         evaluate (asInt_fold "") `shouldThrow` errorCall "Empty String is not allowed!"
      it "should except on minus only" $ do
         evaluate (asInt_fold "-") `shouldThrow` errorCall "Minus only is no int!"
      it "should exept on -3" $ do
         evaluate (asInt_fold "-3") `shouldThrow` errorCall "What ever the boss says."
      it "should except on floats" $ do
         evaluate (asInt_fold "2.7") `shouldThrow` errorCall "Float is no int!"
      it "should except on too long integers" $ do
         evaluate (asInt_fold "314159265358979323846") `shouldThrow` errorCall "Too big for Int!"

   describe "4. The asInt_fold function uses 'error', so its callers can not handle errors. \
   \ Rewrite the function to fix this problem." $ do
      describe "decimalDigitToInt_either" $ do
         it "should return either a Number" $ do
            decimalDigitToInt_either '4' (Right 2, 10) `shouldBe` (Right 42, 100)
         it "should return the error message for an error" $ do
            decimalDigitToInt_either '4' (Left "Error", 10) `shouldBe` (Left "Error", 10)
      it "should return Right Num for an integer"  $ do
         asInt_either "33" `shouldBe` Right 33
      it "should return Left ErrorMessage for foo" $ do
         asInt_either "foo" `shouldBe` Left "non-digit o"

   describe "5. The `Prelude` function concat concatenates  a list of lists \
   \ into a single list and has the following type" $ do
      describe "6. Write your own definition of concat using foldr." $ do
         it "should concat the several arrays in an array to one array" $ do
            myconcat [[1,2],[3],[4,5]] `shouldBe` [1,2,3,4,5]
         it "should handle empty arrays" $ do
            myconcat [[1,2],[],[4,5]] `shouldBe` [1,2,4,5]

   describe "7. Write your own definition of the standard takeWhile function," $ do
      context "first using explicit recursion," $ do
         it "should return a list as long as a predicates verifies" $ do
            takeWhile_recursive odd [1,3,4,5] `shouldBe` [1,3]
            takeWhile_recursive odd [1,3,5] `shouldBe` [1,3,5]
      context "and then foldr." $ do
         it "should return a list as long as a predicates verifies" $ do
            takeWhile_foldr odd [1,3,4,5] `shouldBe` [1,3]
            takeWhile_foldr odd [1,3,5] `shouldBe` [1,3,5]
            takeWhile_foldr odd [] `shouldBe` []

   describe "8. The Data.List module defines a function, groupBy, which has the \
   \ following type: groupBy :: (a -> a -> Bool) -> [a] -> [[a]]" $ do
      context "9. Use ghci to load the Data.List module and figure out what groupBy does," $ do
         it "iterates a list and compares each values by the predicate and groups them if predicate is true" $ do
            groupBy (>) [1,2,3,4,5,6] `shouldBe` [[1],[2],[3],[4],[5],[6]]
            groupBy (<) [1,2,3,4,5,6] `shouldBe` [[1,2,3,4,5,6]]
            groupBy (==) [1,2,2,3,3,3] `shouldBe` [[1],[2,2],[3,3,3]]

      context "then write your own implementation using a fold" $ do
         describe "composeComparables" $ do
            it "should zip input with its tail and duplicate the last value" $ do
               composeComparables [1,2,3] `shouldBe` [(1,2),(2,3),(3,3)]
         describe "groupBy_fold_iter" $ do
            it "should combine fst a tuple in snd of acc if p verifies tuple" $ do
               groupBy_fold_iter (==) ([], []) (2,2) `shouldBe` ([],[2])
               groupBy_fold_iter (==) ([], [2]) (2,2) `shouldBe` ([],[2,2])

            it "should store snd acc in fst acc if predicate fails on tuple" $ do
               groupBy_fold_iter (==) ([], []) (2,3) `shouldBe` ([[2]],[])

         it "iterates a list and compares each values by the predicate and groups them if predicate is true" $ do
            groupBy_fold (>) [1,2,3,4,5,6] `shouldBe` [[1],[2],[3],[4],[5],[6]]
            groupBy_fold (<) [1,2,3,4,5,6] `shouldBe` [[1,2,3,4,5,6]]
            groupBy_fold (==) [1,2,2,3,3,3] `shouldBe` [[1],[2,2],[3,3,3]]

