require "bezier"

function love.load()
	local point = function(x, y)
		return {x = x, y = y}
	end

	p0 = point(100, 100)
	p1 = point(450, 45)
	p2 = point(560, 200)

	love.graphics.setBackgroundColor(255,255,255)

	points = {}

	
end

function love.update(dt)
	if #points > 1 then
		for i = #points, 1, -1 do
			table.remove(points, i)
		end
	end

	p1.x = love.mouse.getX()
	p1.y = love.mouse.getY()

	for t = 0, 1, 0.01 do
		local pFinal = quadraticBezier(p0, p1, p2, t)
		pFinal.n = t * 100
		points[#points+1] = pFinal
	end
end

function love.draw(dt)
	love.graphics.setColor(0,0,0)

	love.graphics.circle("fill", p0.x, p0.y, 5)
	love.graphics.circle("fill", p1.x, p1.y, 5)
	love.graphics.circle("fill", p2.x, p2.y, 5)

	drawQuadraticBezier(points)
end