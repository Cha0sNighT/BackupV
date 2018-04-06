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
Config.RemoveCashAfterRPDeath       = true
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
  Pos     = { x = -448.577, y = -340.822, z = 34.50 },
  Sprite  = 61,
  Display = 4,
  Scale   = 1.0,
  Colour  = 2,
}

Config.HelicopterSpawner = {
  SpawnPoint  = { x = -491.973, y = -336.549, z = 94.71 }, -- POINT SPAWN HELICO
  Heading     = 0.0
}

Config.Zones = {

  HospitalInteriorEntering1 = { -- ok
    Pos  = { x = -448.577, y = -340.822, z = 33.51 }, -- ENTREE PRINCIPALE
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  HospitalInteriorInside1 = { -- ok
    Pos  = { x = 272.8, y = -1358.8, z = 23.51 }, -- ENTREE INTERIEUR
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorOutside1 = { -- ok
    Pos  = { x = -449.063, y = -348.068, z = 33.51 }, --
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorExit1 = { -- ok
    Pos  = { x = 275.7, y = -1361.5, z = 23.61 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  HospitalInteriorEntering2 = { -- Ascenseur aller au toit
    Pos  = { x = -498.722, y = -335.584, z = 33.51},
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  HospitalInteriorInside2 = { -- Toit sortie
    Pos  = { x = -492.772,  y = -342.014, z = 93.67 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorOutside2 = { -- Ascenseur retour depuis toit
    Pos  = { x = -497.121, y = -328.456, z = 33.51 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  HospitalInteriorExit2 = { -- Toit entrée
    Pos  = { x = -490.804,  y = -326.167, z = 93.67 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  AmbulanceActions = { -- CLOACKROOM
    Pos  = { x = 268.4, y = -1363.330, z = 23.7 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  VehicleSpawner = {
    Pos  = { x = -498.159, y = -342.732, z = 33.51 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  VehicleSpawnPoint = {
    Pos  = { x = -489.851, y = -342.691, z = 34.37 },
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  VehicleDeleter = {
    Pos  = { x = -491.969, y = -336.559, z = 33.39 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  Pharmacy = {
    Pos  = { x = 230.13, y = -1366.18, z = 38.55 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  ParkingDoorGoOutInside = {
    Pos  = { x = 234.56, y = -1373.77, z = 20.99 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
  },

  ParkingDoorGoOutOutside = {
    Pos  = { x = 320.98, y = -1478.62, z = 28.82 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInInside = {
    Pos  = { x = 238.64, y = -1368.48, z = 23.54 },
    Size = { x = 1.5, y = 1.5, z = 1.5 },
    Type = -1
  },

  ParkingDoorGoInOutside = {
    Pos  = { x = 317.97, y = -1476.13, z = 28.99 },
    Size = { x = 1.0, y = 1.0, z = 1.0 },
    Type = 27
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
