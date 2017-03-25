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

module Main where

import Control.Monad.Trans.Class
import Control.Monad.Trans.State
import System.Random

import Pure
import Types

main :: IO ()
main = initState >>= evalStateT playGame

initState :: IO GameState
initState = fmap buildState getStdGen

playGame :: StateT GameState IO ()
playGame = reportGuesses

reportGuesses :: StateT GameState IO ()
reportGuesses = gets reportMessage >>= (lift . putStrLn)

-- jl
