          _                      __
         |_)  _   _  _  ._ _|   (_     ._ _|_  _.
         | \ (/_ (_ (_) | (_|   __) \/ | | |_ (_| ><
                                    /
        Die Record Syntax ist eine convienience-Schreibweise, mit der neben der
        Typen-Deklaration auch automatisch die Getter der einzelnen Typ-Komponenten erstellt werden
        können:
        data MyType = MyType {
            id :: Integer
                name :: String
        } deriving (Show)

        ghci>name (MyType 1 "herbert")
        it = herbert

















































































slide 006
