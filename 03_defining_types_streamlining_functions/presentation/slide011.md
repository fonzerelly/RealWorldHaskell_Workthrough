        
         \    / _.  _        o | |       ._   _    _|  _  ._
          \/\/ (_| _>   \/\/ | | |   |_| | | _>   (_| (/_ |

          _                                                                     _    ___ ___
         /   _  ._ _  ._  o |  _  ._    _|  _. ._ _  o _|_    _  _.  _   _  ._   )    |   |
         \_ (_) | | | |_) | | (/_ |    (_| (_| | | | |  |_   _> (_| (_| (/_ | | o    _|_ _|_
                      |                                              _|
        myMean :: Num a => [a] -> Double
        myMean ns = fromIntegral(sum(ns))/fromIntegral(length(ns))

        Der Compiler erwartet eine andere Typensignatur:
        myMean :: (Fractional a, Integral a1) => [a1] -> a
        Warum? Was Stimmt an meiner Signatur nicht? Mit der Signatur des Compilers
        erhalte ich nicht dass was ich will, nämlich einen Durchschnitt einer Liste
        unabhängig von ihrem Typ, so lange ihr Typ von Num abgeleitet ist.

















































































slide 011
