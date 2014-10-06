# Typeinference is a Double-Edged Sword

If you ommit type definitions, this might lead to
hard to understand compiler errors:

````Haskell
upcaseFirst (c:cs) = toUpper c -- forgot ":cs" here

camelCase :: String -> String
camelCase xs = concat (map upcaseFirst (words xs))
````

will lead to this Error message

```Haskell
error.hs:5:28:
    Couldn't match type `Char' with `[Char]'
    Expected type: [Char] -> [Char]
      Actual type: [Char] -> Char
    In the first argument of `map', namely `upcaseFirst'
    In the first argument of `concat', namely
      `(map upcaseFirst (words xs))'
Failed, modules loaded: none.
```

#Use type signatures especially on stubs
Escepcially use type signatures where you use undefined or error, because
they fit to any type signature. If we ommit a type signature, we may be able
to use the value we defined in places where a correctly typed version would
be rejected by the compiler.


#Point-free-Style vs "pointry" Style
Point-free-Style
```Haskell
string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar
```

Pointry-Style
```Haskell
string :: String -> Doc
string s = enclose '"' '"' (hcat (map oneChar s))
```

Point-free-Style is more readable and can not be written with
the function parameter.

#oneChar
```Haskell
oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
               Just r -> text r
               Nothing | mustEscape c -> hexEscape c
                       | otherwise    -> char c
         where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'
```
oneChar decides how to escape a character. If a character
is one of the so called 'simpleEscapes' namely the well known
special characters like \n or \", it will be passed as Doc specific
String into the document tree by 'text'. Otherwise, mustEscape
requires all characters outside the ASCII-Range and /x7f to be escaped
by hexEscape. Any other Character gets added as Char into Document.

#hexEscape
```Haskell
hexEscape :: Char -> Doc
hexEscape c
   | d < 0x10000 = smallHex d
   | otherwise = astral (d - 0x10000)
   where d = ord c
```
hexEscape can handle Unicode characters up to /xffff by smallHex
which simply adds leading zeros to the char if necessary. Unicode
characters above that threahold have to be mapped onto two regular
Unicode characters by the function 'astral' (This ought to be
discussed in a Unicode-course...)

#series
```Haskell
series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
series open close item = enclose open close
   . fsep
   . punctuate (char ',')
   . map item
```
series is a helper function for renderJValue to create Doc-representations
of list alike  types (namely arrays and objects). The item parameter converts
each element of  the list to a Doc-Type. punctuate adds in this case a comma
after each element of the resulting list. Finally fsep combines the list to
one single Doc-Value

#hcat vs fsep
Both functions are base on fold, which uses empty as default accumulator. But
hcat is used two really concatenate two elements:

```Haskell
hcat :: [Doc] -> Doc
hcat = fold (<>)

(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y = x `Concat` y
```

Whereas fsep prestores a
softline wherever a linebreak might be opportune.
```Haskell
fsep :: [Doc] -> Doc
fsep = fold (</>)

(</>) :: Doc -> Doc -> Doc
x </> y = x <> softline <> y

softline :: Doc
softline = group line

group :: Doc -> Doc
group x = flatten x `Union` x

flatten:: Doc -> Doc
flatten (x `Concat` y)  = flatten x `Concat` flatten y
flatten Line            = Char ' '
flatten (x `Union` _)   = flatten x
flatten other           = other
```

#compact
``` Haskell
compact :: Doc -> String
compact x = transform [x]
   where
      transform [] = ""
      transform (d:ds) =
         case d of
            Empty          -> transform ds
            Char c         -> c : transform ds
            Text s         -> s ++ transform ds
            Line           -> '\n' : transform ds
            a `Concat` b   -> transform (a:b:ds)
            _ `Union` b    -> transform (b:ds)
```
compact prints the JSON data with the smalest possible memory footprint.
For that it basically converts all Doc-Consstructors to Strings and
stores them in one single String. Especially the flattend Version of
a Union will not be considered because its alternative uses less
space.

#pretty
``` Haskell
pretty :: Int -> Doc -> String
pretty width x = best 0 [x]
   where
      best col (d:ds) =
         case d of
            Empty          -> best col ds
            Char c         -> c : best (col + 1) ds
            Text s         -> s ++ best (col + length s) ds
            Line           -> '\n' : best 0 ds
            a `Concat` b   -> best col (a:b:ds)
            a `Union` b    -> nicest col (best col (a:ds)) (best col (b:ds))
      best _ _ = ""

      nicest col a b
         | (width - least) `fits` a = a
         | otherwise                = b
         where least = min width col

```
pretty takes care of the width it may use, predefined by the user. It
stores for each element a the size of its usage. By that it can decide
for Unions wheather to use the flattened version or the regular version.
To do so, it defines the local function nicest, which decides by fits
which alternative to take. fits is a simple Bool-Function that returns
false if there is no space left or true otherwise (by handling "" and "\n"
ths same way)

#Creating a package
For Haskell mainly cabal is used as a package manager. It downloads and builds
all depending packages needed. To create your own package, you create a .cabal
file in your toplevel package directory which by convention gets the same name
as the directory. It will contain:
``` Haskell
Name: myname
Version: 0.1
Synopsis: What my package does
Description: in Detail
Authoer: me
Maintainer: me@example.com
library
  Exposed-Modules: Prettify
                   PrettyJSON
                   SimpleJSON
  Build-Depends    base >= 2.0
```

A Setup.hs-file could be created to do further configuration
``` Haskell
#!/usr/bin/env runhaskell
import Distribution.Simple
main = defaultMain

#Install a package
```bash
$ runghc Setup configure
$ runghc Setup build

