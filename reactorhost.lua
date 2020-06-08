rednet.open("right")
local maxEnergy = 10000000
local reactor = peripheral.wrap("bottom")
while true do
	local message = {}
	if reactor.getFuelTemperature() > 900 or reactor.getEnergyStored() > (maxEnergy*0.99) then 
		reactor.setActive(false)
		message[1] = "off"
	else
		reactor.setActive(true)
		message[1] = "on"
	end
	message[2] = math.ceil((reactor.getEnergyStored()/maxEnergy)*100)
	message[3] = reactor.getFuelTemperature()
	rednet.broadcast(message)
	os.sleep(1)
end