function love.load()
    love.graphics.setBackgroundColor(0,0,0)
    rntext = 0;
    flag = true;
    width = 35;
    randomCounts={}
    for i= 1, 20 do
        randomCounts[i] = 0
    end
end

function love.draw()
    love.graphics.print(rntext,50,50)
    love.graphics.setColor(255, 255, 255);
    for i=1,20 do
        love.graphics.rectangle("fill",(i-1)*width,600,width,-randomCounts[i])
        love.graphics.print(i..':'..randomCounts[i],(i-1)*width,600-randomCounts[i]-20);
    end
end

function love.update(dt)
    rntext = love.math.randomNormal(1,10)
    index = love.math.random(1,20)
    if flag == true then
        randomCounts[index] = randomCounts[index]+1
    end

    if randomCounts[index]==100 then
        flag=false;
    end
end