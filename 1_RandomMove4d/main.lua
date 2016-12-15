local canvas = love.graphics.newCanvas()
function love.load()
    Walker={x=300,y=300}
end

function love.draw()
    love.graphics.setColor(255, 255, 255);
    love.graphics.draw(canvas);
end

function step()
    choice = love.math.random(1,4)
    if choice == 1 then
        Walker.x=Walker.x+1
    elseif choice == 2 then
        Walker.x=Walker.x-1
    elseif choice ==4 then
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

--下面这是个失败的解法，原因暂时不明
--参考：https://alexarjing.github.io/2016/12/06/chapter10/
-- function love.load()
--     Walker={x=300,y=300}
--     canvas = love.graphics.newCanvas()
--     love.graphics.setCanvas(canvas)
--     love.graphics.setColor(230,240,120)
--     love.graphics.points(Walker.x,Walker.y)
--     love.graphics.setCanvas()
-- end

-- function love.draw()
--     love.graphics.setColor(255,255,255)
--     love.graphics.draw(canvas, 200,100, 0, .5,.5)
-- end

-- function step()
--     choice = love.math.random(1,4)
--     if choice == 1 then
--         Walker.x=Walker.x+1
--     elseif choice == 2 then
--         Walker.x=Walker.x-1
--     elseif choice ==4 then
--         Walker.y=Walker.y+1
--     else
--         Walker.y=Walker.y-1
--     end
-- end

-- function love.update(dt)
--     step()
-- end