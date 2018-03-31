Config.Jobs.brewer = {
  BlipInfos = {
    Sprite = 93,
    Color = 46
  },
  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "pounder",
      Trailer = "none",
      HasCaution = true
    }
  },
  Zones = {
    CloakRoom = {
      Pos = {x = 849.65, y = -1995.32, z = 28.99},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('b_locker_room'),
      Type = "cloakroom",
      Hint = _U('cloak_change'),
    },

    Malt = {
      Pos = {x = 2905.95, y = 4382.03, z = 49.34},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('b_blip_malt'),
      Type = "work",
      Item = {
        {
          name = _U('b_malt'),
          db_name = "malt",
          time = 3000,
          max = 50,
          add = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop = 100
        }
      },
      Hint = _U('b_pickup_malt')
    },

    Melange = {
      Pos = {x = 406.32, y = 6463.47, z = 27.82},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('b_blip_melange'),
      Type = "work",
      Item = {
        {
          name = _U('b_melange'),
          db_name = "melange",
          time = 3000,
          max = 100,
          add = 2,
          remove = 1,
          requires = "malt",
          requires_name = _U('b_malt'),
          drop = 100
        }
      },
      Hint = _U('b_pickup_melange')
    },

    Beer = {
      Pos = {x = 837.66, y = -1934.71, z = 27.98},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('b_blip_beer'),
      Type = "work",
      Item = {
        {
          name = _U('b_beer'),
          db_name = "beer",
          time = 4000,
          max = 100,
          add = 1,
          remove = 1,
          requires = "melange",
          requires_name = _U('b_melange'),
          drop = 100
        }
      },
      Hint = _U('b_pick_beer')
    },

    VehicleSpawner = {
      Pos = {x = 842.59, y = -1991.21, z = 28.31},
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
      Pos = {x = 835.51, y = -1969.04, z = 28.30},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Marker = -1,
      Blip = false,
      Name = _U('service_vh'),
      Type = "vehspawnpt",
      Spawner = 1,
      Heading = 20.5
    },

    VehicleDeletePoint = {
      Pos = {x = 850.87, y = -1988.39, z = 28.31},
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

    Delivery = {
      Pos = {x = -558.84, y = 301.91, z = 82.20},
      Color = {r = 204, g = 204, b = 0},
      Size = {x = 5.0, y = 5.0, z = 3.0},
      Marker = 27,
      Blip = true,
      Name = _U('b_deliver_button_blip'),
      Type = "delivery",
      Spawner = 1,
      Item = {
        {
          name = _U('delivery'),
          time = 500,
          remove = 1,
          max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price = 15,
          requires = "beer",
          requires_name = _U('b_beer'),
          drop = 100
        }
      },
      Hint = _U('b_deliver_button')
    }
  }
}
