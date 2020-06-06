local width, height = term.getSize()
local scale = 3
--peripheral.wrap("top").setTextScale(0.5)
--local camera = vector.new(0, 10, 0)
local corners = {
	vector.new(-2.5,-2.5,-2.5),
	vector.new(2.5,-2.5,-2.5),
	vector.new(-2.5,2.5,-2.5),
	vector.new(-2.5,-2.5,2.5),
	vector.new(2.5,2.5,-2.5),
	vector.new(2.5,-2.5,2.5),
	vector.new(-2.5,2.5,2.5),
	vector.new(2.5,2.5,2.5),
}

function ThreeToTwo (corner)
	local x = (scale*corner["x"]) + (width/2)
	local y = (scale*corner["z"]) + (height/2)
	return {x, y}
end

function Draw ()
	term.setBackgroundColor(32768)
	term.clear()
	local coords = {}
	for i = 1, 8 do 
		coords[i] = ThreeToTwo(corners[i])
		--paintutils.drawPixel(coords[i][1], coords[i][2], 8192)
	end
	paintutils.drawLine(coords[1][1], coords[1][2], coords[2][1], coords[2][2], 8192)
	paintutils.drawLine(coords[1][1], coords[1][2], coords[3][1], coords[3][2], 8192)
	paintutils.drawLine(coords[1][1], coords[1][2], coords[4][1], coords[4][2], 8192)
	paintutils.drawLine(coords[5][1], coords[5][2], coords[2][1], coords[2][2], 8192)
	paintutils.drawLine(coords[5][1], coords[5][2], coords[3][1], coords[3][2], 8192)
	paintutils.drawLine(coords[5][1], coords[5][2], coords[8][1], coords[8][2], 8192)
	paintutils.drawLine(coords[6][1], coords[6][2], coords[2][1], coords[2][2], 8192)
	paintutils.drawLine(coords[6][1], coords[6][2], coords[4][1], coords[4][2], 8192)
	paintutils.drawLine(coords[6][1], coords[6][2], coords[8][1], coords[8][2], 8192)
	paintutils.drawLine(coords[7][1], coords[7][2], coords[8][1], coords[8][2], 8192)
	paintutils.drawLine(coords[7][1], coords[7][2], coords[3][1], coords[3][2], 8192)
	paintutils.drawLine(coords[7][1], coords[7][2], coords[4][1], coords[4][2], 8192)
end

function Rotate (option) 
	for theta = 1, math.random(180) do
		for i = 1, 8 do
			if option == 1 then
				corners[i]["y"] = (corners[i]["y"] * math.cos(0.0174533)) - (corners[i]["z"] * math.sin(0.0174533))
				corners[i]["z"] = (corners[i]["y"] * math.sin(0.0174533)) + (corners[i]["z"] * math.cos(0.0174533))
			end
			if option == 2 then
				corners[i]["x"] = (corners[i]["x"] * math.cos(0.0174533)) + (corners[i]["z"] * math.sin(0.0174533))
				corners[i]["z"] = (-corners[i]["x"] * math.sin(0.0174533)) + (corners[i]["z"] * math.cos(0.0174533))
			end
			if option == 3 then
				corners[i]["x"] = (corners[i]["x"] * math.cos(0.0174533)) - (corners[i]["y"] * math.sin(0.0174533))
				corners[i]["y"] = (corners[i]["x"] * math.sin(0.0174533)) + (corners[i]["y"] * math.cos(0.0174533))
			end
		end
		Draw()
		os.sleep(0.05)
	end
end

while true do
	local option = math.random(3)
	Rotate(option)
end