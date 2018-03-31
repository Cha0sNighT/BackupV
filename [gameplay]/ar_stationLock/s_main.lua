ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('stationLock:LockDoor')
AddEventHandler('stationLock:LockDoor', function(door, bool)
	doorList[door]["locked"] = bool
	TriggerClientEvent('stationLock:LockDoor', -1, door, bool)
end)



ESX.RegisterServerCallback('stationLock:checkDoor', function(source, cb)

	cb(doorList)

end)

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
