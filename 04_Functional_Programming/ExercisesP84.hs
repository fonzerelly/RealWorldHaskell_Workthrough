module ExercisesP84 where
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
   where
      unwrap :: Maybe [a] -> [a]
      unwrap Nothing = []
      unwrap (Just xs) = xs

-- run this version with -XScopedTypeVariables
-- splitWith :: forall a. (a -> Bool) -> [a] -> [[a]]
-- splitWith p (xs) = pre xs : [(post xs)]
--    where
--       pre :: [a] -> [a]
--       pre (x:xs)
--          | p x       = [x]++(pre xs)
--          | otherwise = []
--       post :: [a] -> [a]
--       post (x:xs)
--          | p x       = post xs
--         | otherwise = xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith p (xs) = pre xs : [(post xs)]
   where
      pre (x:xs)
         | p x       = [x]++(pre xs)
         | otherwise = []
      post (x:xs)
         | p x       = post xs
        | otherwise = xs
