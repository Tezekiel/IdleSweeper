local game = {}

function game:enter()
  require "../helpers/generateBoard"
  board = generateBoard(8, 8, 12)
end

function game:draw()
  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:draw()
    end
  end
end

function game:mousereleased(x, y, mouseBtn)
  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:onClicked(x, y, mouseBtn, board)
    end
  end
end

return game