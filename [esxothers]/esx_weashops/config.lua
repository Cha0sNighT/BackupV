Config                = {}
Config.DrawDistance   = 100
Config.Size           = { x = 1.5, y = 1.5, z = 1.5 }
Config.Color          = { r = 0, g = 128, b = 255 }
Config.Type           = 27
Config.Locale         = 'fr'
Config.EnableLicense  = true
Config.LicensePrice   = 5000


Config.EnableClip = {
	GunShop = {
		Price = 50,
		Label = "Chargeur"
	},
	BlackWeashop = {
		name = "BlackWeashop",
		Price = 100,
		Label = "Chargeur"
	}
}


Config.Zones = {

    GunShop = {
        legal = 0,
        Items = {
            {name  = "WEAPON_PISTOL", price = 500, label = "Pistolet"},
            {name  = "WEAPON_COMBATPISTOL", price = 1000, label = "Pistolet de Combat"},
            {name = "WEAPON_HEAVYPISTOL", price = 5000, label = "Pistolet Lourd"},
            {name = "WEAPON_REVOLVER", price = 10000, label = "Python"},
            {name = "WEAPON_MOLOTOV", price = 5000, label = "Coktail Molotov (x25)"},
            {name = "WEAPON_SMOKEGRENADE", price = 2000, label = "Grenade Fumigène (x25)"},
            {name = "WEAPON_KNIFE", price = 100, label = "Couteau"},
            {name = "WEAPON_FLAREGUN", price = 100, label = "Pistolet de détresse"},
            {name = "WEAPON_BAT", price = 50, label = "Batte de Baseball"},
            {name = "WEAPON_FLASHLIGHT", price = 25, label = "Lampe torche"},
            {name = "WEAPON_KNUCKLE", price = 30, label = "Poing Américain"},
            {name = "WEAPON_MACHETE", price = 200, label = "Machète"}--Add a comma and duplicate the line to repeat the process. If finished, Do not add a comma at the end.
        },
        Items1 = {
            {name = "WEAPON_MACHINEPISTOL", price = 1400, label = "Tec 9"},
            {name  = "WEAPON_MICROSMG", price = 3000, label = "Uzi"},
            {name = "WEAPON_MINISMG", price = 4000, label = "Skorpion"},
            {name = "WEAPON_GRENADE", price = 5000, label = "Grenade"},
            {name = "WEAPON_SAWNOFFSHOTGUN", price = 5000, label = "Canon scié"},
            {name = "WEAPON_DOUBLEBARRELSHOTGUN", price = 7000, label = "Double Canon"},
            {name = "WEAPON_COMPACTRIFLE", price = 15000, label = "AK-47u"},
            {name = "WEAPON_SMG", price = 20000, label = "MP5"}
        },
        Items2 = {
            {name  = "WEAPON_CARBINERIFLE", price = 50000, label = "Carabine M4"},
            {name = "WEAPON_ASSAULTRIFLE", price = 50000, label = "Fusil AK47"},
            {name = "WEAPON_SNIPERRIFLE", price = 65000, label = "Fusil Sniper"},
            {name = "WEAPON_HEAVYSNIPER", price = 80000, label = "Fusil Sniper Lourd"},
            {name = "WEAPON_PUMPSHOTGUN", price = 30000, label = "Fusil à pompe"},
            {name = "WEAPON_STICKYBOMB", price = 25000, label = "Bombe Collante (x25)"},
            {name = "WEAPON_PIPEBOMB", price = 20000, label = "Bombe Artisanale (x10)"}
        },
        Pos   = {
            { x = -662.180,   y = -934.961,   z = 20.839 },
            { x = 810.25,     y = -2157.60,   z = 28.63 },
            { x = 1693.44,    y = 3760.16,    z = 33.72 },
            { x = -330.24,    y = 6083.88,    z = 30.46 },
            { x = 252.63,     y = -50.00,     z = 68.95 },
            { x = 22.09,      y = -1107.28,   z = 28.81 },
            { x = 2567.69,    y = 294.38,     z = 107.74 },
            { x = -1117.58,   y = 2698.61,    z = 17.56 },
            { x = 842.44,     y = -1033.42,   z = 27.20 },

        }
    },

    BlackWeashop = {
        legal = 1,
        Items = {
          {name  = "WEAPON_PISTOL", price = 500, label = "Pistolet"},
          {name  = "WEAPON_COMBATPISTOL", price = 1000, label = "Pistolet de Combat"},
          {name = "WEAPON_HEAVYPISTOL", price = 5000, label = "Pistolet Lourd"},
          {name = "WEAPON_REVOLVER", price = 10000, label = "Python"},
          {name = "WEAPON_MOLOTOV", price = 5000, label = "Coktail Molotov"},
          {name = "WEAPON_SMOKEGRENADE", price = 2000, label = "Grenade Fumigène"},
          {name = "WEAPON_KNIFE", price = 100, label = "Couteau"},
          {name = "WEAPON_BAT", price = 50, label = "Batte de Baseball"},
          {name = "WEAPON_FLASHLIGHT", price = 25, label = "Lampe torche"},
          {name = "WEAPON_KNUCKLEDUSTER", price = 30, label = "Poing Américain"},
          {name = "WEAPON_MACHETE", price = 200, label = "Machète"},
          {name = "WEAPON_MACHINEPISTOL", price = 1400, label = "Tec 9"},
          {name  = "WEAPON_MICROSMG", price = 3000, label = "Uzi"},
          {name = "WEAPON_MINISMG", price = 4000, label = "Skorpion"},
          {name = "WEAPON_GRENADE", price = 5000, label = "Grenade"},
          {name = "WEAPON_SAWNOFFSHOTGUN", price = 5000, label = "Canon scié"},
          {name = "WEAPON_DOUBLEBARRELSHOTGUN", price = 7000, label = "Double Canon"},
          {name = "WEAPON_COMPACTRIFLE", price = 15000, label = "AK-47u"},
          {name = "WEAPON_SMG", price = 20000, label = "MP5"},
          {name  = "WEAPON_CARBINERIFLE", price = 50000, label = "Carabine M4"},
          {name = "WEAPON_ASSAULTRIFLE", price = 50000, label = "Fusil AK47"},
          {name = "WEAPON_SNIPERRIFLE", price = 65000, label = "Fusil Sniper"},
          {name = "WEAPON_HEAVYSNIPER", price = 80000, label = "Fusil Sniper Lourd"},
          {name = "WEAPON_PUMPSHOTGUN", price = 30000, label = "Fusil à pompe"},
          {name = "WEAPON_STICKYBOMB", price = 25000, label = "Bombe Collante"},
          {name = "WEAPON_PIPEBOMB", price = 20000, label = "Bombe Artisanale"}
        },
        Pos   = {
            { x = 905.9,   y = -3230.54,  z = -99.25 },
        }
    },

}
