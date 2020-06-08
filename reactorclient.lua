rednet.open("bottom")
while true do
	term.clear()
	term.setCursorPos(1, 1)
	local _, message, __ = rednet.receive()
	if message[1] == "on" then
		term.setTextColor(32)
	else
		term.setTextColor(16384)
	end
	term.write(message[1])
	term.setTextColor(1)
	term.setCursorPos(1, 2)
	term.write("Power Stored: " .. tostring(message[2]) .. "%")
	term.setCursorPos(1, 3)
	term.write(tostring(message[3]) .. "°")
	os.sleep(1)
end