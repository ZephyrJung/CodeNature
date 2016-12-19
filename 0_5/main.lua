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
    love.graphics.setColor(255, 255, 255);
    for i=1,20 do
        love.graphics.rectangle("fill",(i-1)*width,600,width,-randomCounts[i])
        love.graphics.print(i..':'..randomCounts[i],(i-1)*width,600-randomCounts[i]-20);
    end
end

function love.update(dt)
    index = getRandom()
    if flag == true then
        randomCounts[index] = randomCounts[index]+1
    end

    if randomCounts[index]==100 then
        flag=false;
    end
end

function getRandom()
    while (true) do
        r1 = love.math.random(1,20);
        r2 = love.math.random(1,20);
        if r2 < r1 then
            return r1
        end
    end
end