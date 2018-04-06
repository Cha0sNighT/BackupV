ESX                 = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("esx_admin:getSteamId", function(source, cb)
    local _source = source
    cb(GetPlayerIdentifiers(_source)[1])
end)

RegisterServerEvent('esx_admin:customerDeposit')
AddEventHandler('esx_admin:customerDeposit', function(amount)

	local xPlayer         = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(amount)

end)

RegisterServerEvent('esx_admin:customeraccount')
AddEventHandler('esx_admin:customeraccount', function(target, amount)

	local xPlayer         = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney('bank',amount)

end)

RegisterServerEvent('esx_admin:customerdirtDeposit')
AddEventHandler('esx_admin:customerdirtDeposit', function(amount)

	local xPlayer         = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney('black_money',amount)

end)

RegisterServerEvent('esx_admin:additem')
AddEventHandler('esx_admin:additem', function(item)

	local xPlayer         = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item, 1)

end)

RegisterServerEvent('esx_admin:giveweapon')
AddEventHandler('esx_admin:giveweapon', function(text)

	local xPlayer         = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(text, 2500)

end)

RegisterServerEvent('esx_admin:phone')
AddEventHandler('esx_admin:phone', function(target, text)

	local _source 		  = source
	local xPlayers 		  = ESX.GetPlayers()
	local xPlayer         = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_phone:onMessage', target, '',text  , xPlayer.get('coords'), true, 'Alert Police', true)

end)

RegisterServerEvent('esx_admin:policealert')
AddEventHandler('esx_admin:policealert', function(text)

	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer         = ESX.GetPlayerFromId(source)

	for i=1, #xPlayers, 1 do

		local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer2.job.name == 'police' or xPlayer2.job.name == 'sherif' then
			TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, '', text , xPlayer.get('coords'), true, 'Alert Police', true)
		end
	end

	print('Alert Police : ' .. text)

end)

RegisterServerEvent('esx_admin:gangalert')
AddEventHandler('esx_admin:gangalert', function(text)

	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer         = ESX.GetPlayerFromId(source)

	for i=1, #xPlayers, 1 do

		local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer2.job.name == 'gang_weed' or xPlayer2.job.name == 'gang_meth' or xPlayer2.job.name == 'gang_coke' then
			TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, '', text , xPlayer.get('coords'), true, 'Deepweb', true)
		end
	end

	print('Deepweb : ' .. text)

end)

RegisterServerEvent('esx_admin:pickup')
AddEventHandler('esx_admin:pickup', function(item)
	local itemName = item
	local total = 1
	local itemCount = 1

	ESX.CreatePickup('item_standard', itemName, total, "Inconnue [" .. itemCount .. "]", _source)
end)

RegisterServerEvent('esx_admin:addInventoryItem')
AddEventHandler('esx_admin:addInventoryItem', function(type, model, plate, item, count, name, owned)
  local _source = source
  MySQL.Async.fetchAll(
    'INSERT INTO truck_inventory (item,count,plate,name,owned) VALUES (@item,@qty,@plate,@name,@owned) ON DUPLICATE KEY UPDATE count=count+ @qty',
    {
      ['@plate'] = plate,
      ['@qty'] = count,
      ['@item'] = item,
	  ['@name'] = name,
	  ['@owned'] = "0",
    },
    function(result)
      TriggerEvent("esx:adminAddInventory", _source, type, model, plate, item, count, name)
    end)
end)

RegisterServerEvent('esx_admin:brinks_police')
AddEventHandler('esx_admin:brinks_police', function(item)

	local _source 	 = source
	local xPlayers	 = ESX.GetPlayers()
	local xPlayer    = ESX.GetPlayerFromId(source)

	for i=1, #xPlayers, 1 do

		local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer2.job.name == 'gang_weed' or xPlayer2.job.name == 'gang_meth' or xPlayer2.job.name == 'gang_coke' then
			TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, '', "Un camion de la brinks vient d'être attaqué", xPlayer.get('coords'), true, 'Deepweb', true)
		end
		if xPlayer2.job.name == 'police' or xPlayer2.job.name == 'sherif' then
			TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, '', "Un camion de la brinks vient d'être attaqué" , xPlayer.get('coords'), true, 'Alert Police', true)
		end
	end

end)

RegisterServerEvent('esx_admin:callbrinks1')
AddEventHandler('esx_admin:callbrinks1', function(item)

	local _source 	 = source
	local xPlayers	 = ESX.GetPlayers()
	local xPlayer    = ESX.GetPlayerFromId(source)

	for i=1, #xPlayers, 1 do

		local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer2.job.name == 'police' or xPlayer2.job.name == 'sherif' then
			TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, 'Brinks', "Nous allons faire plusieur transferts, merci de faire de votre mieux pour nous protéger" , xPlayer.get('coords'), false, 'Brinks', false)
		end
	end

end)



RegisterServerEvent('esx_admin:getStockItem')
AddEventHandler('esx_admin:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_admin', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

	end)

end)

RegisterServerEvent('esx_admin:putStockItems')
AddEventHandler('esx_admin:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_admin', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté ~y~x' .. count .. '~b~ ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_admin:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_admin', function(inventory)
		cb(inventory.items)
	end)

end)

ESX.RegisterServerCallback('esx_admin:getPlayerInventory', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({
		items = items
	})

end)

ESX.RegisterServerCallback('esx_admin:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, 1000)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_admin', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		 store.set('weapons', weapons)

		 cb()

	end)

end)

ESX.RegisterServerCallback('esx_admin:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_admin', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_admin:addArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeWeapon(weaponName)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_admin', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		 store.set('weapons', weapons)

		 cb()

	end)

end)

RegisterServerEvent('esx_admin:addstatus')
AddEventHandler('esx_admin:addstatus', function(target,amount)

	local xPlayer         = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_status:set', source, 'hunger', amount)
	TriggerClientEvent('esx_status:set', source, 'thirst', amount)

end)

RegisterServerEvent('esx_admin:withdraw')
AddEventHandler('esx_admin:withdraw', function(amount)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_accountant', function(account)
		account.removeMoney(amount)
	end)

end)

RegisterServerEvent('esx_admin:deposit')
AddEventHandler('esx_admin:deposit', function(amount)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_accountant', function(account)
		account.addMoney(amount)
	end)

end)

RegisterServerEvent('esx_admin:confiscatePlayerItem')
AddEventHandler('esx_admin:confiscatePlayerItem', function(target, itemType, itemName, amount)

	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then

		local label = sourceXPlayer.getInventoryItem(itemName).label

		targetXPlayer.removeInventoryItem(itemName, amount)
		sourceXPlayer.addInventoryItem(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "'Vous avez confisqué ~y~x'" .. amount .. ' ' .. label .."'~s~ à ~b~'" .. targetXPlayer.name)

	end

	if itemType == 'item_money' then

		targetXPlayer.removeMoney(amount)
		sourceXPlayer.addMoney(amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "'Vous avez confisqué ~y~$'" .. amount .."'~s~ à ~b~'" .. targetXPlayer.name)

	end

	if itemType == 'item_account' then

		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "'Vous avez confisqué ~y~$'" .. amount .."'~s~ à ~b~'" .. targetXPlayer.name)

	end

	if itemType == 'item_weapon' then

		targetXPlayer.removeWeapon(itemName)
		sourceXPlayer.addWeapon(itemName, amount)

		TriggerClientEvent('esx:showNotification', sourceXPlayer.source,'Vous avez confisqué ~y~x1 ' .. ESX.GetWeaponLabel(itemName) .."'~s~ à ~b~'" .. targetXPlayer.name)

	end

end)

ESX.RegisterServerCallback('esx_admin:getCustomers', function(source, cb)

	local xPlayers   = ESX.GetPlayers()
	local customers  = {}

	for i=1, #xPlayers, 1 do

		local xPlayer         = ESX.GetPlayerFromId(xPlayers[i])

		table.insert(customers, {
			type         = 'player',
			name         = GetPlayerName(xPlayer.source),
			identifier   = xPlayer.identifier,
			group        = xPlayer.getGroup(),
			accounts     = xPlayer.get('bank'),
			dirtmoney	 = xPlayer.accounts[i].money,
			job          = xPlayer.job['name'],
			grade        = xPlayer.job.grade_name,
			money        = xPlayer.get('money'),
			phone		 = xPlayer.get('phoneNumber'),
		})

	end

	cb(customers)

end)
