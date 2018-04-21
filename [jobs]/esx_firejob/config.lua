Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = false -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.FireStations = {

  LSFD = {
    Blip = {
      Pos = { x = 1202.7244873047, y = -1463.0455322266, z = 34.849590301514 },
      Sprite  = 436,
      Display = 4,
      Scale   = 1,
      Colour  = 1,
    },

    AuthorizedWeapons = {
      {name = 'WEAPON_FIREEXTINGUISHER', price = 120},
    },

    AuthorizedVehicles = {
      {name = 'ambulance2' , label = 'Ambulance'},
      {name = 'firetruk', label = 'Camion'},
    },

    Cloakrooms = {
      { x = 1192.637, y = -1474.431, z = 33.903 }
    },

    Armories = {
      { x = 1194.7569580078, y = -1478.9689941406, z = 33.869531402588 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1196.3173828125, y = -1462.1235351563, z = 33.832658538818 },
        SpawnPoint = { x = 1200.7666015625, y = -1456.6851806641, z = 34.94176651001 },
        Heading    = 359.68
      }
    },

    Helicopters = {
      {
        Spawner    = {x = 466.477, y = -982.819, z = 42.701},
        SpawnPoint = {x = 450.04, y = -981.14, z = 42.701},
        Heading    = 0.0
      }
    },

    VehicleDeleters = {
      { x = 1221.260, y = -1518.321, z = 33.702 },
    },

    BossActions = {
      { x = 1209.4600830078, y = -1480.7308349609, z = 33.869531402588 },
    }
  }
}