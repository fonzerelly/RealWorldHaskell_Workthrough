-- file ExercisesP84Spec.hs
module ExercisesP84Spec where

import Test.Hspec
import ExercisesP84

main :: IO ()
main = hspec $ do

   describe "1. Write your own 'safe' definitions of the standard partial \
   \ list functions, but make sure they never fail." $ do

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

   describe "2. Write a function 'splitWith' that acts similarly to 'words' \
   \ but takes a predicate and a list of any type, and then splits its input \
   \ list on every element for which the predicate returns False" $ do

      it "should split the list of Int with odd-predicate on even values" $ do
         splitWith odd [1,2,3] `shouldBe` [[1],[3]]
         splitWith odd [1,1,2,3,4,5,5] `shouldBe` [[1,1],[3],[5,5]]

      it "should return  empty list if empty list is passed" $ do
         splitWith odd [] `shouldBe` []

   describe "3. Using the command framework from the earlier seciton 'A Simple \
   \ Command-Line Framework' on page 71, write aprogram that prints the first word \
   \ of each line of its input." $ do

      it "should return a list with every first word of newline separated text" $ do
         firstWords "one two three\none two three" `shouldBe` "one\none\n"

      it "should return repeat empty lines" $ do
         firstWords "one two three\n\none two three" `shouldBe` "one\n\none\n"

   describe "4. Write a program that transposes the text in a file" $ do

      describe "firstChars" $ do
         it "should extract each first Char of a list of Strings into a list of Maybes" $ do
            firstChars ["Hello", "World"] `shouldBe` [Just 'H', Just 'W']
            firstChars ["Hello", "", "World"] `shouldBe` [Just 'H', Nothing, Just 'W']

      describe "firstCharsOrElse" $ do
         it "should extract each first Char of a list of Strings into one new String" $ do
            firstCharsOrElse ' ' ["Hello", "World"] `shouldBe` "HW"
            firstCharsOrElse ' ' ["Hello", "World", "around"] `shouldBe` "HWa"

         it "should append a whitespace in case of an empty string" $ do
            firstCharsOrElse ' ' ["Hello", "World", ""] `shouldBe`"HW "
            firstCharsOrElse ' ' ["Hello", "", "around"] `shouldBe`"H a"

      describe "transposeStrings" $ do
         context "when strins are equally long" $ do
            it "should combine each char of each string to a new Stringlist" $ do
               transposeStrings ["Hello", "World"] `shouldBe` ["HW", "eo", "lr", "ll", "od"]

         context "when strings are not equally long" $ do
            it "should fill up shorter strings with whitespaces" $ do
            transposeStrings ["Hey", "guys"] `shouldBe` ["Hg", "eu", "yy", " s"]

      describe "transposeLines" $ do
         it "should mix the letters of each line with each other" $ do
            transposeLines "hello\nworld\n" `shouldBe` "hw\neo\nlr\nll\nod\n"
