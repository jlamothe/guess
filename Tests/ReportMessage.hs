{-
Guess
Copyright (C) 2017
Jonathan Lamothe <jlamothe1980@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

module Tests.ReportMessage (tests) where

import System.Random
import Test.HUnit

import Pure
import Types

tests :: Test
tests = TestLabel "reportMessage" $ TestList $
  map (\(label, val, msg) ->
    TestLabel label $
    reportMessage (state {guessesLeft = val}) ~?= msg)
  [ ("10 guesses", 10, "You have 10 guesses left.")
  , ("1 guess"   , 1,  "You have 1 guess left.")
  , ("no guesses", 0,  "You have no guesses left.")
  ]

state :: GameState
state = buildState (mkStdGen 0)

-- jl
