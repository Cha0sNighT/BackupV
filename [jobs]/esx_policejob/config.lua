Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.0, y = 1.0, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

  LSPD = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 0.9,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',           price = 200 },
      { name = 'WEAPON_COMBATPISTOL',         price = 300 },
      { name = 'WEAPON_SMG',                  price = 1250 },
      { name = 'WEAPON_CARBINERIFLE',         price = 1500 },
      { name = 'WEAPON_HEAVYSNIPER',          price = 3000},
      { name = 'WEAPON_PUMPSHOTGUN',          price = 600 },
      { name = 'WEAPON_STUNGUN',              price = 500 },
      { name = 'WEAPON_FLASHLIGHT',           price = 80 },
      { name = 'WEAPON_FIREEXTINGUISHER',     price = 120 },
      { name = 'WEAPON_FLAREGUN',             price = 60 },
      { name = 'WEAPON_STICKYBOMB',           price = 250 },
      { name = 'GADGET_PARACHUTE',            price = 300 },
    },

    AuthorizedVehicles = {
      { name = 'scorcher',      label = 'Vélo de patrouille' },
      { name = 'police7',       label = 'Véhicule de Cadet' },
      { name = 'police4',       label = "Véhicule d'officier" },
      { name = 'police3',       label = 'Véhicule Sergent' },
      { name = 'police2',       label = 'Véhicule Sergent Chef' },
      { name = 'policeb',       label = 'Moto' },
      { name = 'policet',       label = 'Van de transport' },
      { name = 'rmodpolice',    label = 'Autoroute' },
      { name = 'polchiron',     label = 'Autoroute 2' },
      { name = 'fbi',           label = 'Banalisée' },
      { name = 'fbi2',          label = 'SUV banalisé' },
      { name = 'riot',          label = 'Anti Emeutes' },
      { name = 'riot2',          label = 'Bus Anti Emeutes' },
    },

    Cloakrooms = {
      { x = 452.600, y = -993.306, z = 29.8 },
    },

    Armories = {
      { x = 460.48, y = -981.1, z = 29.70 },
    },

    Vehicles = {
      {
        Spawner    = { x = 454.69, y = -1017.4, z = 27.480 },
        SpawnPoint = { x = 438.42, y = -1018.3, z = 27.757 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
        SpawnPoint = { x = 449.28, y = -982.28, z = 44.40 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 462.74, y = -1014.4, z = 27.115 },
      { x = 462.40, y = -1019.7, z = 27.154 },
    },

    BossActions = {
      { x = 448.417, y = -973.208, z = 29.739 }
    },

  },

}
