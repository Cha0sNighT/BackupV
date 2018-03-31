Config                			= {}
Config.DrawDistance   			= 100
Config.Size           			= { x = 1.0, y = 1.0, z = 1.0 }
Config.Color          			= { r = 0, g = 128, b = 255 }
Config.Type           			= 27
Config.Locale         			= 'fr'
Config.EnableLicense  			= true
Config.LicensePrice   			= 5000
Config.EnableClipGunShop		= true
Config.EnableClipBlackWeashop	= false

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
        Items = {},
        Pos   = {
            { x = -662.180,   y = -934.961,   z = 20.929 },
            { x = 810.25,     y = -2157.60,   z = 28.72 },
            { x = 1693.44,    y = 3760.16,    z = 33.81 },
            { x = -330.24,    y = 6083.88,    z = 30.55 },
            { x = 252.63,     y = -50.00,     z = 69.04 },
            { x = 22.09,      y = -1107.28,   z = 28.90 },
            { x = 2567.69,    y = 294.38,     z = 107.83 },
            { x = -1117.58,   y = 2698.61,    z = 17.65 },
            { x = 842.44,     y = -1033.42,   z = 27.29 },

        }
    },

    BlackWeashop = {
        legal = 1,
        Items = {},
        Pos   = {
            { x = 0,   y = 0,  z = 0 },
        }
    },

}
