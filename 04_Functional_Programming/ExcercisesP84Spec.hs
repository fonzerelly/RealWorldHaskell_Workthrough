-- file ExercisesP84Spec.hs
module ExercisesP84Spec where

import Test.Hspec
import ExercisesP84

main :: IO ()
main = hspec $ do
  describe "1. Write your own 'safe' definitions of the standard partial  list functions, but make sure they never fail." $ do

   describe "safeHead" $ do
    it "returns the first value of a given list" $ do
      safeHead [1,2,3] `shouldBe` Just 1

    it "returns Nothing if empty list is given" $ do
      safeHead ([]::[Int]) `shouldBe` Nothing

   describe "safeTail" $ do
    it "returns all but the first value of a given list" $ do
      safeTail [1,2,3] `shouldBe` Just [2,3]

    it "returns an empty List, if list contains single item" $do
      safeTail [1] `shouldBe` Just []

    it "return Nothing if list is empty" $ do
      safeTail ([]::[Int]) `shouldBe` Nothing

   describe "safeLast" $ do
    it "returns the last element of a given list" $ do
      safeLast [1,2,3] `shouldBe` Just 3

    it "returns Nothing if list is empty" $ do
      safeLast ([]::[Int]) `shouldBe` Nothing

   describe "saveInit" $ do
    it "returns all but the last element of a given list" $do
      safeInit [1,2,3] `shouldBe` Just [1,2]

    it "returns Nothing if list is empty" $ do
      safeInit ([]::[Int]) `shouldBe` Nothing

