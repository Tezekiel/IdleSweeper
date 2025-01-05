local gameOver = {}

function gameOver:enter()
  require "../models/button"

  button = Button(100, 200, "Play again")
end

function gameOver:draw()
  button:draw()
end

function gameOver:mousereleased(x, y)
  isClicked = button:isClicked(x, y)
  if isClicked then
    GameState.switch(Game)
  end
end

return gameOver