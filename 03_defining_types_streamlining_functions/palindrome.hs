myReverse [] = []
myReverse (x:xs) = myReverse(xs) ++ [x]
palindrome (xs) = xs ++ myReverse(xs)

isPalindrome xs = palindrome (take (div (length xs) 2) xs) == xs


