local gameOver = {}

function gameOver:enter(from, message)
  require "../models/button"

  local msg = message or "Game over! "
  button = Button(100, 200, msg .. "Play again")
  self.from = from
end

function gameOver:draw()
  self.from:draw()
  button:draw()
end

function gameOver:mousereleased(x, y)
  isClicked = button:isClicked(x, y)
  if isClicked then
    GameState.switch(game)
  end
end

return gameOver