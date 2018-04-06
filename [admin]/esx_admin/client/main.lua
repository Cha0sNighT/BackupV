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

ESX                           = nil
local PlayerData              = {}
local GUI                     = {}
GUI.Time                      = 0
local hasAlreadyEnteredMarker = false
local lastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local BrinksSpawn			  = false
local secondsRemaining 		  = 0

-- SetMaxWantedLevel(5)
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.TriggerServerCallback("esx_admin:getSteamId", function(steamId)
        SteamID = steamId
    end)
end)

function isSteamIdInList(psteamId)

    local steamIdIsFound = false
    for i=1, #Config.SteamID, 1 do
		if Config.SteamID[i] == psteamId then
			return true
		end
	end
	
    return false
end


function OpenAccountantActionsMenu()

	local elements = {
	{label = _U('Player'), 			value = 'customers'},
	{label = _U('Society'),			value = 'customers_entreprise'},
	{label = _U('BoxAdmin'), 		value = 'coffre'},
	{label = _U('AutoGive'), 		value = 'autogive'},
	{label = _U('CreateAlert'),   	value = 'Alert'},
	{label = _U('Brinks'),			value = 'brinks'},
	{label = _U('PickUp'),			value = 'pickup'},
--	{label = 'Spawn PNJ gang',		value = 'npc_gang'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'accountant_actions',
		{
			title    = _U('Menu'),
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'customers' then
				OpenCustomersMenu()
			end

			if data.current.value == 'customers_entreprise' then
				OpenCustomersEntreprise()
			end

			if data.current.value == 'Alert' then
				local elements = {
					{label = _U('AlertP'), 	value = 'police'},
					{label = _U('AlertG'), 	value = 'gang'},
					{label = _U('AlertPG'), value ='police_gang'}
					}
				
					ESX.UI.Menu.CloseAll()
				
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'accountant_actions',
						{
							title    = _U('CreateAlert'),
							elements = elements
						},
						function(data, menu)
							if data.current.value == 'police' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = 'Alert Police'
									},
									function(data2, menu)
				
										local text = tostring(data2.value)								
										menu.close()	
				
										TriggerServerEvent('esx_admin:policealert', text)
										ESX.ShowNotification(_U('SendPolice') ..text.. _U('Send'))
									end,
									function(data2, menu)
										menu.close()
									end
								)			
							end 

							if data.current.value == 'gang' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = _U('AlertG')
									},
									function(data2, menu)

										local text = tostring(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:gangalert', text)
										ESX.ShowNotification(_U('SendPolice') ..text.. _U('Send'))

									end,
									function(data2, menu)
										menu.close()
									end
								)						
							end 

							if data.current.value == 'police_gang' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = _U('AlertPG')
									},
									function(data2, menu)

										local text = tostring(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:gangalert', text)
										TriggerServerEvent('esx_admin:policealert', text)
										ESX.ShowNotification(_U('SendPoliceGang') ..text.. _U('Send'))

									end,
									function(data2, menu)
										menu.close()
									end
								)						
							end 
						end,
						function(data, menu)
							menu.close()
						end
					)

			end


			if data.current.value == 'pickup' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
					{
						title = _U('PickUp')
					},
					function(data2, menu)

						local item = tostring(data2.value)								
						menu.close()	

						TriggerServerEvent('esx_admin:pickup', item)
						ESX.ShowNotification('~b~Item : ~w~' .. item .. " posé au sol" )

					end,
					function(data2, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'brinks' then
				local elements = {
					{label = _U('brinks')		, value = 'no'},
					{label = _U('brinkspnj')	, value = 'NPCBrinks'}
					}
				
					ESX.UI.Menu.CloseAll()
				
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'accountant_actions',
						{
							title    = _U('Menu'),
							elements = elements
						},
						function(data, menu)

							if data.current.value == 'no' then
								local carid = GetHashKey('Stockade')
								local coords = GetEntityCoords(GetPlayerPed(-1))
								local playerPed = GetPlayerPed(-1)

								RequestModel(carid)
								while not HasModelLoaded(carid) do
									Citizen.Wait(0)
								end

								veh = CreateVehicle(carid,coords.x +16, coords.y+16, coords.z -1, 210, true, true)
								OpenDoors()
								SetVehicleNumberPlateText(veh, "STOCKADE")
								TriggerServerEvent('esx_admin:addInventoryItem', GetVehicleClass(veh), GetDisplayNameFromVehicleModel(GetEntityModel(veh)), GetVehicleNumberPlateText(veh), "pack_drugs", "1", "Mallette traçable")
								SpawnVehiclePolice()
								menu.close()
								Citizen.Wait(5000)
								SetVehicleExplodesOnHighExplosionDamage(veh, true)
								ExplodeVehicleInCutscene(veh, true)
								Citizen.Wait(5000)
								TriggerServerEvent('esx_admin:brinks_police')
								SetVehicleGravity(veh, true)							
							end 

							if data.current.value == 'NPCBrinks' then
								local elements = {
									{label = _U('Start') , value = 'start'},
									{label = _U('Stop'), value = 'stop'}
									}
								
									ESX.UI.Menu.CloseAll()
								
									ESX.UI.Menu.Open(
										'default', GetCurrentResourceName(), 'accountant_actions',
										{
											title    = 'Brinks',
											elements = elements
										},
										function(data, menu)

											if data.current.value == 'start' then
												TriggerEvent('esx_admin:going')
												TriggerServerEvent('esx_admin:callbrinks1')
												ESX.ShowNotification('Spawn Brinks en cour')

											end

											if data.current.value == 'stop' then
												RemoveBlip(vehBlip)	
												ESX.ShowNotification('Mission Fini')
												TriggerServerEvent('esx_admin:addInventoryItem', GetVehicleClass(plyCar), GetDisplayNameFromVehicleModel(GetEntityModel(plyCar)), GetVehicleNumberPlateText(plyCar), "pack_drugs", "-1", "Mallette traçable")						
												TaskGoToCoordAnyMeans(startped, 999,999,999, 5.0, 0, 0, 786603, 0xbf800000)           
											end			
				
										end,
										function(data, menu)
											menu.close()
										end
									)
								
							end


						end,
						function(data, menu)
							menu.close()
						end
					)

			end

			if data.current.value == 'coffre' then
				local elements = {
					{label = 'Poser dans le coffre', value = 'put_stock'},
					{label = 'Prendre dans le coffre', value = 'stocks'},
					{label = 'Poser arme dans le coffre', value = 'put_weapon'},
					{label = 'Prendre arme dans le coffre', value = 'get_weapon'},
					}
				
					ESX.UI.Menu.CloseAll()
				
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'accountant_actions',
						{
							title    = 'Coffre',
							elements = elements
						},
						function(data, menu)
							if data.current.value == 'put_stock' then
								OpenPutStocksMenu()		
							end 

							if data.current.value == 'stocks' then
								OpenStocksMenu()		
							end 

							if data.current.value == 'get_weapon' then
								OpenGetWeaponMenu()
							end
				
							if data.current.value == 'put_weapon' then
								OpenPutWeaponMenu()
							end

						end,
						function(data, menu)
							menu.close()
						end
					)

			end

			if data.current.value == 'autogive' then

				local elements = {
					{label = 'Avoir une arme', 		value = 'giveweapon'},
					{label = 'Avoir argent sale', 	value = 'giveblackmoney'},
					{label = 'Avoir argent propre', value = 'givemoney'},
					{label = 'Avoir item', 			value = 'giveitem'},
					}
				
					ESX.UI.Menu.CloseAll()
				
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'accountant_actions',
						{
							title    = 'Auto Give',
							elements = elements
						},
						function(data, menu)
							if data.current.value == 'giveweapon' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = 'Arme'
									},
									function(data2, menu)

										local text = tostring(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:giveweapon', text)

									end,
									function(data2, menu)
										menu.close()
									end
								)
							end 

							if data.current.value == 'giveblackmoney' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = 'Argent Sale'
									},
									function(data2, menu)

										local amount = tonumber(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:customerdirtDeposit', amount)

									end,
									function(data2, menu)
										menu.close()
									end
								)
							end 

							if data.current.value == 'givemoney' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = 'Argent propre'
									},
									function(data2, menu)

										local amount = tonumber(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:customerDeposit', amount)

									end,
									function(data2, menu)
										menu.close()
									end
								)
							end
				
							if data.current.value == 'giveitem' then
								ESX.UI.Menu.Open(
									'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
									{
										title = 'Item'
									},
									function(data2, menu)

										local item = tostring(data2.value)								
										menu.close()	

										TriggerServerEvent('esx_admin:additem', item)

									end,
									function(data2, menu)
										menu.close()
									end
								)
							end

						end,
						function(data, menu)
							menu.close()
						end
					)

			end

			if data.current.value == 'npc_gang' then

				local coords = GetEntityCoords(GetPlayerPed(-1))
				local model = "A_C_MtLion"
				local mathcord = math.random(1, 50)
				local mathcord2 = math.random(1, 50)

				RequestModel(model)

				while not HasModelLoaded(model)  do
				Citizen.Wait(0)
				end

				dmvmainped =  CreatePed(4, model, coords.x+ 10, coords.y+10, coords.z, 120,  false, true)
				SetPedFleeAttributes(dmvmainped, 0, 0)
				SetPedDropsWeaponsWhenDead(dmvmainped, false)
				SetPedDiesWhenInjured(dmvmainped, false)
				SetPedCombatAbility(dmvmainped, 100)
				SetPedArmour(playerPed, math.random(50, 100))
				SetPedCombatRange(dmvmainped, 0)
			end

		end,
		function(data, menu)
			menu.close()
		end
	)

end


function OpenStocksMenu()

	ESX.TriggerServerCallback('esx_admin:getStockItems', function(items)

		print(json.encode(items))

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
		end

	  ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'stocks_menu',
	    {
	      title    = 'Coffre Admin',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
					{
						title = 'Quantité'
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification('Quantité invalide')
						else
							menu2.close()
							menu.close()
				    		OpenStocksMenu()

							TriggerServerEvent('esx_admin:getStockItem', itemName, count)
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

	ESX.TriggerServerCallback('esx_admin:getPlayerInventory', function(inventory)

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
	      title    = 'Coffre Admin',
	      elements = elements
	    },
	    function(data, menu)

	    	local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
					{
						title = 'Quantité'
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification('Quantité invalide')
						else
							menu2.close()
							menu.close()
				    		OpenPutStocksMenu()

							TriggerServerEvent('esx_admin:putStockItems', itemName, count)
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

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_admin:getArmoryWeapons', function(weapons)

		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'armory_get_weapon',
			{
				title    = "Déposer une arme",
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				ESX.TriggerServerCallback('esx_admin:removeArmoryWeapon', function()
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
			title    = "Prend une arme",
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)
			
			menu.close()

			ESX.TriggerServerCallback('esx_admin:addArmoryWeapon', function()
				OpenPutWeaponMenu()
			end, data.current.value)

		end,
		function(data, menu)
			menu.close()
		end
	)

end


function SpawnVehiclePolice()

	local police = GetHashKey('police')
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local playerPed = GetPlayerPed(-1)
	
	RequestModel(police)
	while not HasModelLoaded(police) do
		Citizen.Wait(0)
	end

	vehpolice = CreateVehicle(police,coords.x +18, coords.y+18, coords.z -1, 210, true, true)
	vehpolice = CreateVehicle(police,coords.x +14, coords.y+14, coords.z -1, 210, true, true)

end 


function OpenDoors ()

	-- Ouvre toute les portes
	SetVehicleDoorOpen(veh, 0, false, false)
	SetVehicleDoorOpen(veh, 1, false, false)
	SetVehicleDoorOpen(veh, 2, false, false)
	SetVehicleDoorOpen(veh, 3, false, false)
	SetVehicleDoorOpen(veh, 4, false, false)
	SetVehicleDoorOpen(veh, 5, false, false)
	SetVehicleDoorOpen(veh, 6, false, false)
	SetVehicleDoorOpen(veh, 7, false, false)
	-- Deverouille le vehicule
	SetVehicleDoorsLocked(veh, 1)
	SetVehicleDoorsLockedForAllPlayers(veh, false)
	-- Demarre le moteur 
	SetVehicleEngineOn(veh,  true,  true)
	-- Acive Alarme vehicule
	SetVehicleAlarm(veh, true)
	StartVehicleAlarm(veh)

end

function StartFire()
	local Coords = GetEntityCoords(GetPlayerPed(-1))
	StartScriptFire(Coords.x+15, Coords.y+15, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+16, Coords.y+16, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+17, Coords.y+17, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+18, Coords.y+18, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+19, Coords.y+19, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+10, Coords.y+20, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+21, Coords.y+21, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x+22, Coords.y+21, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x-23, Coords.y+23, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x-24, Coords.y+24, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x-25, Coords.y+25, Coords.z-1, 25, 0)
	StartScriptFire(Coords.x-26, Coords.y+26, Coords.z-1, 25, 0)
end

function SpawnPedBrinks ()

	local model 	= "S_M_Y_BLACKOPS_01"
	model           = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

		RequestModel(model)

		while not HasModelLoaded(model)  do
		Citizen.Wait(0)
		end

	ped =	CreatePed(5,  model,  coords.x +11, coords.y+11,  coords.z ,  0.0,  false,  false)
	ped =	CreatePed(5,  model,  coords.x +12, coords.y+12,  coords.z ,  0.0,  false,  false)
	ped = 	CreatePed(5,  model,  coords.x +10, coords.y+5,  coords.z ,  0.0,  false,  false)

	StartScriptFire(coords.x +11, coords.y+11, coords.z-1, 25, 0)
	StartScriptFire(coords.x +12, coords.y+12, coords.z-1, 25, 0)
	StartScriptFire(coords.x +10, coords.y+5, coords.z-1, 25, 0)

end

function OpenCustomersEntreprise()

	ESX.TriggerServerCallback('esx_accountantjob:getCustomers', function(customers, account)

		local elements = {
			head = { 'Entreprise', _U('balance'), _U('actions')},
			rows = {}
		}

		for i=1, #customers, 1 do
			table.insert(elements.rows, {
				data = customers[i],
				cols = {
					customers[i].society.label,	
					customers[i].account,
					'{{' .. _U('deposit') .. '|deposit}} {{' .. _U('withdraw') .. '|withdraw}}'
				}
			})
		end

		ESX.UI.Menu.Open(
			'list', GetCurrentResourceName(), 'customers',
			elements,
			function(data, menu)

				local customer = data.data

				if data.value == 'deposit' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_deposit_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_accountantjob:customerDeposit', customer.society.account, amount)

							end

						end,
						function(data2, menu)
							menu.close()
						end
					)

				end

				if data.value == 'withdraw' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_accountantjob:customerWithdraw', customer.society.account, amount)
							end

						end,
						function(data2, menu)
							menu.close()
						end
					)

				end

			end,
			function(data, menu)
				menu.close()
			end
		)

	end)

end

function OpenCustomersMenu()

	ESX.TriggerServerCallback('esx_admin:getCustomers', function(customers, account)

		local elements = {
			head = {'SteamID','Joueurs','Grade','Job', 'Job_grade', 'Telephone','Liquide', 'Banque', 'Argent_Sale', 'Inventaire',"Item", "Status"},
			rows = {}
		}

		for i=1, #customers, 1 do
			table.insert(elements.rows, {
				data = customers[i],
				cols = {
					customers[i].identifier,
					customers[i].name,
					customers[i].group,
					customers[i].job,
					customers[i].grade,
					customers[i].phone,
					'{{' .. customers[i].money .. '|deposit}}',
					'{{' .. customers[i].accounts .. '|depositaccount}}',
					'{{' .. customers[i].dirtmoney .. '|depositdirt}}',
					'{{ check inventaire |CheckInventaire}}',
					'{{ Item |additem}}',
					'{{ Status |addstatus}}',
	

				}
			})
		end

		ESX.UI.Menu.Open(
			'list', GetCurrentResourceName(), 'customers',
			elements,
			function(data, menu)

				local customer = data.data

				if data.value == 'deposit' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_deposit_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_admin:customerDeposit', customer.name, amount)

								OpenCustomersMenu()

							end

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

				if data.value == 'depositaccount' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_admin:customeraccount', customer.name, amount)

								OpenCustomersMenu()

							end

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

				if data.value == 'depositdirt' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_deposit_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_admin:customerdirtDeposit', customer.name, amount)

								OpenCustomersMenu()

							end

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

				if data.value == 'dirtwithdraw' then

					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
						{
							title = _U('amount')
						},
						function(data2, menu)

							local amount = tonumber(data2.value)

							if amount == nil then
								ESX.ShowNotification(_U('invalid_amount'))
							else
								
								menu.close()	

								TriggerServerEvent('esx_admin:customerdirtWithdraw', customer.name, amount)

								OpenCustomersMenu()

							end

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

				if data.value == 'CheckInventaire' then
					menu.close()
					OpenCustomersInventaire()
				end

				if data.value == 'additem' then
					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
						{
							title = _U('GiveOneItem')
												},
						function(data2, menu)

							local item = tostring(data2.value)								
							menu.close()	

							TriggerServerEvent('esx_admin:additem', customer.name, item)

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

				if data.value == 'addstatus' then
					menu.close()

					ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'customer_withdraw_amount',
						{
							title = 'status'
						},
						function(data2, menu)

							local amount = tostring(data2.value)								
							menu.close()	

							TriggerServerEvent('esx_admin:addstatus', customer.name, amount)

						end,
						function(data2, menu)
							menu.close()
							OpenCustomersMenu()
						end
					)

				end

			end,
			function(data, menu)
				menu.close()
			end
		)

	end)

end


function OpenCustomersInventaire()

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

		local elements = {}

		table.insert(elements, {label = _U('Weapon'), value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label          = _U('confisq') .. ESX.GetWeaponLabel(data.weapons[i].name),
				value          = data.weapons[i].name,
				itemType       = 'item_weapon',
				amount         = data.ammo,
			})
		end

		table.insert(elements, {label =_U'inventory', value = nil})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label          = _U('confisq') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
					value          = data.inventory[i].name,
					itemType       = 'item_standard',
					amount         = data.inventory[i].count,
				})
			end
		end
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'body_search',
			{
				title    = _U('invetor'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				local itemType = data.current.itemType
				local itemName = data.current.value
				local amount   = data.current.amount

				if data.current.value ~= nil then

					TriggerServerEvent('esx_admin:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

					OpenBodySearchMenu(player)

				end

			end,
			function(data, menu)
				menu.close()
			end
		)

	end, GetPlayerServerId(player))


end

------------------------------------------------------------------
------------------------------------------------------------------

RegisterNetEvent('esx_admin:going')
AddEventHandler('esx_admin:going', function(pos)
    local counter = 1
 
   
    AddRelationshipGroup('StartGroup1')
 
   
    while counter > 0 do
        if counter == 3 then
             model          = "Granger"
             nombre = 8
		elseif counter == 2 then
            model           = "Stockade"
            nombre = 4
        elseif counter == 1 then
             model          = "Stockade"
             nombre = 8
        end
        counter = counter - 1
		Wait(20000)
        CreateEscorte()
 
    end
end)
 
function CreateEscorte()
	local essence       = math.random(80, 100)
    RandomPed  			= Config.Peds[GetRandomIntInRange(1,  #Config.Peds)]
    Weapon      		= -270015777
    seat       			=  -1
 
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end

	RequestModel(RandomPed)
	while not HasModelLoaded(RandomPed) do
		Citizen.Wait(1)
	end

	plyCar      =   CreateVehicle(model,-89.747467041016,  -672.94866943359, 35.340305328369,175, true, false)
	startped    =   CreatePedInsideVehicle(plyCar, 4, RandomPed, -1, true, false)
	SetPedRelationshipGroupHash(startped, 'StartGroup1')

			nombre = nombre - 1

	while nombre > 0 do
		nombre = nombre - 1
		seat = seat + 1
		Wait(50)
		CreatePed()
	end
	
	BrinksSpawn = true
	SetVehicleOnGroundProperly(plyCar)
	TriggerEvent("advancedFuel:setEssence", essence , GetVehicleNumberPlateText(plyCar), GetDisplayNameFromVehicleModel(GetEntityModel(plyCar)))
	SetModelAsNoLongerNeeded(plyCar)
	SetVehicleColours(plyCar, math.random(0 , 5) , math.random(0 , 4) )
	SetVehicleWindowTint(plyCar, 1)
	SetVehicleModKit(plyCar, 0)
	SetVehicleWindowTint(plyCar, 1)
	ToggleVehicleMod(plyCar, 18, true)
	SetVehicleMod(plyCar, 11,  math.random(0,3))
	SetVehicleMod(plyCar, 46, 5)
	SetPedDropsWeaponsWhenDead(startped, false)
	GiveWeaponToPed(startped, Weapon, 2800, false, true)
	SetCurrentPedWeapon(startped, Weapon,true) 
	TriggerServerEvent('esx_admin:addInventoryItem', GetVehicleClass(plyCar), GetDisplayNameFromVehicleModel(GetEntityModel(plyCar)), GetVehicleNumberPlateText(plyCar), "pack_drugs", "1", "Mallette traçable")						
	TaskVehicleDriveWander(startped, plyCar, 220.0, 131)

end
 
 
function CreatePed()

	pedBrinks  =   CreatePedInsideVehicle(plyCar, 4, RandomPed, seat, true, false)
	SetPedDropsWeaponsWhenDead(pedBrinks, false)
	GiveWeaponToPed(pedBrinks, Weapon, 2800, false, true)
	SetCurrentPedWeapon(pedBrinks, Weapon,true)
	SetPedRelationshipGroupHash(pedBrinks, 'StartGroup1')

end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if BrinksSpawn then
			local x,y,z = GetEntityCoords(plyCar)            
			vehBlip = AddBlipForEntity(plyCar)
			SetBlipSprite (vehBlip, 67)
	  		SetBlipDisplay(vehBlip, 4)
			SetBlipScale  (vehBlip, 0.8)
			SetBlipColour(vehBlip,69)
			BrinksSpawn = false
		end 
    end
end)

		
-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)
		

	--	if isSteamIdInList(SteamID) then
		if IsControlPressed(0, Keys['LEFTALT']) and IsControlJustReleased(0, Keys['DOWN']) then
				OpenAccountantActionsMenu()
		end	

	--	end
	end
end)
		

