function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1]['firstname'] ~= nil then
      local data = {
        identifier  = result[1]['identifier'],
        firstname  = result[1]['firstname'],
        lastname  = result[1]['lastname'],
        dateofbirth  = result[1]['dateofbirth'],
        sex      = result[1]['sex'],
        height    = result[1]['height']
      }

      callback(data)
    else
      local data = {
        identifier   = '',
        firstname   = '',
        lastname   = '',
        dateofbirth = '',
        sex     = '',
        height     = ''
      }

      callback(data)
    end
  end)
end

function getCharacters(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1] and result[2] and result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
        firstname2    = result[2]['firstname'],
        lastname2    = result[2]['lastname'],
        dateofbirth2  = result[2]['dateofbirth'],
        sex2      = result[2]['sex'],
        height2      = result[2]['height'],
        firstname3    = result[3]['firstname'],
        lastname3    = result[3]['lastname'],
        dateofbirth3  = result[3]['dateofbirth'],
        sex3      = result[3]['sex'],
        height3      = result[3]['height']
      }

      callback(data)
    elseif result[1] and result[2] and not result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
        firstname2    = result[2]['firstname'],
        lastname2    = result[2]['lastname'],
        dateofbirth2  = result[2]['dateofbirth'],
        sex2      = result[2]['sex'],
        height2      = result[2]['height'],
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3      = ''
      }

      callback(data)
    elseif result[1] and not result[2] and not result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
        firstname2    = '',
        lastname2    = '',
        dateofbirth2  = '',
        sex2      = '',
        height2      = '',
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3      = ''
      }

      callback(data)
    else
      local data = {
        identifier    = '',
        firstname1    = '',
        lastname1    = '',
        dateofbirth1  = '',
        sex1      = '',
        height1      = '',
        firstname2    = '',
        lastname2    = '',
        dateofbirth2  = '',
        sex2      = '',
        height2      = '',
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3      = ''
      }

      callback(data)
    end
  end)
end

function setIdentity(identifier, data, callback)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']          = data.sex,
      ['@height']       = data.height
    },
  function(done)
    if callback then
      callback(true)
    end
  end)

  MySQL.Async.execute(
    'INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height)',
    {
      ['@identifier'] = identifier,
      ['@firstname']  = data.firstname,
      ['@lastname']   = data.lastname,
      ['@dateofbirth'] = data.dateofbirth,
      ['@sex']    = data.sex,
      ['@height']   = data.height
    })
end

function updateIdentity(identifier, data, callback)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']        = data.sex,
      ['@height']       = data.height
    },
  function(done)
    if callback then
      callback(true)
    end
  end)
end

function deleteIdentity(identifier, data, callback)
  MySQL.Async.execute("DELETE FROM `characters` WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']        = data.sex,
      ['@height']       = data.height
    },
  function(done)
    if callback then
      callback(true)
    end
  end)
end

RegisterServerEvent('esx_identity:setIdentity')
AddEventHandler('esx_identity:setIdentity', function(data, myIdentifiers)
	setIdentity(myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent('esx_identity:identityCheck', myIdentifiers.playerid, true)
		else
			TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Set Identity!")
		end
	end)
end)


AddEventHandler('es:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}
	
	TriggerClientEvent('esx_identity:saveID', source, myID)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_identity:identityCheck', source, false)
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_identity:identityCheck', source, true)
		end
	end)
end)

TriggerEvent('es:addGroupCommand', 'idhelp', "user", function(source, args, user)
	TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "Commands List")
	TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "/register - Register A New Character") 
	TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "/charlist - List Your Characters") 
	TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "/charselect 1,2,3 - Change Your Active Character") 
	TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "/delchar 1,2,3 - Delete A Character")
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "List all the identity-related commands"})

TriggerEvent('es:addCommand', 'register', function(source, args, user)
	getCharacters(source, function(data)
		if data.firstname3 ~= '' then
			TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "You Can Only Have 3 Characters.")
		else
			TriggerClientEvent('esx_identity:showRegisterIdentity', source, {})
		end
	end)
end, {help = "Register a new character"})

TriggerEvent('es:addGroupCommand', 'char', "user", function(source, args, user)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "You Have No Active Character.")
		else
			TriggerClientEvent('chatMessage', source, '[IDENTITY] Active Character:', {255, 0, 0}, data.firstname .. " " .. data.lastname)
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "List Your Current Active Character"})

TriggerEvent('es:addGroupCommand', 'charlist', "user", function(source, args, user)
	getCharacters(source, function(data)
		if data.firstname1 ~= '' then
			TriggerClientEvent('chatMessage', source, '[IDENTITY] Character 1:', {255, 0, 0}, data.firstname1 .. " " .. data.lastname1)
			
			if data.firstname2 ~= '' then
				TriggerClientEvent('chatMessage', source, '[IDENTITY] Character 2:', {255, 0, 0}, data.firstname2 .. " " .. data.lastname2)
				
				if dada.firstname3 ~= '' then
					TriggerClientEvent('chatMessage', source, '[IDENTITY] Character 3:', {255, 0, 0}, data.firstname3 .. " " .. data.lastname3)
				end
			end
		else
			TriggerClientEvent('chatMessage', source, '[IDENTITY]', {255, 0, 0}, "You Have No Characters. Please use the /register command.")
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "List Your Characters"})

TriggerEvent('es:addGroupCommand', 'charselect', "user", function(source, args, user)
	local charNumber = tonumber(args[1])
	
	getCharacters(source, function(data)
		if charNumber == 1 then
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname1,
				lastname  = data.lastname1,
				dateofbirth  = data.dateofbirth1,
				sex      = data.sex1,
				height    = data.height1
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Update Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 1!")
			end
		elseif charNumber == 2 then
		
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname2,
				lastname  = data.lastname2,
				dateofbirth  = data.dateofbirth2,
				sex      = data.sex2,
				height    = data.height2
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)

					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Update Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 2!")
			end
		elseif charNumber == 3 then
	
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname3,
				lastname  = data.lastname3,
				dateofbirth  = data.dateofbirth3,
				sex      = data.sex3,
				height    = data.height3
			}

			if data.firstname ~= '' then
				updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Update Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 3!")
			end
		else
			TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Update Identity!")
		end

	end)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "/charselect 1,2,3"})

TriggerEvent('es:addGroupCommand', 'delchar', "user", function(source, args, user)

	local charNumber = tonumber(args[1])
	
	getCharacters(source, function(data)
	
		if charNumber == 1 then
	
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname1,
				lastname  = data.lastname1,
				dateofbirth  = data.dateofbirth1,
				sex      = data.sex1,
				height    = data.height1
			}
			
			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Delete Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 1!")
			end
			
		elseif charNumber == 2 then
	
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname2,
				lastname  = data.lastname2,
				dateofbirth  = data.dateofbirth2,
				sex      = data.sex2,
				height    = data.height2
			}
			
			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Delete Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 2!")
			end
			
		elseif charNumber == 3 then
	
			local data = {
				identifier   = data.identifier,
				firstname  = data.firstname3,
				lastname  = data.lastname3,
				dateofbirth  = data.dateofbirth3,
				sex      = data.sex3,
				height    = data.height3
			}
	  
			if data.firstname ~= '' then
	  
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
					else
						TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Delete Identity!")
					end
				end)
			else
				TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "You don\'t have a character in slot 3!")
			end
		else
			TriggerClientEvent('chatMessage', source, "[IDENTITY]", {255, 0, 0}, "Failed To Delete Identity!")
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient permissions!")
end, {help = "/delchar 1,2,3"})