local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local IsHandcuffed              = false
local IsDragged                 = false
local CopPed                    = 0
local companyName = "les services de la ville"
local deleteLastTruck = true
local spawnDistance = 130
local drivingStyle = 262912


ESX                             = nil
GUI.Time                        = 0

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

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('wk:spawnTow')
RegisterNetEvent('wk:cancelTow')

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

local distanceToCheck = 5.0

enroute = false
onscene = false
cleartask = false
AddEventHandler( 'wk:spawnTow', function()
	local spawnDistance = math.random(spawnDistance * -1, spawnDistance)
	local player = GetPlayerPed(-1)
	local playerPos = GetEntityCoords(player)
	local pmodels = {"mp_m_waremech_01"}
	local vehicles = {"flatbed"}
	local driver = GetHashKey(pmodels[math.random(#pmodels)])
	local vehiclehash = GetHashKey(vehicles[math.random(#vehicles)])
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, distanceToCheck, 0.0)
	RequestModel(vehiclehash)
	RequestModel(driver)

	while not HasModelLoaded(vehiclehash) and RequestModel(driver) do
		RequestModel(vehiclehash)
		RequestModel(driver)
		Citizen.Wait(0)
	end

	if IsPedSittingInAnyVehicle(player) then
        targetVeh = GetVehiclePedIsIn(player, false)
	else
		targetVeh = GetVehicleInDirection(playerPos, inFrontOfPlayer)
	end

	if DoesEntityExist(vehicle) and deleteLastTruck == true then
		SetEntityAsMissionEntity(vehicle)
		SetEntityAsMissionEntity(driver)
		SetEntityAsMissionEntity(towedVeh)

		DeleteEntity(vehicle)
		DeleteEntity(driver)
		DeleteEntity(towedVeh)
	end

	if DoesEntityExist(targetVeh) then
	TriggerEvent('radio')
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
		vehicle = CreateVehicle(vehiclehash, playerPos.x + spawnDistance, playerPos.y + spawnDistance, playerPos.z - 190, 180.0, true, true)
		local vehiclehash = GetHashKey(vehicle)

			Wait(5000)

		driver = CreatePed(26, driver , GetEntityCoords(vehicle) + 2, 0.0, true, true)
		local vehpos = GetEntityCoords(targetVeh)
		SetPedIntoVehicle(driver, vehicle, -1)
		TaskVehicleDriveToCoord(driver, vehicle, vehpos.x, vehpos.y, vehpos.z, 17.0, 0, vehiclehash, drivingStyle, 1.0, true)
		SetVehicleFixed(vehicle)
		SetVehicleOnGroundProperly(vehicle)
		if DoesEntityExist(driver) and DoesEntityExist(vehicle) then
		SetEntityAsMissionEntity(driver, true, true)
		towblip = AddBlipForEntity(vehicle)
		SetBlipColour(towblip, 29)
		SetBlipFlashes(towblip, true)

		local distanceToTow = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetVeh))

		if distanceToTow < 100 then
			eta = '~g~1 Mikes'
		elseif distanceToTow < 300 then
			eta = '~g~2 Mikes'
		elseif distanceToTow < 500 then
			eta = '~o~3 Mikes'
		elseif distanceToTow > 500 then
			eta = '~r~5 Mikes'
		end

		ShowNotification("Un camion plateau va arriver. Merci d'utiliser ~y~" .. companyName .. "~w~\nDistance : " .. eta)
		enroute = true
		while (enroute) do
			Citizen.Wait(300)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(targetVeh), 1)
			SetEntityInvincible(vehicle, true)
			SetEntityInvincible(driver, true)
				if distanceToVeh <= 15 then
					SetVehicleIndicatorLights(vehicle, 1, true)
					SetVehicleIndicatorLights(vehicle, 2, true)
					TaskVehicleTempAction(driver, vehicle, 27, 5000)
					Wait(5000)
					AttachEntityToEntity(targetVeh, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					targetVeh = towedVeh
					SetDriveTaskDrivingStyle(vehicle, 786603)
					TaskVehicleDriveWander(driver, vehicle, 17.0, drivingStyle)
					SetVehicleSiren(vehicle, true)
					SetEntityAsNoLongerNeeded(vehicle)
					enroute = false
					towblip = RemoveBlip(towblip)
					SetVehicleIndicatorLights(vehicle, 1, false)
					SetVehicleIndicatorLights(vehicle, 2, false)
					SetEntityInvincible(vehicle, false)
					SetEntityInvincible(driver, false)
					SetEntityAsNoLongerNeeded(vehicle)
					SetEntityAsNoLongerNeeded(driver)
					SetEntityAsNoLongerNeeded(targetVeh)
				end
			end
		end
	else
	ShowNotification("Aucun véhicule trouvé !")
	end
end)

AddEventHandler( 'wk:cancelTow', function()
	if enroute == true then
		ShowNotification("L'appel a été annulé. Merci d'utiliser ~y~" .. companyName)

		SetEntityAsMissionEntity(vehicle)
		SetEntityAsMissionEntity(driver)

		DeleteEntity(vehicle)
		DeleteEntity(driver)
		enroute = false
	end
end)

RegisterNetEvent('radio')
AddEventHandler('radio', function()
    Citizen.CreateThread(function()
        TaskPlayAnim(player, "random@arrests", "generic_radio_enter", 1.5, 2.0, -1, 50, 2.0, 0, 0, 0 )
		Citizen.Wait(6000)
		ClearPedTasks(player)
    end)
end)

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end

-- Shows a notification on the player's screen
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end


function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 3,
    modBrakes       = 2,
    modTransmission = 2,
    modSuspension   = 3,
    modTurbo        = true,
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

function OpenCloakroomMenu()

  local elements = {
    { label = _U('citizen_wear'), value = 'citizen_wear' }
  }

  if PlayerData.job.grade_name == 'recruit' then
    table.insert(elements, {label = _U('police_wear'), value = 'cadet_wear'})
  end

  if PlayerData.job.grade_name == 'officer' then
    table.insert(elements, {label = _U('police_wear'), value = 'police_wear'})
  end

  if PlayerData.job.grade_name == 'sergeant' then
    table.insert(elements, {label = _U('police_wear'), value = 'sergeant_wear'})
  end

  if PlayerData.job.grade_name == 'sergeantchief' then
    table.insert(elements, {label = _U('police_wear'), value = 'sergeantchief_wear'})
  end

  if PlayerData.job.grade_name == 'lieutenant' then
    table.insert(elements, {label = _U('police_wear'), value = 'lieutenant_wear'})
  end

  if PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('police_wear'), value = 'commandant_wear'})
  end

  if Config.EnableNonFreemodePeds then
    table.insert(elements, {label = _U('sheriff_wear'), value = 'sheriff_wear_freemode'})
    table.insert(elements, {label = _U('lieutenant_wear'), value = 'lieutenant_wear_freemode'})
    table.insert(elements, {label = _U('commandant_wear'), value = 'commandant_wear_freemode'})
  end

  table.insert(elements, {label = _U('bullet_wear'), value = 'bullet_wear'})
  table.insert(elements, {label = _U('gilet_wear'), value = 'gilet_wear'})

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = _U('cloakroom'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)
      menu.close()

      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
        end)
      end

      if data.current.value == 'cadet_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 59, ['tshirt_2'] = 1,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = 46, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 36, ['tshirt_2'] = 1,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = 45, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'police_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 0, ['decals_2'] = 0,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'sergeant_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 8, ['decals_2'] = 1,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 1,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'sergeantchief_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 8, ['decals_2'] = 1,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 1,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'lieutenant_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 8, ['decals_2'] = 2,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 2,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'commandant_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 58, ['tshirt_2'] = 0,
                    ['torso_1'] = 55, ['torso_2'] = 0,
                    ['decals_1'] = 8, ['decals_2'] = 3,
                    ['arms'] = 41,
                    ['pants_1'] = 25, ['pants_2'] = 0,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 35, ['tshirt_2'] = 0,
                    ['torso_1'] = 48, ['torso_2'] = 0,
                    ['decals_1'] = 7, ['decals_2'] = 3,
                    ['arms'] = 44,
                    ['pants_1'] = 34, ['pants_2'] = 0,
                    ['shoes_1'] = 27, ['shoes_2'] = 0,
                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                    ['chain_1'] = 0, ['chain_2'] = 0,
                    ['ears_1'] = 2, ['ears_2'] = 0
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'bullet_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['bproof_1'] = 11, ['bproof_2'] = 1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['bproof_1'] = 13, ['bproof_2'] = 1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 100)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'gilet_wear' then
        TriggerEvent('skinchanger:getSkin', function(skin)

            if skin.sex == 0 then

                local clothesSkin = {
                    ['tshirt_1'] = 59, ['tshirt_2'] = 1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['tshirt_1'] = 36, ['tshirt_2'] = 1
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)

        end)
      end

      if data.current.value == 'sheriff_wear_freemode' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("s_m_y_sheriff_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
      else
          local model = GetHashKey("s_f_y_sheriff_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
          end

        end)
      end

      if data.current.value == 'lieutenant_wear_freemode' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then
          local model = GetHashKey("s_m_y_swat_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
      else
          local model = GetHashKey("s_m_y_swat_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
          end

        end)
      end

      if data.current.value == 'commandant_wear_freemode' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then
          local model = GetHashKey("s_m_y_swat_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
      else
          local model = GetHashKey("s_m_y_swat_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
          end

        end)
      end

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
  )

end

function OpenArmoryMenu(station)

  if Config.EnableArmoryManagement then

    local elements = {
      {label = _U('get_weapon'), value = 'get_weapon'},
      {label = _U('put_weapon'), value = 'put_weapon'},
      {label = 'Prendre Objet',  value = 'get_stock'},
      {label = 'Déposer objet',  value = 'put_stock'}
    }

    if PlayerData.job.grade_name == 'boss' then
      table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'buy_weapons' then
          OpenBuyWeaponsMenu(station)
        end

        if data.current.value == 'put_stock' then
              OpenPutStocksMenu()
            end

            if data.current.value == 'get_stock' then
              OpenGetStocksMenu()
            end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}
      end
    )

  else

    local elements = {}

    for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
      local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory',
      {
        title    = _U('armory'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        local weapon = data.current.value
        TriggerServerEvent('esx_policejob:giveWeapon', weapon,  1000)
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_armory'
        CurrentActionMsg  = _U('open_armory')
        CurrentActionData = {station = station}

      end
    )

  end

end

function OpenVehicleSpawnerMenu(station, partNum)

  local vehicles = Config.PoliceStations[station].Vehicles

  ESX.UI.Menu.CloseAll()

  if Config.EnableSocietyOwnedVehicles then

    local elements = {}

    ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

      for i=1, #garageVehicles, 1 do
        table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})
      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vehicle_spawner',
        {
          title    = _U('vehicle_menu'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

          menu.close()

          local vehicleProps = data.current.value

          ESX.Game.SpawnVehicle(vehicleProps.model, vehicles[partNum].SpawnPoint, 270.0, function(vehicle)
            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
            local playerPed = GetPlayerPed(-1)
            TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
            local plate = math.random(100, 900)
            SetVehicleNumberPlateText(vehicle, "LSPD"..plate.." ")
            SetVehicleEnginePowerMultiplier(vehicle, 15.0)
            SetVehicleEngineTorqueMultiplier(vehicle, 18.0)
          end)

          TriggerServerEvent('esx_society:removeVehicleFromGarage', 'police', vehicleProps)

        end,
        function(data, menu)

          menu.close()

          CurrentAction     = 'menu_vehicle_spawner'
          CurrentActionMsg  = _U('vehicle_spawner')
          CurrentActionData = {station = station, partNum = partNum}

        end
      )

    end, 'police')

  else

    local elements = {}

    table.insert(elements, { label = 'Vélo', value = 'scorcher' })
    table.insert(elements, { label = 'Cadet', value = 'police7' })

    if PlayerData.job.grade_name == 'officer' then
      table.insert(elements, { label = 'Charger', value = 'police2'})
      table.insert(elements, { label = 'SUV', value = 'police3'})
    end

    if PlayerData.job.grade_name == 'sergeant' then
      table.insert(elements, { label = 'Charger', value = 'police2'})
      table.insert(elements, { label = 'SUV', value = 'police3'})
      table.insert(elements, { label = 'Banalisée', value = 'fbi3'})
      table.insert(elements, { label = 'Autoroute', value = '2015polstang'})
      table.insert(elements, { label = 'Moto', value = 'policeb'})
      table.insert(elements, { label = 'Bus de transport', value = 'policet'})
    end

    if PlayerData.job.grade_name == 'sergeantchief' then
      table.insert(elements, { label = 'Charger', value = 'police2'})
      table.insert(elements, { label = 'SUV', value = 'police3'})
      table.insert(elements, { label = 'Banalisée', value = 'fbi3'})
      table.insert(elements, { label = 'Autoroute', value = '2015polstang'})
      table.insert(elements, { label = 'Moto', value = 'policeb'})
      table.insert(elements, { label = 'Bus de transport', value = 'policet'})
      table.insert(elements, { label = 'Antiémeute', value = 'riot'})
    end

    if PlayerData.job.grade_name == 'lieutenant' then
      table.insert(elements, { label = 'Charger', value = 'police2'})
      table.insert(elements, { label = 'SUV', value = 'police3'})
      table.insert(elements, { label = 'Banalisée', value = 'fbi3'})
      table.insert(elements, { label = 'Autoroute', value = '2015polstang'})
      table.insert(elements, { label = 'Banalisée Autoroute', value = '2015capstang'})
      table.insert(elements, { label = 'Moto', value = 'policeb'})
      table.insert(elements, { label = 'Bus de transport', value = 'policet'})
      table.insert(elements, { label = 'Antiémeute', value = 'riot'})
    end

    if PlayerData.job.grade_name == 'boss' then
      table.insert(elements, { label = 'Charger', value = 'police2'})
      table.insert(elements, { label = 'SUV', value = 'police3'})
      table.insert(elements, { label = 'Banalisée', value = 'fbi3'})
      table.insert(elements, { label = 'Autoroute', value = '2015polstang'})
      table.insert(elements, { label = 'Banalisée Autoroute', value = '2015capstang'})
      table.insert(elements, { label = 'Moto', value = 'policeb'})
      table.insert(elements, { label = 'Bus de transport', value = 'policet'})
      table.insert(elements, { label = 'Antiémeute', value = 'riot'})
      table.insert(elements, { label = 'Bus antiémeute', value = 'riot2'})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
        title    = _U('vehicle_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        local model = data.current.value

        local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint.x,  vehicles[partNum].SpawnPoint.y,  vehicles[partNum].SpawnPoint.z,  3.0,  0,  71)

        if not DoesEntityExist(vehicle) then

          local playerPed = GetPlayerPed(-1)

          if Config.MaxInService == -1 then

            ESX.Game.SpawnVehicle(model, {
              x = vehicles[partNum].SpawnPoint.x,
              y = vehicles[partNum].SpawnPoint.y,
              z = vehicles[partNum].SpawnPoint.z
            }, vehicles[partNum].Heading, function(vehicle)
              TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
              SetVehicleMaxMods(vehicle)
              local plate = math.random(100, 900)
              SetVehicleNumberPlateText(vehicle, "LSPD"..plate.." ")
              SetVehicleEnginePowerMultiplier(vehicle, 15.0)
              SetVehicleEngineTorqueMultiplier(vehicle, 18.0)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                ESX.Game.SpawnVehicle(model, {
                  x = vehicles[partNum].SpawnPoint.x,
                  y = vehicles[partNum].SpawnPoint.y,
                  z = vehicles[partNum].SpawnPoint.z
                }, vehicles[partNum].Heading, function(vehicle)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                  SetVehicleMaxMods(vehicle)
                  local plate = math.random(100, 900)
                  SetVehicleNumberPlateText(vehicle, "LSPD"..plate.." ")
                  SetVehicleEnginePowerMultiplier(vehicle, 15.0)
                  SetVehicleEngineTorqueMultiplier(vehicle, 18.0)
                end)

              else
                ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
              end

            end, 'police')

          end

        else
          ESX.ShowNotification(_U('vehicle_out'))
        end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = _U('vehicle_spawner')
        CurrentActionData = {station = station, partNum = partNum}

      end
    )

  end

end

function OpenPoliceActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'police_actions',
    {
      title    = 'Police',
      align    = 'top-left',
      elements = {
        {label = _U('citizen_interaction'), value = 'citizen_interaction'},
        {label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
        {label = _U('object_spawner'),      value = 'object_spawner'},
      },
    },
    function(data, menu)

      if data.current.value == 'citizen_interaction' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('citizen_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('id_card'),       value = 'identity_card'},
              {label = 'Retirer permis Arme',            value = 'license_weapon_remove'},
              {label = 'Retirer permis Moto',            value = 'license_moto_remove'},
              {label = 'Retirer permis Camion',            value = 'license_camion_remove'},
              {label = 'Retirer permis Voiture',            value = 'license_voiture_remove'},
              {label = 'Retirer Code',            value = 'license_code_remove'},
              {label = _U('search'),        value = 'body_search'},
              {label = _U('handcuff'),    value = 'handcuff'},
              {label = _U('drag'),      value = 'drag'},
              {label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
              {label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
              {label = _U('fine'),            value = 'fine'},
              {label = _U('specificfine'),		value = 'specificfine'},
              {label = 'Mise en Fédérale',    value = 'federal'}
            },
          },
          function(data2, menu2)

            local player, distance = ESX.Game.GetClosestPlayer()

            if distance ~= -1 and distance <= 3.0 then

              if data2.current.value == 'identity_card' then
                OpenIdentityCardMenu(player)
              end

              if data2.current.value == 'license_weapon_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'weapon')
              end

              if data2.current.value == 'license_moto_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_bike')
              end

              if data2.current.value == 'license_camion_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive_truck')
              end

              if data2.current.value == 'license_voiture_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'drive')
              end

                if data2.current.value == 'license_code_remove' then
                  TriggerServerEvent('esx_policejob:deletelicense', GetPlayerServerId(player), 'dmv')
              end

              if data2.current.value == 'body_search' then
                OpenBodySearchMenu(player)
              end

              if data2.current.value == 'handcuff' then
                TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
              end

              if data2.current.value == 'drag' then
                TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(player))
              end

              if data2.current.value == 'put_in_vehicle' then
                TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(player))
              end

              if data2.current.value == 'out_the_vehicle' then
                  TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(player))
              end

              if data2.current.value == 'fine' then
                OpenFineMenu(player)
              end

              if data2.current.value == 'specificfine' then
              	OpenSpecificFineMenu()
              end

              if data2.current.value == 'federal' then
                OpenFederalMenu(player)
              end

            else
              ESX.ShowNotification(_U('no_players_nearby'))
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

      if data.current.value == 'vehicle_interaction' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'vehicle_interaction',
          {
            title    = _U('vehicle_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('vehicle_info'), value = 'vehicle_infos'},
              {label = _U('pick_lock'),    value = 'hijack_vehicle'},
              {label = _U('imp_veh'),     value = 'del_vehicle'},
              {label = _U('imp_veh_c'),   value = 'del_vehicle_c'},
            },
          },
          function(data2, menu2)

            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
            local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

            if DoesEntityExist(vehicle) then

              local vehicleData = ESX.Game.GetVehicleProperties(vehicle)

              if data2.current.value == 'del_vehicle' then
                CancelEvent()
                TriggerEvent('wk:spawnTow', s)
      		    end

              if data2.current.value == 'del_vehicle_c' then
                CancelEvent()
                TriggerEvent('wk:cancelTow', s)
              end

              if data2.current.value == 'vehicle_infos' then
                OpenVehicleInfosMenu(vehicleData)
              end

              if data2.current.value == 'hijack_vehicle' then

                local playerPed = GetPlayerPed(-1)
                local coords    = GetEntityCoords(playerPed)

                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then

                  local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

                  if DoesEntityExist(vehicle) then

                    Citizen.CreateThread(function()

                      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)

                      Wait(20000)

                      ClearPedTasksImmediately(playerPed)

                      SetVehicleDoorsLocked(vehicle, 1)
                      SetVehicleDoorsLockedForAllPlayers(vehicle, false)

                      TriggerEvent('esx:showNotification', _U('vehicle_unlocked'))

                    end)

                  end

                end

              end

            else
              ESX.ShowNotification(_U('no_vehicles_nearby'))
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

      if data.current.value == 'object_spawner' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('traffic_interaction'),
            align    = 'top-left',
            elements = {
              {label = _U('cone'),     value = 'prop_roadcone02a'},
              {label = _U('barrier'), value = 'prop_barrier_work06a'},
              {label = _U('spikestrips'),    value = 'p_ld_stinger_s'},
              {label = _U('box'),   value = 'prop_boxpile_07d'},
              {label = _U('cash'),   value = 'hei_prop_cash_crate_half_full'}
            },
          },
          function(data2, menu2)


            local model     = data2.current.value
            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
            local forward   = GetEntityForwardVector(playerPed)
            local x, y, z   = table.unpack(coords + forward * 1.0)

            if model == 'prop_roadcone02a' then
              z = z - 2.0
            end

            ESX.Game.SpawnObject(model, {
              x = x,
              y = y,
              z = z
            }, function(obj)
              SetEntityHeading(obj, GetEntityHeading(playerPed))
              PlaceObjectOnGroundProperly(obj)
            end)

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

    end,
    function(data, menu)

      menu.close()

    end
  )

end

function OpenSpecificFineMenu()
  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'billing',
    {
      title = _U('billing_amount')
    },
    function(data, menu)

      local amount = tonumber(data.value)
      local player, distance = ESX.Game.GetClosestPlayer()

      if player ~= -1 and distance <= 3.0 then

        menu.close()
        if amount == nil then
            ESX.ShowNotification(_U('invalid_amount'))
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('facture'), amount)
        end

      else
        ESX.ShowNotification(_U('no_players_nearby'))
      end

    end,
    function(data, menu)
        menu.close()
    end
  )
end

function OpenIdentityCardMenu(player)

  if Config.EnableESXIdentity then

    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

      local jobLabel    = nil
      local sexLabel    = nil
      local sex         = nil
      local dobLabel    = nil
      local heightLabel = nil
      local idLabel     = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

      if data.sex ~= nil then
        if (data.sex == 'm') or (data.sex == 'M') then
          sex = 'Male'
        else
          sex = 'Female'
        end
        sexLabel = 'Sex : ' .. sex
      else
        sexLabel = 'Sex : Unknown'
      end

      if data.dob ~= nil then
        dobLabel = 'DOB : ' .. data.dob
      else
        dobLabel = 'DOB : Unknown'
      end

      if data.height ~= nil then
        heightLabel = 'Height : ' .. data.height
      else
        heightLabel = 'Height : Unknown'
      end

      if data.name ~= nil then
        idLabel = 'ID : ' .. data.name
      else
        idLabel = 'ID : Unknown'
      end

      local elements = {
        {label = _U('name') .. data.firstname .. " " .. data.lastname, value = nil},
        {label = sexLabel,    value = nil},
        {label = dobLabel,    value = nil},
        {label = heightLabel, value = nil},
        {label = jobLabel,    value = nil},
        {label = idLabel,     value = nil},
      }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  else

    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

      local jobLabel = nil

      if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
        jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
      else
        jobLabel = 'Job : ' .. data.job.label
      end

        local elements = {
          {label = _U('name') .. data.name, value = nil},
          {label = jobLabel,              value = nil},
        }

      if data.drunk ~= nil then
        table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
      end

      if data.licenses ~= nil then

        table.insert(elements, {label = '--- Licenses ---', value = nil})

        for i=1, #data.licenses, 1 do
          table.insert(elements, {label = data.licenses[i].label, value = nil})
        end

      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'citizen_interaction',
        {
          title    = _U('citizen_interaction'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

        end,
        function(data, menu)
          menu.close()
        end
      )

    end, GetPlayerServerId(player))

  end

end

function OpenBodySearchMenu(player)

  ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

    local elements = {}

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    table.insert(elements, {
      label          = _U('confiscate_dirty') .. blackMoney,
      value          = 'black_money',
      itemType       = 'item_account',
      amount         = blackMoney
    })

    table.insert(elements, {label = '--- Armes ---', value = nil})

    for i=1, #data.weapons, 1 do
      table.insert(elements, {
        label          = _U('confiscate') .. ESX.GetWeaponLabel(data.weapons[i].name),
        value          = data.weapons[i].name,
        itemType       = 'item_weapon',
        amount         = data.ammo,
      })
    end

    table.insert(elements, {label = _U('inventory_label'), value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = _U('search'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then

          TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

          OpenBodySearchMenu(player)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))

end

function OpenFineMenu(player)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'fine',
    {
      title    = _U('fine'),
      align    = 'top-left',
      elements = {
        {label = _U('traffic_offense'),   value = 0},
        {label = _U('minor_offense'),     value = 1},
        {label = _U('average_offense'),   value = 2},
        {label = _U('major_offense'),     value = 3},
        {label = _U('drugs'),             value = 4}
      },
    },
    function(data, menu)

      OpenFineCategoryMenu(player, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenFineCategoryMenu(player, category)

  ESX.TriggerServerCallback('esx_policejob:getFineList', function(fines)

    local elements = {}

    for i=1, #fines, 1 do
      table.insert(elements, {
        label     = fines[i].label .. ' $' .. fines[i].amount,
        value     = fines[i].id,
        amount    = fines[i].amount,
        fineLabel = fines[i].label
      })
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fine_category',
      {
        title    = _U('fine'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local label  = data.current.fineLabel
        local amount = data.current.amount

        menu.close()

        if Config.EnablePlayerManagement then
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total') .. label, amount)
        else
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)
        end

        ESX.SetTimeout(300, function()
          OpenFineCategoryMenu(player, category)
        end)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, category)

end

function OpenVehicleInfosMenu(vehicleData)

  ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(infos)

    local elements = {}

    table.insert(elements, {label = _U('plate') .. infos.plate, value = nil})

    if infos.owner == nil then
      table.insert(elements, {label = _U('owner_unknown'), value = nil})
    else
      table.insert(elements, {label = _U('owner') .. infos.owner, value = nil})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_infos',
      {
        title    = _U('vehicle_info'),
        align    = 'top-left',
        elements = elements,
      },
      nil,
      function(data, menu)
        menu.close()
      end
    )

  end, vehicleData.plate)

end

function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenBuyWeaponsMenu(station)

  ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do

      local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
      local count  = 0

      for i=1, #weapons, 1 do
        if weapons[i].name == weapon.name then
          count = weapons[i].count
          break
        end
      end

      table.insert(elements, {label = 'x' .. count .. ' ' .. ESX.GetWeaponLabel(weapon.name) .. ' $' .. weapon.price, value = weapon.name, price = weapon.price})

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'armory_buy_weapons',
      {
        title    = _U('buy_weapon_menu'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        ESX.TriggerServerCallback('esx_policejob:buy', function(hasEnoughMoney)

          if hasEnoughMoney then
            ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
              OpenBuyWeaponsMenu(station)
            end, data.current.value)
          else
            ESX.ShowNotification(_U('not_enough_money'))
          end

        end, data.current.price)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('police_stock'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_policejob:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_policejob:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

  local specialContact = {
    name       = 'Police',
    number     = 'police',
    base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
  }

  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)

  if part == 'Cloakroom' then
    CurrentAction     = 'menu_cloakroom'
    CurrentActionMsg  = _U('open_cloackroom')
    CurrentActionData = {}
  end

  if part == 'Armory' then
    CurrentAction     = 'menu_armory'
    CurrentActionMsg  = _U('open_armory')
    CurrentActionData = {station = station}
  end

  if part == 'VehicleSpawner' then
    CurrentAction     = 'menu_vehicle_spawner'
    CurrentActionMsg  = _U('vehicle_spawner')
    CurrentActionData = {station = station, partNum = partNum}
  end

  if part == 'HelicopterSpawner' then

    local helicopters = Config.PoliceStations[station].Helicopters

    if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint.x, helicopters[partNum].SpawnPoint.y, helicopters[partNum].SpawnPoint.z,  3.0) then

      ESX.Game.SpawnVehicle('polmav', {
        x = helicopters[partNum].SpawnPoint.x,
        y = helicopters[partNum].SpawnPoint.y,
        z = helicopters[partNum].SpawnPoint.z
      }, helicopters[partNum].Heading, function(vehicle)
        SetVehicleModKit(vehicle, 0)
        SetVehicleLivery(vehicle, 0)
      end)

    end

  end

  if part == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if DoesEntityExist(vehicle) then
        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}
      end

    end

  end

  if part == 'BossActions' then
    CurrentAction     = 'menu_boss_actions'
    CurrentActionMsg  = _U('open_bossmenu')
    CurrentActionData = {}
  end

end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if PlayerData.job ~= nil and PlayerData.job.name == 'police' and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('remove_object')
    CurrentActionData = {entity = entity}
  end

  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed)

      for i=0, 7, 1 do
        SetVehicleTyreBurst(vehicle,  i,  true,  1000)
      end

    end

  end

end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()

  IsHandcuffed    = not IsHandcuffed;
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    else

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(cop)
  TriggerServerEvent('esx:clientLog', 'starting dragging')
  IsDragged = not IsDragged
  CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandcuffed then
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        local myped = GetPlayerPed(-1)
        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      else
        DetachEntity(GetPlayerPed(-1), true, false)
      end
    end
  end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(t)
  local ped = GetPlayerPed(t)
  ClearPedTasksImmediately(ped)
  plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
  local xnew = plyPos.x+2
  local ynew = plyPos.y+2

  SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

-- Handcuff
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandcuffed then
      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
      DisableControlAction(0, 30,  true) -- MoveLeftRight
      DisableControlAction(0, 31,  true) -- MoveUpDown
    end
  end
end)

-- Create blips
Citizen.CreateThread(function()

  for k,v in pairs(Config.PoliceStations) do

    local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

    SetBlipSprite (blip, v.Blip.Sprite)
    SetBlipDisplay(blip, v.Blip.Display)
    SetBlipScale  (blip, v.Blip.Scale)
    SetBlipColour (blip, v.Blip.Colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('map_blip'))
    EndTextCommandSetBlipName(blip)

  end

end)

-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

      for k,v in pairs(Config.PoliceStations) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Vehicles, 1 do
          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then
              DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
          end

        end

      end

    end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

      local playerPed      = GetPlayerPed(-1)
      local coords         = GetEntityCoords(playerPed)
      local isInMarker     = false
      local currentStation = nil
      local currentPart    = nil
      local currentPartNum = nil

      for k,v in pairs(Config.PoliceStations) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Cloakroom'
            currentPartNum = i
          end
        end

        for i=1, #v.Armories, 1 do
          if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Armory'
            currentPartNum = i
          end
        end

        for i=1, #v.Vehicles, 1 do

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleSpawner'
            currentPartNum = i
          end

          if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleSpawnPoint'
            currentPartNum = i
          end

        end

        for i=1, #v.Helicopters, 1 do

          if GetDistanceBetweenCoords(coords,  v.Helicopters[i].Spawner.x,  v.Helicopters[i].Spawner.y,  v.Helicopters[i].Spawner.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'HelicopterSpawner'
            currentPartNum = i
          end

          if GetDistanceBetweenCoords(coords,  v.Helicopters[i].SpawnPoint.x,  v.Helicopters[i].SpawnPoint.y,  v.Helicopters[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'HelicopterSpawnPoint'
            currentPartNum = i
          end

        end

        for i=1, #v.VehicleDeleters, 1 do
          if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'VehicleDeleter'
            currentPartNum = i
          end
        end

        if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'boss' then

          for i=1, #v.BossActions, 1 do
            if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then
              isInMarker     = true
              currentStation = k
              currentPart    = 'BossActions'
              currentPartNum = i
            end
          end

        end

      end

      local hasExited = false

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

        if
          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation             = currentStation
        LastPart                = currentPart
        LastPartNum             = currentPartNum

        TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

        HasAlreadyEnteredMarker = false

        TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
      end

    end

  end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()

  local trackedEntities = {
    'prop_roadcone02a',
    'prop_barrier_work06a',
    'p_ld_stinger_s',
    'prop_boxpile_07d',
    'hei_prop_cash_crate_half_full'
  }

  while true do

    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    local closestDistance = -1
    local closestEntity   = nil

    for i=1, #trackedEntities, 1 do

      local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)

      if DoesEntityExist(object) then

        local objCoords = GetEntityCoords(object)
        local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

        if closestDistance == -1 or closestDistance > distance then
          closestDistance = distance
          closestEntity   = object
        end

      end

    end

    if closestDistance ~= -1 and closestDistance <= 3.0 then

      if LastEntity ~= closestEntity then
        TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
        LastEntity = closestEntity
      end

    else

      if LastEntity ~= nil then
        TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
        LastEntity = nil
      end

    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'police' and (GetGameTimer() - GUI.Time) > 150 then

        if CurrentAction == 'menu_cloakroom' then
          OpenCloakroomMenu()
        end

        if CurrentAction == 'menu_armory' then
          OpenArmoryMenu(CurrentActionData.station)
        end

        if CurrentAction == 'menu_vehicle_spawner' then
          OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
        end

        if CurrentAction == 'delete_vehicle' then

          if Config.EnableSocietyOwnedVehicles then

            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'police', vehicleProps)

          else

            if
              GetEntityModel(vehicle) == GetHashKey('2015polstang')  or
              GetEntityModel(vehicle) == GetHashKey('fbi3') or
              GetEntityModel(vehicle) == GetHashKey('police3') or
              GetEntityModel(vehicle) == GetHashKey('police2') or
              GetEntityModel(vehicle) == GetHashKey('policeb') or
              GetEntityModel(vehicle) == GetHashKey('policet')
            then
              TriggerServerEvent('esx_service:disableService', 'police')
            end

          end

          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
        end

        if CurrentAction == 'menu_boss_actions' then

          ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)

            menu.close()

            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end)

        end

        if CurrentAction == 'remove_entity' then
          DeleteEntity(CurrentActionData.entity)
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end

    end

    if IsControlPressed(0,  Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') and (GetGameTimer() - GUI.Time) > 150 then
      OpenPoliceActionsMenu()
      GUI.Time = GetGameTimer()
    end

  end
end)

function clearPed()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
      TriggerEvent('skinchanger:loadSkin', skin)
    end)
    ClearAllPedProps(GetPlayerPed(-1))
end

function OpenFederalMenu(player)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'federal',
    {
      title    = 'Sentence Fédérale',
      align    = 'top-left',
      elements = {
        {label = '1 mois',   value = 1},
        {label = '2 mois',   value = 2},
        {label = '3 mois',   value = 3},
        {label = '4 mois',   value = 4},
        {label = '5 mois',   value = 5},
        {label = '6 mois',   value = 6},
        {label = '7 mois',   value = 7},
        {label = '8 mois',   value = 8},
        {label = '9 mois',   value = 9},
        {label = '10 mois',  value = 10},
        {label = '11 mois',  value = 11},
        {label = '1 an',     value = 12}
      },
    },
    function(data, menu)
      Arrest(GetPlayerServerId(player), tonumber(data.current.value)*60)
      menu.close()
    end,
    function(data, menu)
      menu.close()
    end
  )

end

function Arrest(playerID, amount)
  TriggerServerEvent("jail:teleportToJail", playerID, amount)
end

-- jail addon
RegisterNetEvent('jail:teleportPlayer')
AddEventHandler('jail:teleportPlayer', function(amount)
  if IsHandcuffed then
    TriggerEvent('esx_policejob:handcuff')
    TriggerServerEvent('jail:removeInventaire', amount)
    Wait(500)
    SetEntityCoords(GetPlayerPed(-1), tonumber("1800.6060791016"), tonumber("2483.2067871094"), tonumber("-122.70257568359"))
    RemoveAllPedWeapons(GetPlayerPed(-1))
    TriggerEvent('chatMessage', '^4[JAIL]', {0,0,0}, "Voici ta sentence : ^1".. (tonumber(amount)/60) .." minutes !")
    clearPed()
    Wait(500)
    local hashSkin = GetHashKey("mp_m_freemode_01")
    Citizen.CreateThread(function()
      if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
        SetPedComponentVariation(GetPlayerPed(-1), 4, 7, 15, 0)--Pantalon
        SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 0, 0)--Debardeur
        SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--Tshirt
        SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 0)--Bras
        SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)--Pied
        c_options.undershirt = 0
        c_options.undershirt_txt = 240
        SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
      else
        SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0)--Pantalon
        SetPedComponentVariation(GetPlayerPed(-1), 11, 14, 6, 0)--Debardeur
        SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--Tshirt
        SetPedComponentVariation(GetPlayerPed(-1), 3, 4, 0, 0)--Bras
        SetPedComponentVariation(GetPlayerPed(-1), 6, 5, 0, 0)--Pied
        c_options.undershirt = 0
        c_options.undershirt_txt = 240
        SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
      end
    end)
    Citizen.CreateThread(function()
      while (amount > 0) do
        if amount == 240 then
          TriggerEvent('chatMessage', '^4[PRISON]', {0,0,0}, "Temps restant : ^1".. (tonumber(amount)/60) .." minutes !")
        elseif amount == 180 then
          TriggerEvent('chatMessage', '^4[PRISON]', {0,0,0}, "Temps restant : ^1".. (tonumber(amount)/60) .." minutes !")
        elseif amount == 120 then
          TriggerEvent('chatMessage', '^4[PRISON]', {0,0,0}, "Temps restant : ^1".. (tonumber(amount)/60) .." minutes !")
        elseif amount == 60 then
          TriggerEvent('chatMessage', '^4[PRISON]', {0,0,0}, "Temps restant : ^1".. (tonumber(amount)/60) .." minute !")
        else

        end


        RemoveAllPedWeapons(GetPlayerPed(-1))
                LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        if (GetDistanceBetweenCoords(LastPosX, LastPosY, LastPosZ, 1800.6060791016,2483.2067871094,-122.70257568359, true) > 100.0001) then
            SetEntityCoords(GetPlayerPed(-1), tonumber("1800.6060791016"), tonumber("2483.2067871094"), tonumber("-122.70257568359"))
          	TriggerEvent('chatMessage', '^4[JAIL]', {0,0,0}, "On ne s'échappe pas de la prison comme ça !")
        end
        Citizen.Wait(1000)
        amount = amount - 1

      end

      -- Sortie de prison après fin sentence
      SetEntityCoords(GetPlayerPed(-1), tonumber("1846.1293945313"), tonumber("2585.8908691406"), tonumber("45.672019958496"))
      clearPed()

    end)
  else
    TriggerEvent('chatMessage', source,'^4[JAIL]', {0,0,0}, "LE prisonnier doit être menotté !")
  end
end)
