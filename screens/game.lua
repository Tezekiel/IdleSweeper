local game = {}
local lume = require "../libs/lume"
local mineCount = 1
local arrays = require "helpers/arrays"
require "helpers/generateBoard"

function game:enter()
  board = generateBoard(2, 2, mineCount)
  scoreboard = mineCount
end

function game:draw()
  love.graphics.print("Mines left: " .. scoreboard, 10, 10)
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

  -- update number of mines / flags left
  scoreboard = mineCount - lume.count(arrays.flatten(board), function(field)
    return field.flagged
  end)

  self:checkWin()
end

function game:checkWin()
  if lume.count(arrays.flatten(board), function(field)
    return field.mined and field.flagged
  end) == mineCount then
    GameState.switch(gameOver, "You won! ")
  end
end

return game