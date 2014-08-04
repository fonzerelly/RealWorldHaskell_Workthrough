        
         \    / _.  _        o | |       ._   _    _|  _  ._
          \/\/ (_| _>   \/\/ | | |   |_| | | _>   (_| (/_ |

          _                                                                     _    ___ ___
         /   _  ._ _  ._  o |  _  ._    _|  _. ._ _  o _|_    _  _.  _   _  ._   )    |   |
         \_ (_) | | | |_) | | (/_ |    (_| (_| | | | |  |_   _> (_| (_| (/_ | | o    _|_ _|_
                      |                                              _|
        ghci> :load myMean.hs
        [1 of 1] Compiling Main             ( myMean.hs, interpreted )

        myMean.hs:19:13:
            Could not deduce (Integral a) arising from a use of `fromIntegral'
            from the context (Num a)
              bound by the type signature for myMean :: Num a => [a] -> Double
              at myMean.hs:18:11-32
            Possible fix:
              add (Integral a) to the context of
                the type signature for myMean :: Num a => [a] -> Double
            In the first argument of `(/)', namely `fromIntegral (sum (ns))'
            In the expression:
              fromIntegral (sum (ns)) / fromIntegral (length (ns))
            In an equation for `myMean':
                myMean ns = fromIntegral (sum (ns)) / fromIntegral (length (ns))
        Failed, modules loaded: none.
        ghci>
















































































slide 010
