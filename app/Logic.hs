module Logic where

import Graphics.Gloss.Interface.Pure.Game

import Game
import Constants


transformCoords :: Point -> Point
transformCoords (x, y) = (
                          (-) x $ fromIntegral screenWidth * (-0.5),
                          (-) y $ fromIntegral screenHeight * (-0.5)
                         )

subPoint :: Point -> Point -> Point
subPoint (ax, ay) (bx, by) = (ax - bx, ay - by)


pythagor :: Point -> Float
pythagor (x, y) = sqrt $ (x**2) + (y**2)


nextPoint :: Point -> Point -> Float -> Float -> Point
nextPoint (sourceX, sourceY) (subX, subY) speed vecLength =
  ( subX / vecLength * speed + sourceX
  , subY / vecLength * speed + sourceY
  )

nextCoord :: Game -> Point -> Point
nextCoord game mousePoint =
  let
    (subX, subY) = subPoint mousePoint (pos game)
    vecLength = pythagor (subX, subY)
    nextPointPos = nextPoint (pos game) (subX, subY) (speed game) vecLength
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
                            game { endPos = (normX, normY) }
    _ -> game


tic :: Float -> Game -> Game
tic frame game =
  if (pos game == endPos game)
    then game
    else game { pos = nextCoord game (endPos game) }