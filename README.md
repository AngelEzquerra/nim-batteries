# nim-batteries

This is a nim module that imports commonly used standard library modules for your convenience:

```nim
  import batteries
```

is the same as:

```nim
  import std/[os, strutils, times, parseutils, hashes, tables, sets,
    sequtils, parseopt, strformat, sugar, options, strscans, algorithm,
    math]
```

This module is similar to the standard library `prelude module`.
The differences with prelude are that this module should be imported
(while prelude had to be included), and that it imports a few more modules
than prelude. The list of imported modules might change in the future as
nim evolves.

Importing this module never triggers a UnusedImport warning, even if you
don't use any if the modules it imports.
