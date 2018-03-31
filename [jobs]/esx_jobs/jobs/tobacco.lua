Config.Jobs.tobacco = {
  BlipInfos = {
    Sprite = 79,
    Color = 5
  },

  Vehicles = {
    Truck = {
      Spawner = 1,
      Hash = "pony2",
      Trailer = "none",
      HasCaution = true
    }
  },

  Zones = {
    CloakRoom = {
      Pos = {x = 367.81, y = 351.2, z = 102.14},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('t_locker'),
      Type = "cloakroom",
      Hint = _U('cloak_change'),
      GPS = {x = 367.81, y = 351.2, z = 102.14}
    },

    Feuilles = {
      Pos = {x = 407.62, y = 6496.1, z = 26.89},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('t_blip_feuilles'),
      Type = "work",
      Item = {
        {
          name = _U('t_feuilles'),
          db_name = "feuilletabac",
          time = 3000,
          max = 100,
          add = 1,
          remove = 1,
          requires = "nothing",
          requires_name = "Nothing",
          drop = 100
        }
      },
      Hint = _U('t_pickup'),
      GPS = {x = 407.62, y = 6496.1, z = 26.89}
    },

    Seche = {
      Pos = {x = 2.77, y = 6425.41, z = 30.44},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('t_blip_seche'),
      Type = "work",
      Item = {
        {
          name = _U('t_seche'),
          db_name = "tabac",
          time = 5000,
          max = 100,
          add = 1,
          remove = 1,
          requires = "feuilletabac",
          requires_name = _U('t_feuilles'),
          drop = 100
        }
      },
      Hint = _U('t_makeseche'),
      GPS = {x = 2.77, y = 6425.41, z = 30.44}
    },

    Cigarette = {
      Pos = {x = -225.4, y = -2656.05, z = 5.01},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = true,
      Name = _U('t_blip_cigarettes'),
      Type = "work",
      Item = {
        {
          name = _U('t_cigarettes'),
          db_name = "cigarett",
          time = 4000,
          max = 100,
          add = 1,
          remove = 1,
          requires = "tabac",
          requires_name = _U('t_seche'),
          drop = 100
        }
      },
      Hint = _U('t_fabric'),
      GPS = {x = -225.4, y = -2656.05, z = 5.01}
    },

    VehicleSpawner = {
      Pos = {x = 367.06, y = 347.16, z = 102.20},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Color = {r = 204, g = 204, b = 0},
      Marker = 27,
      Blip = false,
      Name = _U('spawn_veh'),
      Type = "vehspawner",
      Spawner = 1,
      Hint = _U('spawn_veh_button'),
      Caution = 2000,
      GPS = {x = 367.06, y = 347.16, z = 102.20}
    },

    VehicleSpawnPoint = {
      Pos = {x = 368.12, y = 339.62, z = 103.25},
      Size = {x = 3.0, y = 3.0, z = 1.0},
      Marker = -1,
      Blip = false,
      Name = _U('service_vh'),
      Type = "vehspawnpt",
      Spawner = 1,
      Heading = 163.5,
      GPS = 0
    },

    VehicleDeletePoint = {
      Pos = {x = 371.86, y = 355.77, z = 101.64},
      Size = {x = 3.0, y = 3.0, z = 1.0},
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
      Pos = {x = 377.89, y = 332.68, z = 102.58},
      Color = {r = 204, g = 204, b = 0},
      Size = {x = 5.0, y = 5.0, z = 3.0},
      Marker = 27,
      Blip = true,
      Name = _U('t_deliver_tobacco_blip'),
      Type = "delivery",
      Spawner = 1,
      Item = {
        {
          name = _U('delivery'),
          time = 500,
          remove = 1,
          max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
          price = 12,
          requires = "cigarett",
          requires_name = _U('t_cigarettes'),
          drop = 100
        }
      },
      Hint = _U('t_deliver_tobacco'),
      GPS = {x = 377.89, y = 332.68, z = 102.58}
    }
  }
}
