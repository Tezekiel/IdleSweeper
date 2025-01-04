Field = Object:extend()

local SPRITE_SIZE = 32
local IMAGE_WIDTH = 256
local IMAGE_HEIGHT = 64

function Field:new(row, column)
  self.image = love.graphics.newQuad(0, 0, SPRITE_SIZE, SPRITE_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
  self.x = row * SPRITE_SIZE
  self.y = column * SPRITE_SIZE
  self.width = SPRITE_SIZE
  self.height = SPRITE_SIZE
  self.isMine = false
  self.revealed = false
  self.flagged = false
  self.adjacentMines = 0
end

function Field:revealAdjacentFields(board)
  for dx = -1, 1 do
    for dy = -1, 1 do
      if dx ~= 0 or dy ~= 0 then
        local newRow = self.x / SPRITE_SIZE + dx
        local newCol = self.y / SPRITE_SIZE + dy
        if board[newRow] and board[newRow][newCol] then
          local adjacentField = board[newRow][newCol]
          if not adjacentField.revealed and not adjacentField.isMine then
            adjacentField:reveal(board)
          end
        end
      end
    end
  end
end

local function handleReveal(self)
  if self.adjacentMines == 0 then
    self.image = love.graphics.newQuad(SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
  else
    self.image = love.graphics.newQuad(SPRITE_SIZE * (self.adjacentMines - 1), 32, SPRITE_SIZE, SPRITE_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
  end
end

function Field:reveal(board)
  self.revealed = true
  if self.isMine then
    self.image = love.graphics.newQuad(SPRITE_SIZE * 5, 0, SPRITE_SIZE, SPRITE_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
    love.load(true)
  else
    handleReveal(self, board)
    if self.adjacentMines == 0 then
      self:revealAdjacentFields(board)
    end
  end
end

function Field:flag()
  self.flagged = true
  self.image = love.graphics.newQuad(SPRITE_SIZE * 2, 0, SPRITE_SIZE, SPRITE_SIZE, IMAGE_WIDTH, IMAGE_HEIGHT)
end

function Field:convertToMine()
  self.isMine = true
end

image = love.graphics.newImage("assets/minesweeper.png")

function Field:draw()
  love.graphics.draw(image, self.image, self.x, self.y)
end

function Field:onClicked(x, y, button, board)
  if x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
    if (self.revealed or self.flagged) then
      return
    end
    if button == 1 then
      self:reveal(board)
    elseif button == 2 then
      self:flag()
    end
  end
end
