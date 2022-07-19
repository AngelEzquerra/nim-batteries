# MIT License
#
# Copyright (c) 2022 Angel Ezquerra
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Note that this code is very heavily based on nim's prelude.nim, which is also
# MIT licensed.

when defined(nimdoc) and isMainModule:
  from std/compileSettings import nil
  when compileSettings.querySetting(compileSettings.SingleValueSetting.projectFull) == currentSourcePath:
    ## This is a module that imports commonly used nim standard library modules for your convenience:
    ##
    ## ```nim
    ##   import batteries
    ## ```
    ##
    ## is the same as:
    ##
    ## ```nim
    ##   import std/[os, strutils, times, parseutils, hashes, tables, sets,
    ##     sequtils, parseopt, strformat, sugar, options, strscans, algorithm,
    ##     math]
    ## ```
    ##
    ## This module is similar to the standard library `prelude module`.
    ## The differences with prelude are that this module should be imported
    ## (while prelude had to be included), and that it imports a few more modules
    ## than prelude. The list of imported modules might change in the future as
    ## nim evolves.
    ##
    ## Importing this module never triggers a UnusedImport warning, even if you
    ## don't use any if the modules it imports.
    runnableExamples:
      import std/batteries
      # same as:
      # import std/[os, strutils, times, parseutils, hashes, tables, sets,
      #   sequtils, parseopt, strformat, sugar, options, strscans, algorithm,
      #   math]

      # Test the different imports, starting with os
      assert addFileExt("foo", "baz") == "foo.baz"

      # Test strutils
      let x = 1
      assert "foo $# $#" % [$x, "bar"] == "foo 1 bar"

      # Test times
      let t = now()

      # Test parseutils
      assert parseInt("1") == 1

      # Test hashes
      let hs = hash("hash me!")

      # Test tables
      let tbl = {1: "one", 2: "two"}.toTable
      assert tbl[2] == "two"

      # Test sets
      let st = toHashSet([3, 5, 7])

      # Test sequtils
      assert toSeq(1..3) == @[1, 2, 3]

      # Test strformat
      assert &"{x}" == "1"

      # Test options
      let a = some(1)

      # Test sugar
      dump(x + 1)

      # Test strscans
      var y: int
      assert scanf("(1)", "($i)", y)

      # Test algorithm
      var z = @[3, 2, 1]
      z.sort() 
      assert z == @[1, 2, 3]

      # Test math
      assert sqrt(4.0) == 2.0

      when not defined(js) or defined(nodejs):
        assert getCurrentDir().len > 0
        assert ($now()).startsWith "20"

  # xxx `nim doc -b:js -d:nodejs --doccmd:-d:nodejs batteries.nim` fails for some reason
  # specific to `nim doc`, but the code otherwise works with nodejs.

# Mark this module as used to avoid getting apparently "random" UnusedImport
# errors in the unlikely event that none of these modules is used
{.used.}

import std/[os, strutils, times, parseutils, hashes, tables, sets, sequtils,
  parseopt, strformat, sugar, options, strscans, algorithm, math]

export os, strutils, times, parseutils, hashes, tables, sets, sequtils,
  parseopt, strformat, sugar, options, strscans, algorithm, math
