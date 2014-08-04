data BookInfo = Book Int String [String]
                deriving (Show)

extractID (Book id _ _) = id

extractTitle (Book _ title _) = title

