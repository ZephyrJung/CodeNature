SW,SH = love.graphics.getDimensions( )

local bgSky = love.graphics.newCanvas(SW,SH)
-- function love.load()
--     canvas = love.graphics.newCanvas()
--     x=10
--     y=350
-- end

function love.draw()
-- 	for i=0,500 do
-- 		for j=0,500 do
-- 			love.graphics.setColor(255,255,255,255*love.math.noise(1.6,0.5))
-- 			love.graphics.points(i,j)
-- 		end
-- 	end
love.graphics.setColor(255, 255, 255, 255)
love.graphics.draw(bgSky)
end

function love.update(dt)
	computeSky()
end



function computeSky()
	local abs=math.abs
	local id = love.image.newImageData(SW,SH)
	local cc={200,200,200}
	local maxr=1
	--local minr=0.8
	local minr=0.5
	--local yrad=maxr/minr
	local yrad=2*maxr - minr
	
	local ox= 50*love.math.random() - 25
	local oy= 50*love.math.random() - 25
	local oz= 50*love.math.random() - 25

	for x=0,SW-1 do
		local alpha = 2*x/SW*math.pi
		for y=0,SH-1 do
			local beta = 2 *y/SH*math.pi
			local yy= oy+yrad*math.sin(beta)
			local ur = maxr - minr*math.cos(beta)
			local xx = ox+ur*math.cos(alpha)
			local zz = oz+ur*math.sin(alpha)
			local u1 = love.math.noise(xx,yy,zz)
			local u2 = love.math.noise(2*xx,2*yy,2*zz)
			local u3 = love.math.noise(4*xx,4*yy,4*zz)
			local u4 = love.math.noise(8*xx,8*yy,8*zz)
			local u = u1 + u2/2 + u3/4 + u4/8
			--u=4*u-math.floor(4*u)
			u=u/1.875
			id:setPixel(x,y,cc[1],cc[2],cc[3],u*255)
		end
	end
	
	local sx = love.math.random(100,300)
	local sy = love.math.random(100,300)

	love.graphics.setCanvas(bgSky)
	love.graphics.clear()
	local img = love.graphics.newImage(id)
	love.graphics.draw(img,-sx,-sy)
	love.graphics.draw(img,SW-sx,-sy)
	love.graphics.draw(img,-sx,SH-sy)
	love.graphics.draw(img,SW-sx,SH-sy)
	love.graphics.setCanvas()
end

