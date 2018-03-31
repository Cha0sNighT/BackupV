Config.Jobs.chemist = {
	BlipInfos = {
		Sprite = 51,
		Color = 38
	},
  Vehicles = {
		Truck = {
			Spawner = 1,
			Hash = "packer",
			Trailer = "tanker2",
			HasCaution = true
		},
    Van = {
			Spawner = 2,
			Hash = "rumpo2",
			Trailer = "none",
			HasCaution = true
		}
  },
  Zones = {
		CloakRoom = {
			Pos   = {x = 858.91, y = -2273.22, z = 29.36},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 27,
			Blip  = true,
			Name  = _U('c_chemist_locker'),
			Type  = "cloakroom",
			Hint  = _U('cloak_change'),
			GPS = {x = 858.91, y = -2273.22, z = 29.36}
		},

  Chimiques = {
		Pos   = {x = 839.51, y = -2343.35, z = 29.34},
		Color = {r = 204, g = 204, b = 0},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Marker= 27,
		Blip  = true,
		Name  = _U('c_chim_area'),
		Type  = "work",
		Item  = {
			{
				name   = _U('c_products'),
				db_name= "cproducts",
				time   = 2000,
				max    = 100,
				add    = 1,
				remove = 1,
				requires = "nothing",
				requires_name = "Nothing",
				drop   = 100
			}
		},
			Hint  = _U('c_chim_button'),
			GPS = {x = 839.51, y = -2343.35, z = 29.34}
	},

  TruckSpawner = {
    Pos   = {x = 855.08, y = -2283.78, z = 29.36},
    Size  = {x = 3.0, y = 3.0, z = 1.0},
    Color = {r = 204, g = 204, b = 0},
    Marker= 27,
    Blip  = true,
    Name  = _U('c_spawntruck_title'),
    Type  = "vehspawner",
    Spawner = 1,
    Hint  = _U('c_spawntruck'),
    Caution = 2000,
    GPS = {x = 855.08, y = -2283.78, z = 29.36}
  },

  TruckSpawnPoint = {
    Pos   = {x = 850.92, y = -2316.56, z = 29.35},
    Size  = {x = 3.0, y = 3.0, z = 1.0},
    Marker= -1,
    Blip  = false,
    Name  = _U('c_truck_title'),
    Type  = "vehspawnpt",
    Spawner = 1,
    GPS = 0,
    Heading = 186.4
  },

  TruckDeletePoint = {
    Pos   = {x = 3557.56, y = 3657.95, z = 32.90},
    Size  = {x = 3.0, y = 3.0, z = 2.0},
    Color = {r = 255, g = 0, b = 0},
    Marker= 27,
    Blip  = true,
    Name  = _U('c_truck_return_title'),
    Type  = "vehdelete",
    Hint  = _U('c_truck_return_button'),
    Spawner = 1,
    Caution = 2000,
    GPS = {x = 3557.56, y = 3657.95, z = 32.90},
    Teleport = {x = 3557.56, y = 3657.95, z = 32.90}
  },

  TransMed = {
    Pos   = {x = 3596.65, y = 3661.47, z = 32.88},
    Color = {r = 204, g = 204, b = 0},
    Size  = {x = 3.0, y = 3.0, z = 1.0},
    Marker= 27,
    Blip  = true,
    Name  = _U('c_transmed_area'),
    Type  = "work",
    Item  = {
      {
        name   = _U('pillz'),
        db_name= "pillz",
        time   = 2000,
        max    = 100,
        add    = 1,
        remove = 1,
        requires = "cproducts",
        requires_name = _U('c_products'),
        drop   = 100
      }
    },
    Hint  = _U('c_transmed_button'),
    GPS = {x = 3596.65, y = 3661.47, z = 32.88}
  },

  VanSpawner = {
        Pos   = {x = 3579.94, y = 3670.41, z = 32.90},
        Size  = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
    Marker= 27,
    Blip  = false,
    Name  = _U('spawn_veh'),
    Type  = "vehspawner",
    Spawner = 2,
    Hint  = _U('spawn_veh_button'),
    Caution = 2000,
    GPS = {x = 3579.94, y = 3670.41, z = 32.90}
  },

  VanSpawnPoint = {
        Pos   = {x = 3572.82, y = 3667.88, z = 32.90},
        Size  = {x = 3.0, y = 3.0, z = 1.0},
    Marker= -1,
    Blip  = false,
    Name  = _U('service_vh'),
    Type  = "vehspawnpt",
    Spawner = 2,
    GPS = 0,
    Heading = 107
  },

  VanDeletePoint = {
        Pos   = {x = 852.4, y = -2259.94, z = 29.32},
        Size  = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 255, g = 0, b = 0},
    Marker= 27,
    Blip  = false,
    Name  = _U('return_vh'),
    Type  = "vehdelete",
    Hint  = _U('return_vh_button'),
    Spawner = 2,
    Caution = 2000,
    GPS = 0,
    Teleport = 0
  },

  Delivery = {
    Pos   = {x = 329.35, y = -1473.84, z = 28.76},
    Color = {r = 204, g = 204, b = 0},
    Size  = {x = 3.0, y = 3.0, z = 3.0},
    Color = {r = 204, g = 204, b = 0},
    Marker= 27,
    Blip  = true,
    Name  = _U('c_deliver_pillz_blip'),
    Type  = "delivery",
    Spawner = 2,
    Item  = {
      {
        name   = _U('delivery'),
        time   = 500,
        remove = 1,
        max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
        price  = 15,
        requires = "pillz",
        requires_name = _U('pillz'),
        drop   = 100
      }
    },
    Hint  = _U('c_deliver_pillz'),
    GPS = {x = 329.35, y = -1473.84, z = 28.76}
  }
}
}
