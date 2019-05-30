module Render where

import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Color

import Game
import Constants

  

clr = makeColorI 255 255 255 255

player :: Game -> Picture
player game = translate
  x
  y
  $ color clr $ ThickCircle 0 ( size game )
  where
    (x, y) = pos game

--  ( fromIntegral screenWidth * (0.5) )
--  ( fromIntegral screenWidth * (0.5) )
--  $ color clr $ ThickCircle 0 100.0

gameAsPicture :: Game -> Picture
gameAsPicture game = translate (fromIntegral screenWidth * (-0.5))
                               (fromIntegral screenHeight * (-0.5))
                               frame
  where
    frame = player game
