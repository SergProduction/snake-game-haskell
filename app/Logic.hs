module Logic where

import Graphics.Gloss.Interface.Pure.Game

import Game
import Constants


transformCoords :: Point -> Point
transformCoords (x, y) = (
                          (-) x $ fromIntegral screenWidth * (-0.5),
                          (-) y $ fromIntegral screenHeight * (-0.5)
                         )


nextCoord :: Game -> Point -> Point
nextCoord game mousePoint =
  let
    (px, py) = pos game
    (mx, my) = mousePoint
    dirX = mx - px
    dirY = my - py
    distance = sqrt $ (dirX**2) + (dirY**2)
    nextPointPos =
      ( dirX / distance * (speed game) + px
      , dirY / distance * (speed game) + py
      )
  in
    nextPointPos



movePlayer :: Game -> Game
movePlayer game = game { pos = newPos }
  where
    newPos = nextCoord game (endPos game)




transformGame :: Event -> Game -> Game
transformGame event game =
  case event of
    EventMotion (x, y) -> let
                            (normX, normY) = transformCoords (x, y)
                            nextPointPos = nextCoord game (normX, normY)
                          in
                            game { endPos = (normX, normY), pos = nextPointPos }
    _ -> game


tic :: Float -> Game -> Game
tic frame game =
  if (pos game == endPos game)
    then game
    else game { pos = nextCoord game (endPos game) }