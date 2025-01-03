function love.load()
  Object = require "libs/classic"
  require "models/field"
  require "helpers/generateBoard"

  board = generateBoard(8, 8, 12)
end

function love.update(dt)

end

function love.draw()
  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:draw()
    end
  end
end
