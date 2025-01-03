Field = Object:extend()

local spriteSize = 32

function Field:new(row, column)
  self.image = love.graphics.newQuad(0, 0, spriteSize, spriteSize, 256, 64)
  self.x = row * spriteSize
  self.y = column * spriteSize
  self.width = spriteSize
  self.height = spriteSize
  self.isMine = false
  self.revealed = false
  self.flagged = false
  self.adjacentMines = 0
end

function Field:reveal()
  self.revealed = true
  if self.isMine then
    self.image = love.graphics.newQuad(spriteSize * 5, 0, spriteSize, spriteSize)
  else
    self.image = love.graphics.newQuad(spriteSize, 0, spriteSize, spriteSize)
  end
end

function Field:flag()
  self.flagged = not self.flagged
end

function Field:convertToMine()
  self.isMine = true
end

image = love.graphics.newImage("assets/minesweeper.png")

function Field:draw()
  love.graphics.draw(image, self.image, self.x, self.y)
end

function love.mousepressed(x, y)
  print(x, y)
end