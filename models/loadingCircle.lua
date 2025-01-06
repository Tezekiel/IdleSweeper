local Object = require "../libs/classic"
LoadingCircle = Object:extend()

function LoadingCircle:new(x, y, radius, speed, onFullCircle)
  self.x = x
  self.y = y
  self.radius = radius
  self.speed = speed
  self.angle = 0
  self.onFullCircle = onFullCircle
end

function LoadingCircle:update(dt)
  self.angle = self.angle + self.speed * dt
  if self.angle >= 2 * math.pi then
    self.angle = 0
    self.onFullCircle()
  end
end

function LoadingCircle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("line", self.x, self.y, self.radius)
  love.graphics.arc("fill", self.x, self.y, self.radius, 0, self.angle)
end