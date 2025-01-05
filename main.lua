GameState = require "libs/gameState"

GameOver = require "screens/gameOver"
Game = require "screens/game"

function love.load()
  GameState.registerEvents()
  GameState.switch(Game)
end

function love.update()

end

function love.draw()

end
