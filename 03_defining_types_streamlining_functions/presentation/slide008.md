        
         \    / _.  _        o | |       ._   _    _|  _  ._
          \/\/ (_| _>   \/\/ | | |   |_| | | _>   (_| (/_ |

          _                                                                     _    ___
         /   _  ._ _  ._  o |  _  ._    _|  _. ._ _  o _|_    _  _.  _   _  ._   )    |
         \_ (_) | | | |_) | | (/_ |    (_| (_| | | | |  |_   _> (_| (_| (/_ | | o    _|_
                      |                                              _|
        ghci> :load mySum.hs
        [1 of 1] Compiling Main             ( mySum.hs, interpreted )

        mySum.hs:13:20:
            Could not deduce (a ~ ([Integer] -> Integer))
            from the context (Num a)
              bound by the type signature for mySum :: Num a => [a] -> a
              at mySum.hs:11:10-26
              `a' is a rigid type variable bound by
                  the type signature for mySum :: Num a => [a] -> a
                  at myLength.hs:11:10
            In the second argument of `(+)', namely `mySum'
            In the expression: n + mySum
            In an equation for `mySum': mySum (n : ns) = n + mySum
        Failed, modules loaded: none.
        ghci>
















































































slide 008
