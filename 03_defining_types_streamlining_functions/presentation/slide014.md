        
         \    / _.  _        o | |       ._   _    _|  _  ._
          \/\/ (_| _>   \/\/ | | |   |_| | | _>   (_| (/_ |

          _                                                                     _    ___
         /   _  ._ _  ._  o |  _  ._    _|  _. ._ _  o _|_    _  _.  _   _  ._   )    | \  /
         \_ (_) | | | |_) | | (/_ |    (_| (_| | | | |  |_   _> (_| (_| (/_ | | o    _|_ \/
                      |                                              _|
        ghci> :load takeHalf.hs
        [1 of 1] Compiling Main             ( takeHalf.hs, interpreted )

        takeHalf.hs:7:24:
            Couldn't match expected type `a1 -> Int' with actual type `Int'
            The function `length' is applied to two arguments,
            but its type `[a0] -> Int' has only one
            In the first argument of `div', namely `(length (xs) 2)'
            In the first argument of `take', namely `(div (length (xs) 2) xs)'

        takeHalf.hs:7:38:
            Couldn't match expected type `Int' with actual type `[a0]'
            In the second argument of `div', namely `xs'
            In the first argument of `take', namely `(div (length (xs) 2) xs)'
            In the expression: take (div (length (xs) 2) xs)
        Failed, modules loaded: none.
        ghci>
















































































slide 014
