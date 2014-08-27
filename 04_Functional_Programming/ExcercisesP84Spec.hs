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

