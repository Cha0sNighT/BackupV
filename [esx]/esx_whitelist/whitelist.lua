--[[
	Simple whitelist script to check if a player's identifier is inside
		a file.
		
	Copyright 2018, Tony Enfer, All rights reserved.
	
	You may modify this resource but NOT, under any circumstances, redistribute it.
]]

-- The whitelist array
local whitelistArray = {}

-- Read the "whitelist.json" file.
local data = LoadResourceFile(GetCurrentResourceName(), GetConvar("enfer.whitelist", "whitelist.json"))

-- If we got data from it, parse it and store it.
if data then
    whitelistArray = json.decode(data)
    print("Loaded " .. #whitelistArray .. " whitelisted identifiers")
end

--[[
	When a player joins, check if they're in the whitelistArray.
	
	If they are, allow them to join. Otherwise don't let them.
]]
AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    -- Tell the connection to defer until we have done
	deferrals.defer()
	
	-- Just in case "source" gets lost, store it
    local s = source
	
	-- If the player has been allowed to join the server
	local joined = false
	
	-- Tell the user we're checking stuff (not shown for long)
    deferrals.update("Veuillez patienter, vérification whitelist")
	
	-- Needed, not sure why.
	Wait(100)
	
	-- A bunch of variables for calculating percentage
	local totalInWhitelist = #whitelistArray -- Total no of IDs in the array
	local noIdentifiers = #GetPlayerIdentifiers(s) -- How many Identifiers the player has (usually 2 or 3)
	local currentId = 0 -- The index of the id we're checking
	local totalChecksNeeded = totalInWhitelist * noIdentifiers -- The total number of interations we need (to check the entire array)
	
	-- Loop though the player's identifiers
    for myIdx,identifier in pairs(GetPlayerIdentifiers(s)) do
	
		-- Loop through the whitelist array
        for wIdx,i in ipairs(whitelistArray) do
			
			-- Check if the player exists in the array.
            if(string.lower(i) == string.lower(identifier))then
                deferrals.done() -- They're in it... Let them in!
                joined = true 
				break -- no longer need to loop 
            end
			
			-- Tell user how much we've done
			deferrals.update(string.format("Vérification whitelist: %.2f%%", (currentId / totalChecksNeeded)*100))

			Wait(1)
			currentId = currentId +1
        end
    end
	if joined then
		return
	end
	
	-- Tell them to get lost. They're not in the array!
	deferrals.done("Vous n'êtes pas whitelisté")
end)