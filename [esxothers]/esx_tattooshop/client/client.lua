local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,["-"] = 84,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 					= nil
local currentTattoos 	= {}
local cam 				= -1
local inMenu			= false

Citizen.CreateThread(function()
	addBlips()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while true do
		Citizen.Wait(10)
		drawMarkers()
		if(isNearTattoosShop()) then
			showNotification(_U('tattoo_shop_nearby'))
			if(IsControlJustPressed(1, Keys['E'])) then
				inMenu = not inMenu
				ESX.UI.Menu.CloseAll()
				if(inMenu) then
					FreezeEntityPosition(GetPlayerPed(-1), true)
					openMenu()
				else
					FreezeEntityPosition(GetPlayerPed(-1), false)
					setPedSkin()
				end
			end
		end
		
		if inMenu then
			if(IsControlJustPressed(1, Keys['BACKSPACE'])) and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'Tattoos_menu') then
				ESX.UI.Menu.CloseAll()
				FreezeEntityPosition(GetPlayerPed(-1), false)
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
				inMenu = false
			end
		elseif(DoesCamExist(cam)) then
			RenderScriptCams(false, false, 0, 1, 0)
			DestroyCam(cam, false)
		end
	end

end)

function openMenu()
	local elements = {}

	for _,k in pairs(tattoosCategories) do
		table.insert(elements, {label= k.name, value = k.value})
	end

	if(DoesCamExist(cam)) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'Tattoos_menu',
		{
			title    = _U('tattoos'),
			align    = 'bottom-right',
			elements = elements,
		},
	function(data, menu)
		local currentLabel = data.current.label
		local currentValue = data.current.value
		if(data.current.value ~= nil) then
			elements = {}

			table.insert(elements, {label = _U('go_back_to_menu'), value = nil})
			for i,k in pairs(tattoosList[data.current.value]) do
				table.insert(elements, {label= _U('tattoo') .. " n°"..i.." - " .. _U('money_amount', k.price), value = i, price = k.price})
			end

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'Tattoos_Categories_menu',
				{
					title    = _U('tattoos') .. ' | '..currentLabel,
					align    = 'bottom-right',
					elements = elements,
				},
			function(data2, menu2)
				local price = data2.current.price
				if(data2.current.value ~= nil) then
					TriggerServerEvent("esx_tattooshop:save", currentTattoos, price, {collection = currentValue, texture = data2.current.value})
				else
					openMenu()
					RenderScriptCams(false, false, 0, 1, 0)
					DestroyCam(cam, false)
					cleanPlayer()
				end

			end,
			function(data2, menu2)
				menu2.close()
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
			end,
			
			-- when highlighted
			function(data2, menu2)
				if(data2.current.value ~= nil) then
					drawTattoo(data2.current.value, currentValue)
				end
			end)

		end

	end, function(data, menu)
		menu.close()
		setPedSkin()
	end)
end

function addBlips()
	for _,k in pairs(tattoosShops) do
		local blip = AddBlipForCoord(k.x, k.y, k.z)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('tattoo_shop'))
		EndTextCommandSetBlipName(blip)
	end
end

function drawMarkers()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	
	for _,shop in pairs(tattoosShops) do
		if GetDistanceBetweenCoords(coords, shop.x, shop.y, shop.z, true) < Config.DrawDistance then
			DrawMarker(27, shop.x, shop.y, shop.z-0.9,0,0,0,0,0,0,3.001,3.0001,0.5001,0,155,255,200,0,0,0,0)
		end
	end
end

function isNearTattoosShop()
	for _,shop in pairs(tattoosShops) do
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), shop.x, shop.y, shop.z, true)
		if(distance < 3) then
			return true
		end
	end
	
	return false
end

function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
	
	Citizen.Wait(1000)

	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end
end

function drawTattoo(current, collection)
	SetEntityHeading(GetPlayerPed(-1), 297.7296)

	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end

	if(GetEntityModel(GetPlayerPed(-1)) == -1667301416) then  -- GIRL SKIN
		SetPedComponentVariation(GetPlayerPed(-1), 8, 34,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 3, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 11, 101,1, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 4, 16,0, 2)
	else 													  -- BOY SKIN
		SetPedComponentVariation(GetPlayerPed(-1), 8, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 3, 15,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 11, 91,0, 2)
		SetPedComponentVariation(GetPlayerPed(-1), 4, 14,0, 2)
	end

	ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(collection), GetHashKey(tattoosList[collection][current].nameHash))

	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		
		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
		SetCamRot(cam, 0.0, 0.0, 0.0)
		SetCamActive(cam,  true)
		RenderScriptCams(true,  false,  0,  true,  true)
		SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
	end

	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))

	SetCamCoord(cam, x+tattoosList[collection][current].addedX, y+tattoosList[collection][current].addedY, z+tattoosList[collection][current].addedZ)
	SetCamRot(cam, 0.0, 0.0, tattoosList[collection][current].rotZ)
end

function cleanPlayer()
	ClearPedDecorations(GetPlayerPed(-1))
	for _,k in pairs(currentTattoos) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end
end

function showNotification(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("esx_tattooshop:getPlayerTattoos")
AddEventHandler("esx_tattooshop:getPlayerTattoos", function(playerTattoosList)
	for _,k in pairs(playerTattoosList) do
		ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
	end
	currentTattoos = playerTattoosList
end)

local firstLoad = false
AddEventHandler("skinchanger:loadSkin", function(skin)
	if(not firstLoad) then
		Citizen.CreateThread(function()

			while not (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01")) do
				Citizen.Wait(10)
			end
			Citizen.Wait(750)
			TriggerServerEvent("esx_tattooshop:GetPlayerTattoos_s")
		end)
		firstLoad = true
	else
		Citizen.Wait(750)
		for _,k in pairs(currentTattoos) do
			ApplyPedOverlay(GetPlayerPed(-1), GetHashKey(k.collection), GetHashKey(tattoosList[k.collection][k.texture].nameHash))
		end
	end
end)

RegisterNetEvent("esx_tattooshop:buySuccess")
AddEventHandler("esx_tattooshop:buySuccess", function(value)
	table.insert(currentTattoos, value)
end)