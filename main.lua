function love.load(lostGame)
  Object = require "libs/classic"

  if lostGame == true then
    print("You lost")
    love.graphics.clear(0,0,0,1)
    love.graphics.print("You lost", 100, 100)
    require "models/button"
    button = Button(100, 200, "Play again")
    return
  end

  require "models/field"
  require "helpers/generateBoard"

  board = generateBoard(8, 8, 12)
end

function love.update(dt)

end

function love.draw()
  if lostGame then
    button:draw()
    return
  end

  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:draw()
    end
  end
end

function love.mousereleased(x, y, mouseBtn)
  if lostGame then
    button:isClicked(x, y)
    return
  end

  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:onClicked(x, y, mouseBtn, board)
    end
  end
end
