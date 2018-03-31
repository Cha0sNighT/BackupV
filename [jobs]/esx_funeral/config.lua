Config                            = {}
Config.DrawDistance               = 100.0
Config.nameJob                    = "funeral"
Config.nameJobLabel               = "Pompes Funèbres"
Config.platePrefix                = "CROQ"
Config.Locale                     = 'fr'

Config.Blip = {
    Sprite = 84,
    Color = 5
}

Config.Vehicles = {
	Truck = {
		Spawner = 1,
		Label = 'Corbillard',
		Hash = "lurcher",
		Livery = 0,
		Trailer = "none",
	}
}

Config.Zones = {

  Cloakroom = {
    Pos     = {x = 254.77, y = -1339.59, z = 30.94},
    Size    = {x = 1.5, y = 1.5, z = 0.6},
    Color   = {r = 11, g = 203, b = 159},
    Type    = 27,
	BlipSprite = 84,
	BlipColor = 5,
	BlipName = Config.nameJobLabel.." : Vestiaire",
	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au vestiaire',
  },

  VehicleSpawner = {
	Pos   = {x = 248.64, y = -1344.31, z = 30.7},
	Size  = {x = 1.5, y = 1.5, z = 0.6},
	Color = {r = 11, g = 203, b = 159},
	Type  = 27,
	BlipSprite = 84,
	BlipColor = 5,
	BlipName = Config.nameJobLabel.." : Véhicule",
	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage',
  },

  VehicleSpawnPoint = {
	Pos   = {x = 238.15, y = -1343.33, z = 29.86},
	Size  = {x = 3.0, y = 3.0, z = 1.0},
	Type  = -1,
	Heading = 120,
  },

  VehicleDeleter = {
	Pos   = {x = 260.07, y = -1347.48, z = 30.94},
	Size  = {x = 3.0, y = 3.0, z = 0.9},
	Color = {r = 255, g = 0, b = 0},
	Type  = 27,
	BlipSprite = 84,
	BlipColor = 5,
	BlipName = Config.nameJobLabel.." : Retour Véhicule",
	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule',
  },

  Vente = {
	Pos   = {x = -1693.92, y = -291.77, z = 50.82},
	Size  = {x = 10.0, y = 10.0, z = 0.8},
	Color = {r = 11, g = 203, b = 159},
	Type  = 27,
	BlipSprite = 84,
	BlipColor = 5,
	BlipName = Config.nameJobLabel.." : Cimetière",

	ItemTime = 500,
	ItemDb_name = "organ_pooch",
	ItemName = "Corps humain",
	ItemMax = 1,
	ItemAdd = 1,
	ItemRemove = 1,
	ItemRequires = "organ_pooch",
	ItemRequires_name = "Corps humain",
	ItemDrop = 1,
	ItemPrice  = 100,
	hint = 'Appuyez sur ~INPUT_CONTEXT~ pour déposer le corps',
  },

}

Config.Funeral = {

  { [ 'x' ] = 	 328.05	, [ 'y' ] = 	-1471.46	, [ 'z' ] = 	28.78	},
  { [ 'x' ] = 	 1141.51	, [ 'y' ] = 	-1600.1	, [ 'z' ] = 	33.7	},
  { [ 'x' ] = 	 362.85	, [ 'y' ] = 	-584.95	, [ 'z' ] = 	27.69	},
  { [ 'x' ] = 	 -454.77	, [ 'y' ] = 	-332.02	, [ 'z' ] = 	33.38	},
  { [ 'x' ] = 	 -654.69	, [ 'y' ] = 	311.23	, [ 'z' ] = 	82.02	},
  { [ 'x' ] = 	 -874.48	, [ 'y' ] = 	-307.44	, [ 'z' ] = 	38.6	},
  { [ 'x' ] = 	 1828.3	,    [ 'y' ] = 	3692.52	, [ 'z' ] = 	33.23	},
  { [ 'x' ] = 	 -246.83	,  [ 'y' ] = 	6331.25	, [ 'z' ] = 	31.44	},

}

for i=1, #Config.Funeral, 1 do

    Config.Zones['Funeral' .. i] = {
        Pos   = Config.Funeral[i],
        Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Type  = -1
    }

end

Config.Uniforms = {

  job_wear = {
    male = {
        ['tshirt_1'] = 4, ['tshirt_2'] = 0,
		['torso_1'] = 10, ['torso_2'] = 0,
		['decals_1'] = 0, ['decals_2'] = 0,
		['arms'] = 24,
		['pants_1'] = 10, ['pants_2'] = 0,
		['shoes_1'] = 10, ['shoes_2'] = 0,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 0, ['chain_2'] = 0,
		['ears_1'] = -1, ['ears_2'] = 0
    },
    female = {
    ['tshirt_1'] = 38, ['tshirt_2'] = 2,
		['torso_1'] = 7, ['torso_2'] = 0,
		['decals_1'] = 0, ['decals_2'] = 0,
		['arms'] = 40,
		['pants_1'] = 52, ['pants_2'] = 2,
		['shoes_1'] = 52, ['shoes_2'] = 4,
		['helmet_1'] = -1, ['helmet_2'] = 0,
		['chain_1'] = 0, ['chain_2'] = 0,
		['ears_1'] = -1, ['ears_2'] = 0
    }
  },
}
