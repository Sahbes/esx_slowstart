function ShowText(text, justification, color, posx, posy, size)
    SetTextFont(4)
    SetTextScale(1.0, size)
    SetTextJustification(justification)
    SetTextColour(table.unpack(color))
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text) 
    EndTextCommandDisplayText(posx, posy)
end

local color = {255,255,255,255}

Citizen.CreateThread(function()
    local speed = 0.05
    while true do
        Citizen.Wait(0)
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
		local model = GetEntityModel(veh)
		if not (model == GetHashKey('dodo')) then
		if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
        SetHeliBladesSpeed(GetVehiclePedIsIn(PlayerPedId(), false), speed)
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		if tonumber(GetVehicleClass(vehicle)) == 15 then
        if IsControlPressed(0, 32) then
			if speed < 0.5 then
                speed = speed + 0.0003
			elseif speed > 0.5 and speed < 0.7 then
				speed = speed + 0.0005
			elseif speed > 0.7 then
				speed = speed + 0.0008
		    end
        elseif IsControlPressed(0, 173) then
            speed = speed - 0.005
		else
			if speed > 0.05 then
			    speed = speed - 0.0005
			end
        end
        if speed > 1.05 then speed = 1.05 end
        if speed < 0.0 then speed = 0.0 end
		local textspeed = math.floor((speed - 0.05) * 100) .. '%'
		if speed < 0.35  then
			color = {255,0,0,255}
		elseif speed > 0.35 and speed < 0.75 then
			color = {255,131,0,255}
		else
			color = {0,255,0,255}
		end
		if speed > 0.05 then
            ShowText(tostring(textspeed), 1, color, 0.5, 0.8, 0.5)
		end
	    else
			speed = 0.05
		end
	    end
	    end
    end
end)