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
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.ArmurierStations = {

  Armurier = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 8000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 40000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 60000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 50000 },
      { name = 'WEAPON_STUNGUN',          price = 8000 },
      { name = 'WEAPON_FLASHLIGHT',       price = 800 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 300 },
      { name = 'GADGET_PARACHUTE',        price = 2000 },
      { name = 'WEAPON_STICKYBOMB',       price = 800 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 100000 },
      { name = 'WEAPON_FIREWORK',         price = 10000 },
      { name = 'WEAPON_GRENADE',          price = 800 },
      { name = 'WEAPON_BZGAS',            price = 800 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 800 },
      { name = 'WEAPON_APPISTOL',         price = 8000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 60000 },
      { name = 'WEAPON_HEAVYSNIPER',      price = 120000 },
    },

	  AuthorizedVehicles = {
		  { name = 'schafter3',  label = 'Véhicule Civil' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'mesa',       label = 'Tout-Terrain' },
	  },

    Cloakrooms = {
      { x = 0, y = 0, z = 0 },
    },

    Armories = {
      { x = -1303.62, y = -394.75, z = 35.71 },
    },

    Vehicles = {
      {
        Spawner    = { x = 13.40, y = 549.1, z = -175.187 },
        SpawnPoint = { x = 8.237, y = 556.963, z = -175.266 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 26.94, y = 537.76, z = -176.02 },
        SpawnPoint = { x = 3.40, y = 525.56, z = -177.919 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 22.74, y = 545.9, z = -175.027 },
      { x = 21.35, y = 543.3, z = -175.027 },
    },

    BossActions = {
      { x = -1303.33, y = -390.74, z = 35.71 }
    },

  },

}
