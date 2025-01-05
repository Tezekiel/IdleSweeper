local gameOver = {}

function gameOver:enter(from)
  require "../models/button"

  button = Button(100, 200, "Play again")
  self.from = from
end

function gameOver:draw()
  self.from:draw()
  button:draw()
end

function gameOver:mousereleased(x, y)
  isClicked = button:isClicked(x, y)
  if isClicked then
    GameState.switch(Game)
  end
end

return gameOver