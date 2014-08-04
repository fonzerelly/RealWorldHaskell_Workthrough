myLength :: [a] -> Integer
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

assert :: Bool -> Bool
assert False = error "assertion failed"
assert True = True

test_myLength xs = assert(fromIntegral(myLength(xs))==fromIntegral(length(xs)))

mySum :: Num a => [a] -> a
mySum [] = 0
mySum (n:ns) = n + mySum ns

-- myMean :: Num a => [a] -> Double
myMean ns = fromIntegral(mySum(ns))/fromIntegral(myLength(ns))

anotherMean ns = fromIntegral(sum(ns))/fromIntegral(length(ns))
