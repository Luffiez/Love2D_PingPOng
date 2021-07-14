Ball = {}

function Ball:load()
    self.img = love.graphics.newImage("Assets/Ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:Collide()
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:Collide()
    if self:ColliderPlayer() or self:ColliderAI() then
        self.speed = self.speed + 20
    end

    self:ColliderWall()
    self:Score()
end

function Ball:ColliderWall()
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y > love.graphics.getHeight() - self.height then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end
end

function Ball:Score()
    if self.x < 0 then
        Score.player = Score.player + 1
        self:Reset(-1)
    end
    
    if self.x + self.width > love.graphics.getWidth() then
        Score.ai = Score.ai + 1
        self:Reset(1)
    end
end

function Ball:ColliderPlayer()
    if checkCollision(self, Player) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5 
        return true
    end    
    return false
end

function Ball:ColliderAI()
    if checkCollision(self, AI) then
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVel = collisionPosition * 5
        return true 
    end
    return false
end

function Ball:Reset(direction)
    self.yVel = 0
    self.speed = 200
    self.xVel = self.speed * direction
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
end
