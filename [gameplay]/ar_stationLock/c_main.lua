doorList = {
    -- Mission Row Cell 1
    [1] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2
    [2] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3
    [3] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Armory door
    [4] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 453.0793, ["y"]= -983.1894,["z"]= 30.83926,["locked"]= true,["txtX"]=452.5793,["txtY"]=-982.8894,["txtZ"]=30.98926},
}

local PlayerData              = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

ESX = nil
Citizen.CreateThread( function()
	while ESX == nil do
		Citizen.Wait(0)
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
end)

function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


Citizen.CreateThread(function()


    while true do
		Citizen.Wait(0)
			for i = 1, #doorList do
				local playerCoords = GetEntityCoords( GetPlayerPed(-1) )
				local closeDoor = GetClosestObjectOfType(doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], 1.0, GetHashKey(doorList[i]["objName"]), false, false, false)

				local objectCoordsDraw = GetEntityCoords( closeDoor )
				local playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doorList[i]["x"], doorList[i]["y"], doorList[i]["z"], true)

				if(playerDistance < 1.2) and PlayerData.job.name == 'police' then

					if doorList[i]["locked"] == true then
						DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "[E] to unlock door")
					else
						DrawText3d(doorList[i]["txtX"], doorList[i]["txtY"], doorList[i]["txtZ"], "[E] to lock door")
					end

					if IsControlJustPressed(1,51) then
						if doorList[i]["locked"] == true then
							FreezeEntityPosition(closeDoor, false)
							if(i==10 or i==11) then
								TriggerServerEvent('stationLock:LockDoor', 10, false)
								TriggerServerEvent('stationLock:LockDoor', 11, false)
							elseif(i==12 or i==13) then
								TriggerServerEvent('stationLock:LockDoor', 12, false)
								TriggerServerEvent('stationLock:LockDoor', 13, false)
							else
								TriggerServerEvent('stationLock:LockDoor', i, false)
							end
						else
							FreezeEntityPosition(closeDoor, true)
							if(i==10 or i==11) then
								TriggerServerEvent('stationLock:LockDoor', 10, true)
								TriggerServerEvent('stationLock:LockDoor', 11, true)
							elseif(i==12 or i==13) then
								TriggerServerEvent('stationLock:LockDoor', 12, true)
								TriggerServerEvent('stationLock:LockDoor', 13, true)
							else
								TriggerServerEvent('stationLock:LockDoor', i, true)
							end
						end
					end
				else
					FreezeEntityPosition(closeDoor, doorList[i]["locked"])
				end
			end
    end
end)

RegisterNetEvent('stationLock:LockDoor')
AddEventHandler('stationLock:LockDoor', function(door, bool)
	doorList[door]["locked"] = bool
end)

AddEventHandler("playerSpawned", function()
	ESX.TriggerServerCallback('stationLock:checkDoor', function(doors)
		doorList = doors
	end)
end)
