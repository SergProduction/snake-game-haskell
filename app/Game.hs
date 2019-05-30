module Game where

import Constants
import Graphics.Gloss.Interface.Pure.Game



data Game = Game { pos
                 , endPos :: Point
                 , speed
                 , size :: Float 
                 }

initialGame :: Game
initialGame = Game {
  endPos = (x, y)
  , pos  = (x, y)
  , speed = 1
  , size = 80.0
}
  where
    x = ( fromIntegral screenWidth * 0.5 )
    y = ( fromIntegral screenHeight * 0.5 )
