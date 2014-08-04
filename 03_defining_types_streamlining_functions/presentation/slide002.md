                ___
         |\/|    |    ._   _
         |  | \/ | \/ |_) (/_
              /    /  |
        data MyType = MyConstructor Int String
                      deriving(Show)


        Ihm wird eine Constructor-Funktion übergeben

        Dieser Konstruktor erwartet alle Parameter des Typs in der 'richtigen Reihenfolge'

        deriving wurde noch nicht erklärt, aber es wird wohl sowas ähnliches bedeuten wie von mehreren Interfaces erben

        ghci>MyConstructor 1 "me"

        ghci>:type it
        it :: MyType
















































































slide 002
