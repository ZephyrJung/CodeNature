function love.load()
    canvas = love.graphics.newCanvas()
    x=10
    y=350
end

function love.draw()
    love.graphics.setColor(255, 255, 255);
    love.graphics.draw(canvas);
end

function love.update(dt)
    x=x+0.1
     canvas:renderTo(function()
        love.graphics.points(x,200+love.math.noise(x-10)*100);
    end);
end