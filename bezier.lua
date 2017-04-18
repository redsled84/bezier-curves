quadraticBezier = function(p0, p1, p2, t, pFinal)
	pFinal = pFinal or {}
	pFinal.x = math.pow(1 - t, 2) * p0.x +
				(1 - t) * 2 * t * p1.x +
				t * t * p2.x
	pFinal.y = math.pow(1 - t, 2) * p0.y +
				(1 - t) * 2 * t * p1.y +
				t * t * p2.y
	return pFinal
end

drawQuadraticBezier = function(points)
	for i = 1, #points do
		if i < #points - 1 then
			local pA = points[i]
			local pB = points[i+1]
			love.graphics.line(pA.x, pA.y, pB.x, pB.y)
		end
	end
end

cubicBezier = function(p0, p1, p2, p3, t, pFinal)
	pFinal = pFinal or {}
	pFinal.x = math.pow(1 - t, 3) * p0.x +
				math.pow(1 - t, 2) * 3 * t * p1.x +
				(1 - t) * 3 * t * t * p2.x +
				t * t * t * p3.x
	pFinal.y = math.pow(1 - t, 3) * p0.y +
				math.pow(1 - t, 2) * 3 * t * p1.y +
				(1 - t) * 3 * t * t * p2.y +
				t * t * t * p3.y
	return pFinal
end
