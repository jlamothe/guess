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

module Tests.BuildState (tests) where

import System.Random
import Test.HUnit

import Config
import Pure
import Types

tests :: Test
tests = TestLabel "buildState" $ TestList
  [checkElements, checkGuesses]

checkElements :: Test
checkElements = TestLabel "Elements" $ TestList $
  map checkElement $ take 5 $ zip [0..] $ picks state

checkElement :: (Int, Int) -> Test
checkElement (index, val) = TestLabel ("Element " ++ show index) $ TestList
  [checkMin val, checkMax val]

checkMin :: Int -> Test
checkMin val = TestLabel "lower bound" $ TestCase $ assertBool
  ("Expected > 0\nGot: " ++ show val) $
  val > 0

checkMax :: Int -> Test
checkMax val = TestLabel "upper bound" $ TestCase $ assertBool
  ("Expected <= " ++ show maxPick ++ "\nGot: " ++ show val) $
  val <= maxPick

checkGuesses :: Test
checkGuesses = TestLabel "guessesLeft" $
  guessesLeft state ~?= maxGuesses

state :: GameState
state = buildState $ mkStdGen 0

-- jl
