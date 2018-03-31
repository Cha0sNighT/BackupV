Config                          = {}
Config.DrawDistance             = 100.0
Config.Locale                   = 'fr'
Config.Society                  = true
Config.PriceRace                = 50
Config.EnableSociety            = true
Config.secondsRemaining 	    = 60


Config.SteamID = {
	"steam:11000010da7fc2b"
}


Config.Zones = { 
}

Config.RedKart = {
    { x = 1727.4031982422, y = 3301.4768066406, z = 40.323510742188 },
    { x = 1726.4272460938, y = 3305.208984375, z = 40.323510742188 },
    { x = 1728.8466796875,  y = 3296.1291503906, z = 40.323510742188 },
}

Config.BlueKart = {
    { x = 1732.0433349609, y = 3296.8432617188, z = 40.323491668701 },
    { x = 1730.7513427734, y = 3302.44921875, z = 40.323491668701 },
    { x = 1729.8864746094, y = 3306.1062011719, z = 40.323491668701 },
}

Config.Cloakroom = {
    { x = 1726.736328125, y = 3311.75390625, z = 40.323476409912 },
}


Config.Finish = {
    { x = 1741.8509521484, y = 3296.2543945313, z = 41.127906799316 },
}


for i=1, #Config.RedKart, 1 do  
    Config.Zones['RedKart' .. i] = {
        Pos   = Config.RedKart[i],
        Size  = {x = 2.0, y = 2.0, z = 1.0},
        Type  = 27,
        Color = {r = 255, g = 0, b = 0}
    }
end

for i=1, #Config.BlueKart, 1 do  
    Config.Zones['BlueKart' .. i] = {
        Pos   = Config.BlueKart[i],
        Size  = {x = 2.0, y = 2.0, z = 1.0},
        Type  = 27,
        Color = {r = 0, g = 0, b = 150}
    }
end

for i=1, #Config.Cloakroom, 1 do  
    Config.Zones['Cloakroom' .. i] = {
        Pos   = Config.Cloakroom[i],
        Size  = {x = 2.0, y = 2.0, z = 1.0},
        Type  = 1,
        Color = {r = 0, g = 250, b = 0}
    }
end

for i=1, #Config.Finish, 1 do  
    Config.Zones['Finish' .. i] = {
        Pos   = Config.Finish[i],
        Size  = {x = 3.0, y = 3.0, z = 3.0},
        Type  = 5,
        Color = {r = 0, g = 250, b = 0}
    }
end