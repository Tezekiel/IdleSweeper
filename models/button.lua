Button = Object:extend()

function Button:new(x, y, text)
  self.x = x
  self.y = y
  self.width = 200
  self.height = 50
  self.text = text
end

function Button:draw()
  love.graphics.setColor(0.8, 0.8, 0.8)
  love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
  love.graphics.setColor(0, 0, 0)
  love.graphics.printf(button.text, button.x, button.y + button.height / 4, button.width, "center")
end

function Button:isClicked(x, y)
  if x > button.x and x < button.x + button.width and y > button.y and y < button.y + button.height then
    love.load()
  end
end