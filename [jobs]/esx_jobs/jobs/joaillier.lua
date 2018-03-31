Config.Jobs.joaillier = {
  BlipInfos = {
    Sprite = 385,
    Color = 4
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "sadler",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos = {x = -620.68, y = -224.96, z = 37.07},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('j_joaillier_locker'),
      Type = "cloakroom",
      Hint = _U('cloak_change'),
    },

    Pierre = {
      Pos = {x = 319.69, y = 2854.46, z = 42.59},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('j_blip_pierre'),
      Type = "work",
      Item = {
        {
          name = _U('j_stone'),
          db_name = "stone",
          time = 3000,
          max = 7,
          add = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop = 100
        }
      },
      Hint = _U('j_pickup_stone')
    },

    Tri= {
      Pos = {x = -628.39, y = -230.32, z = 37.07},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('j_blip_tri'),
      Type = "work",
      Item  = {
				{
					name   = _U('j_brubis'),
					db_name= "brubis",
					time   = 4000,
					max    = 56,
					add    = 8,
					remove = 1,
					requires = "stone",
					requires_name = _U('j_stone'),
					drop   = 100
				},
				{
					name   = _U('j_bsaphir'),
					db_name= "bsaphir",
					max    = 42,
					add    = 6,
					drop   = 100
				},
				{
					name   = _U('j_bemeraude'),
					db_name= "bemeraude",
					max    = 21,
					add    = 3,
					drop   = 100
				},
				{
					name   = _U('j_bdiamond'),
					db_name= "bdiamond",
					max    = 50,
					add    = 1,
					drop   = 100
				}
			},
			Hint  = _U('j_tri_button'),
			GPS = {x = -628.39, y = -230.32, z = 37.07}
		},

    Taille= {
      Pos = {x = -623.35, y = -236.93, z = 37.07},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('j_blip_taille'),
      Type = "work",
      Item  = {
				{
					name   = _U('j_rubis'),
					db_name= "rubis",
					time   = 4000,
					max    = 56,
					add    = 1,
					remove = 1,
					requires = "brubis",
					requires_name = _U('j_brubis'),
					drop   = 100
				},
				{
					name   = _U('j_saphir'),
					db_name= "saphir",
					max    = 42,
					add    = 1,
          remove = 1,
					requires = "bsaphir",
					requires_name = _U('j_bsaphir'),
					drop   = 100
				},
				{
					name   = _U('j_emeraude'),
					db_name= "emeraude",
					max    = 21,
					add    = 1,
          remove = 1,
					requires = "bemeraude",
					requires_name = _U('j_bemeraude'),
					drop   = 100
				},
				{
					name   = _U('j_diamond'),
					db_name= "diamond",
					max    = 50,
					add    = 1,
          remove = 1,
					requires = "bdiamond",
					requires_name = _U('j_bdiamond'),
					drop   = 100
				}
			},
			Hint  = _U('j_taille_button'),
			GPS = {x = -623.35, y = -236.93, z = 37.07}
		},

    VehicleSpawner = {
      Pos = {x = -632.92, y = -238.78, z = 37.09},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = false,
      Name = _U('spawn_veh'),
      Type = "vehspawner",
      Spawner = 1,
      Hint = _U('spawn_truck_button'),
      Caution = 2000
    },

    VehicleSpawnPoint = {
      Pos = {x = -673.45, y = -227.53, z = 36.1},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Marker = -1,
      Blip = false,
      Name = _U('service_vh'),
      Type = "vehspawnpt",
      Spawner = 1,
      Heading = 94.1
    },

    VehicleDeletePoint = {
      Pos = {x = -669.3, y = -221.93, z = 36.27},
      Size = {x = 5.0, y = 5.0, z = 1.0},
      Color = {r = 255, g = 0, b = 0},
      Marker = 27,
      Blip = false,
      Name = _U('return_vh'),
      Type = "vehdelete",
      Hint = _U('return_vh_button'),
      Spawner = 1,
      Caution = 2000,
      GPS = 0,
      Teleport = 0
    },

    Vente = {
			Pos   = {x = 182.41, y = -1319.36, z = 28.33},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 27,
			Blip  = true,
			Name  = _U('j_blip_sell'),
			Type  = "delivery",
			Spawner = 1,
			Item  = {
				{
					name   = _U('delivery'),
					time   = 500,
					remove = 1,
					max    = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 50,
					requires = "rubis",
					requires_name = _U('j_rubis'),
					drop   = 100
				},
        {
					name   = _U('delivery'),
					time   = 500,
					remove = 1,
					max    = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 100,
					requires = "saphir",
					requires_name = _U('j_saphir'),
					drop   = 100
				},
        {
					name   = _U('delivery'),
					time   = 500,
					remove = 1,
					max    = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 150,
					requires = "emeraude",
					requires_name = _U('j_emeraude'),
					drop   = 100
				},
        {
					name   = _U('delivery'),
					time   = 500,
					remove = 1,
					max    = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 200,
					requires = "diamond",
					requires_name = _U('j_diamond'),
					drop   = 100
				}
			},
			Hint  = _U('j_deliver'),
			GPS = {x = 2962.4, y = 2746.2, z = 42.398}
		}
  }
}
