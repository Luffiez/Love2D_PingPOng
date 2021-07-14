require("player")
require("ball")
require("ai")
require("background")

function love.load()
    Background:load()
    Player:load()
    AI:load()
    Ball:load()
    Score = {player = 0, ai = 0}
    font = love.graphics.newFont(30)
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    AI:update(dt)
    Ball:update(dt)
end

function love.draw()
    Background:draw()
    Player:draw()
    AI:draw()
    Ball:draw()
    drawScore()
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print(Score.player.."-"..Score.ai, love.graphics.getWidth() / 2, 30)
end

-- AABB collision detection (rectangle)
function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end