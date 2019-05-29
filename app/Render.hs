module Render where

import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Color

import Game
import Constants

  

clr = makeColorI 255 255 255 255

myline :: Picture
myline = color clr $ line [(0, 0), (100, 100)]

gameAsPicture :: Game -> Picture
gameAsPicture game = translate (fromIntegral screenWidth * (-0.5))
                               (fromIntegral screenHeight * (-0.5))
                               frame
  where
    frame = myline
