ESX 					= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'karting', 'Karting', 'society_karting', 'society_karting', 'society_karting', {type = 'private'})

ESX.RegisterServerCallback("esx_karting:getSteamId", function(source, cb)
  local _source = source
  cb(GetPlayerIdentifiers(_source)[1])
end)

RegisterServerEvent('esx_karting:pay')
AddEventHandler('esx_karting:pay', function()

    local _source 		  = source
    local xPlayer         = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(Config.PriceRace)

    TriggerClientEvent('esx:showNotification', source, _U('youhavepay') .. Config.PriceRace .. '$')		

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_karting', function(account)
		account.addMoney(Config.PriceRace)
	end)

end)

RegisterServerEvent('esx_karting:remove_solde')
AddEventHandler('esx_karting:remove_solde', function(amount)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_karting', function(account)
			local _source 		  = source
			local xPlayer         = ESX.GetPlayerFromId(source)
		
			xPlayer.addMoney(amount)
    	account.removeMoney(amount)
		TriggerClientEvent('esx:showNotification', _source, (_U('remove_money') .. amount ..'$'))
	end)


end)

RegisterServerEvent('esx_karting:deposit')
AddEventHandler('esx_karting:deposit', function(amount)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_karting', function(account)
			local _source 		  = source
			local xPlayer         = ESX.GetPlayerFromId(source)
		
			xPlayer.removeMoney(amount)
    	account.addMoney(amount)
		TriggerClientEvent('esx:showNotification', _source, (_U('add_money') .. amount ..'$'))
	end)
end)

RegisterServerEvent('esx_karting:logs')
AddEventHandler('esx_karting:logs', function(finaltime)

    local _source 		  = source
    local xPlayer         = ESX.GetPlayerFromId(source)
	local time 		= os.date("%d/%m/%y %X")
	local newFile	 = "Karting : " .. xPlayer.name .. " : viens de faire un temps de " .. finaltime .. " secondes à la date du " .. time .. "\n"
	local file 	   = io.open('logs/Karting.txt', "a")

	file:write(newFile)
	file:flush()
	file:close()

end)

