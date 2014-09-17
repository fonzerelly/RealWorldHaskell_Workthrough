-- file ExercisesP97ffSpec.hs
module ExercisesP97ffSpec where

import Test.Hspec
import ExercisesP97ff
import Control.Exception.Base

main :: IO ()
main = hspec $ do

   describe "1. Use a fold(choosing the appropriate fold will make your code \
   \ much simpler) to rewrite and improve upon 'asInt' function from the earlier \
   \ section 'Explicid Recursion' on page 85." $ do
	--it "should match the type" $ do`
	--  asInt_fold  `shouldBe` asInt_fold :: String -> Int
	--
      describe "basedDigitToInt" $ do
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
