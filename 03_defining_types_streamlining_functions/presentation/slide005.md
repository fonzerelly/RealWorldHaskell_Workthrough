          _
         |_) _. _|_ _|_  _  ._ ._  |\/|  _. _|_  _ |_  o ._   _
         |  (_|  |_  |_ (/_ |  | | |  | (_|  |_ (_ | | | | | (_|
                                                              _|
        Um aus einem Vordefinierten Datentyp oder Tupel einzelne Werte zu extrahieren
        kann mit einer entsprechenden Funktionsdefinition der Typus 'dekonstruiert' werden:
        MyConstructor -> integer
        getID (MyConstructor id _) = id

        MyConstructor -> String
        getName (MyConstructor _ name) = name
        Da das Wunschdatum von seiner Position im Datentyp abhängt, müssen die Variablen
        entsprechend der Reihenfolge im Constructor definiert werden. Sollten bestimmten
        Variablen nicht interessieren, kann der Platzhalter _ auch mehrfach benutzt werden,
        um Variablen zu ignorieren.

        Mit dem : lassen sich Listen im Funktionsaufruf dekonstruieren:
        mySum [] = 0
        mySum (x:xs) = x + mySum xs

















































































slide 005
