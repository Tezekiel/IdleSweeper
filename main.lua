GameState = require "libs/gameState"

gameOver = require "screens/gameOver"
game = require "screens/game"

function love.load()
  GameState.registerEvents()
  GameState.switch(game)
end

function love.update()

end

function love.draw()

end
