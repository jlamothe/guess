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

module Pure (buildState, reportMessage, checkGuesses) where

import System.Random

import Config
import Types

buildState :: StdGen -> GameState
buildState g = GameState
  { picks       = randomRs (1, maxPick) g
  , guessesLeft = maxGuesses
  }

reportMessage :: GameState -> String
reportMessage s = case guessesLeft s of
  0 -> "You have no guesses left."
  1 -> "You have 1 guess left."
  x -> "You have " ++ show x ++ " guesses left."

checkGuesses :: GameState -> Bool
checkGuesses s = guessesLeft s > 0

-- jl
