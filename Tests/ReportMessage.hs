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
tests = TestLabel "reportMessage" $ TestList
  [tests10, tests1, tests0]

tests10 :: Test
tests10 = TestLabel "10 guesses" $
  reportMessage (state {guessesLeft = 10}) ~?= "You have 10 guesses left."

tests1 :: Test
tests1 = TestLabel "1 guess" $
  reportMessage (state {guessesLeft = 1}) ~?= "You have 1 guess left."

tests0 :: Test
tests0 = TestLabel "no guesses" $
  reportMessage (state {guessesLeft = 0}) ~?= "You have no guesses left."

state :: GameState
state = buildState (mkStdGen 0)

-- jl
