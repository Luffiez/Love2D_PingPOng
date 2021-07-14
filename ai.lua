AI = {}

function AI:load()
    self.img = love.graphics.newImage("Assets/AI.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 500

    self.timer = 0
    self.rate = 0.5
end

function AI:update(dt)

    -- Only check target every 0.5 seconds, to make AI slower
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:findTarget()
    end

    self:move(dt)
end

function AI:move(dt)
     self.y = self.y + self.yVel * dt
end

function AI:findTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

function AI:draw()  
    love.graphics.draw(self.img, self.x, self.y)
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end