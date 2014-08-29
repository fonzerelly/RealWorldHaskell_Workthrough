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
safeInit (x:xs) = Just ([x]++(fromMaybe [] (safeInit xs)))
   where
      fromMaybe defval wrapped =
         case wrapped of
            Nothing -> defval
            Just value -> value


