Background = {}

function Background:load()
    self.universe = love.graphics.newImage("Assets/Universe.png")
    self.planets = love.graphics.newImage("Assets/Planets.png")

    self.planetsWidth = self.planets:getWidth()
    self.planetsHeight = self.planets:getHeight()
    self.rotation = 0
end

function Background:update(dt)
    self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
    love.graphics.draw(self.universe, 0, 0)
    local x = self.planetsWidth / 2
    local y = self.planetsHeight / 2
    love.graphics.draw(self.planets, x, y, self.rotation, 1, 1, x, y)
end