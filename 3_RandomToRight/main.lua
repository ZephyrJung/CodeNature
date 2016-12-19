local canvas = love.graphics.newCanvas()
function love.load()
    Walker={x=300,y=300}
end

function love.draw()
    love.graphics.setColor(255, 255, 255);
    love.graphics.draw(canvas);
end

function step()
    choice = love.math.random(1,10)
    if choice <= 4 then
        Walker.x=Walker.x+1
    elseif choice > 4 and choice <= 6 then
        Walker.x=Walker.x-1
    elseif choice > 6 and choice <= 8 then
        Walker.y=Walker.y+1
    else
        Walker.y=Walker.y-1
    end
end

function love.update(dt)
     canvas:renderTo(function()
        love.graphics.setColor(love.math.random(255), 0, 0);
        step()
        love.graphics.points(Walker.x,Walker.y);
    end);
end