-- file ExercisesP97ffSpec.hs
module ExercisesP97ffSpec where

import Test.Hspec
import ExercisesP97ff

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
	

   describe "2. Your function should behave as follows" $ do
      it "should convert the string '101' to int 101" $ do
         asInt_fold "101" `shouldBe` 101
      it "should convert the string '-31337' to int -31337" $ do
         asInt_fold "-31337" `shouldBe` -31337
      it "should convert the string '1798' to int 1798" $ do
         asInt_fold "1798" `shouldBe` 1798
