local game = {}
local lume = require "../libs/lume"
local mineCount = 3
local arrays = require "helpers/arrays"
require "helpers/generateBoard"
require "models/loadingCircle"

function game:enter()
  board = generateBoard(3, 3, mineCount)
  scoreboard = mineCount
  coins = 0
  loadingCircle = LoadingCircle(love.graphics.getWidth() / 2, 60, 32, 2, self.onTick)
end

function game:onTick()
  local unrevealed = lume.filter(arrays.flatten(board), function(field)
    return not field.revealed
  end)
  lume.randomchoice(unrevealed):reveal()
  coins = coins + 1
end

function game:update(dt)
  loadingCircle:update(dt)
end

function game:draw()
  love.graphics.print("Mines left: " .. scoreboard, 32, 16)
  for i = 1, #board do
    for j = 1, #board[i] do
      board[i][j]:draw()
    end
  end

  love.graphics.print("Coins: " .. coins, 128, 16)
  loadingCircle:draw()
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