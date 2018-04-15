Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 102, g = 0, b = 102 }

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 15 * minute

-- How much time before a menu opens to ask the player if he wants to respawn at hospital now
-- The player is not obliged to select YES, but he will be auto respawn
-- at the end of RespawnDelayAfterRPDeath just above.
Config.RespawnToHospitalMenuTimer   = true
Config.MenuRespawnToHospitalDelay   = 5 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = false
Config.RemoveCashAfterRPDeath       = false
Config.RemoveItemsAfterRPDeath      = false

-- Will display a timer that shows RespawnDelayAfterRPDeath time remaining
Config.ShowDeathTimer               = true

-- Will allow to respawn at any time, don't use RespawnToHospitalMenuTimer at the same time !
Config.EarlyRespawn                 = false
-- The player can have a fine (on bank account)
Config.RespawnFine                  = false
Config.RespawnFineAmount            = 500

Config.Locale                       = 'fr'

Config.Blip = {
  Pos     = { x = 1163.31, y = -1522.9, z = 33.85 },
  Sprite  = 61,
  Display = 4,
  Scale   = 1.0,
  Colour  = 2,
}

Config.HelicopterSpawner = {
  SpawnPoint  = { x = 1218.8, y = -1518.02, z = 33.71 }, -- POINT SPAWN HELICO
  Heading     = 89.6
}

Config.Zones = {

  HospitalInteriorEntering1 = { -- ok
  Pos  = { x = 1150.80, y = -1529.85, z = 34.39 }, -- ENTREE INTERIEUR
  Size = { x = 1.6, y = 1.6, z = 1.0 },
  Type = 27
  },

  HospitalInteriorInside1 = { -- ok
  Pos  = { x = 272.8, y = -1358.8, z = 23.51 }, -- ENTREE INTERIEUR
  Size = { x = 1.5, y = 1.5, z = 1.0 },
  Type = -1
  },

  HospitalInteriorOutside1 = { -- ok
    Pos  = { x = 1120.69, y = -1522.9, z = 33.85 }, --
    Size = { x = 2.5, y = 2.5, z = 1.0 },
    Type = -1,
    Heading = 1.3
  },

  HospitalInteriorExit1 = { -- ok
    Pos  = { x = 275.7, y = -1361.5, z = 23.61 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = 27
  },

  HospitalInteriorEntering2 = { -- Ascenseur aller au toit
  Pos  = { x = 1219.29,  y = -1509.71, z = 33.85 },
  Size = { x = 2.0, y = 2.0, z = 1.0 },
  Type = 27
  },

  HospitalInteriorInside2 = { -- Toit sortie
  Pos  = { x = 1226.73,  y = -1510.74, z = 33.85 },
  Size = { x = 2.0, y = 2.0, z = 1.0 },
  Type = -1
  },

  HospitalInteriorOutside2 = { -- Ascenseur retour depuis toit
    Pos  = { x = -497.121, y = -328.456, z = 33.51 },
    Size = { x = 2.5, y = 2.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorExit2 = { -- Toit entrée
    Pos  = { x = 1226.73,  y = -1510.74, z = 33.85 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = -1
  },

  AmbulanceActions = { -- CLOACKROOM
    Pos  = { x = 268.4, y = -1363.330, z = 23.7 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = 27
  },

  VehicleSpawner = {
    Pos  = { x = 1208.07, y = -1487.66, z = 33.85 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = 27
  },

  VehicleSpawnPoint = {
    Pos  = { x = 1202.89, y = -1492.54, z = 33.7 },
    Size = { x = 2.5, y = 2.5, z = 1.0 },
    Type = -1,
    Heading = 176.5
  },

  VehicleDeleter = {
    Pos  = { x = 1196.93, y = -1492.62, z = 33.7 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = 27
  },

  Pharmacy = {
    Pos  = { x = 230.13, y = -1366.18, z = 38.55 },
    Size = { x = 3.0, y = 3.0, z = 1.0 },
    Type = 27
  },

  ParkingDoorGoOutInside = {
    Pos  = { x = 234.56, y = -1373.77, z = 20.99 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = 27
  },

  ParkingDoorGoOutOutside = {
    Pos  = { x = 1132.65, y = -1597.38, z = 33.74 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInInside = {
    Pos  = { x = 238.64, y = -1368.48, z = 23.54 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInOutside = {
    Pos  = { x = 317.97, y = -1476.13, z = 28.99 },
    Size = { x = 2.0, y = 2.0, z = 1.0 },
    Type = -1
  },

  StairsGoTopTop = {
    Pos  = { x = 251.91, y = -1363.3, z = 38.54 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  StairsGoTopBottom = {
    Pos  = { x = 237.45, y = -1373.89, z = 26.31 },
    Size = { x = 3.5, y = 3.5, z = 0.4 },
    Type = -1
  },

  StairsGoBottomTop = {
    Pos  = { x = 256.58, y = -1357.7, z = 37.31 },
    Size = { x = 3.5, y = 3.5, z = 0.4 },
    Type = -1
  },

  StairsGoBottomBottom = {
    Pos  = { x = 240.94, y = -1369.91, z = 23.54 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  }

}
