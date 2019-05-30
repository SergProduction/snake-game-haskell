module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.Color

import Game
import Logic
import Render
import Constants

window = InWindow "Agar.io haskell" (screenWidth, screenHeight) (100, 100)

backgroundColor = makeColor 0 0 0 255


main :: IO ()
main = play window backgroundColor 60 initialGame gameAsPicture transformGame tic

