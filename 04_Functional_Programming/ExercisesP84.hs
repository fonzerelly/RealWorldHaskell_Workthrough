module ExercisesP84 where
safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just(x)
safeHead [] = Nothing
