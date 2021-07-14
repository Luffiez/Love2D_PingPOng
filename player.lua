Player = {}

function Player:load()
    self.img = love.graphics.newImage("Assets/Player.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.y = love.graphics.getHeight() / 2
    self.x = 50
    self.speed = 500
    self.inputX = 0
    self.inputY = 0
end

function Player:update(dt)
    self:input()
    self:move(dt)
end

function Player:input()
    if love.keyboard.isDown("w") then
        self.inputX = 1
    elseif love.keyboard.isDown("s") then
        self.inputX = -1
    else
        self.inputX = 0
    end
end

function Player:move(dt)
    if self.inputX == 1 and self.y > 0 then
        self.y = self.y - self.speed * dt
    elseif self.inputX == -1 and self.y < love.graphics.getHeight() - self.height then
        self.y = self.y + self.speed * dt
    end
end

function Player:draw()
   -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.draw(self.img, self.x, self.y)
end