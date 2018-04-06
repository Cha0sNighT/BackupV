Config                        = {}
Config.DrawDistance           = 100.0
Config.Locale                 = 'fr'

local seconde = 1000
local minute = 60 * seconde

Config.Fridge = {
	meat = 300,
	packaged_chicken = 100,
	bread = 200,
	water = 100,
	cola = 100,
	vegetables = 100
} -- maxquantity

Config.Recipes = {
	tacos = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			meat				= { "Viande"	, 2 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 30 * seconde,
		Item = 'tacos',
		Name = 'Tacos'
	},
	burger = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			packaged_chicken 	= { "Poulet"	, 1 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'burger',
		Name = 'Burger'
	}
}

Config.Zones = {
	Actions = {
		Pos   = {x = 189.525, y = -1445.308, z = 28.1416},
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	VehicleSpawnPoint = {
		Pos   = {x = 193.417, y = -1456.56, z = 28.1416},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Type  = -1
	},
	VehicleDeleter = {
		Pos   = {x = 185.189, y = -1439.23, z = 28.1602},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1
	},
	Provisions = {
        Pos   = { x = -2955.242, y = 385.897, z = 14.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'bread',      label = _U('bread'),   price = 2 },
            { name = 'vegetables',      label = _U('vegetables'),   price = 4 },
            { name = 'meat',       label = _U('meat'),    price = 10 }
        },
    }
}
