Config = {}
Config.DrawDistance = 100.0
Config.EnablePlayerManagement = true
Config.EnableSocietyOwnedVehicles = true
Config.EnableESXIdentity = true
Config.EnableOutfit = true
Config.RequiredCops = 1
Config.RequiredThieves = 1
Config.CooldownOnStealingCar = 48 * 60
Config.AmountOfTimeBlipWillFollowStolenCar = 5*60
Config.EnableCitizenInteraction = true -- Handcuff and search
Config.EnableVehicleInteraction = true -- Pick car lock


Config.Zones = {

  SellCar = {
    Pos   = {x = 103.45, y = 6622.87, z = 31.84},
    Size  = {x = 3.5, y = 3.5, z = 2.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = 36
  },

  CarthiefOptions = {
    Pos   = {x = 994.53, y = -3100.04, z = -39.99},
    Size  = {x = 1.0, y = 1.0, z = 1.0},
    Color = {r = 0, g = 204, b = 0},
    Type  = 1
  },

  StealCarPosition1 = {
    Pos   = {x = -168.000, y = 916.000, z = 234.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1
  },

  StealCarPosition2 = {
    Pos   = {x = -708.000, y = 643.000, z = 154.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1
  },

  StealCarPosition3 = {
    Pos   = {x = -95.000, y = -869.000, z = 25.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1
  },

  StealCarPosition4 = {
    Pos   = {x = 950.000, y = -517.000, z = 59.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1
  },

  StealCheapCarPosition = {
    Pos   = {x = 33.000, y = 6596.000, z = 31.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1
  },

  DropOffPoint = {
    Pos   = {x = 103.45, y = 6622.87, z = 30.84},
    Size  = {x = 0.0, y = 0.0, z = 0.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 36
  },

  DropOffPointCheapCar = {
    Pos   = {x = 136.000, y = -1050.000, z = 29.200},
    Size  = {x = 3.5, y = 3.5, z = 2.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = 36
  },
  VehicleSpawnPoint = {
    Pos  = { x = 1143.47, y = -1295.99, z = 34.65 },
    Size = { x = 2.5, y = 2.5, z = 1.0 },
    Type = -1,
  },

}

Config.Cars = {
  {
    Pos   = {x = -169.200, y = 932.200, z = 234.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1,
    Car   = 'fmj',
    CarName = 'Vapid FMJ',
    Heading = 310.0,
    Value = math.random(15000,25000)
  },
  {
    Pos   = {x = -721.200, y = 647.200, z = 154.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1,
    Car   = 't20',
    CarName = 'Progen T20',
    Heading = 345.0,
    Value = math.random(15000,25000)
  },
  {
    Pos   = {x = -110.200, y = -878.200, z = 29.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1,
    Car   = 'nero',
    WheelType = 5,
    CarName = 'Truffade Nero',
    Heading = 168.0,
    Value = math.random(15000,25000)
  },
  {
    Pos   = {x = 953.200, y = -508.200, z = 61.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1,
    Car   = 'xa21',
    CarName = 'Ocelot XA-21',
    Heading = 31.0,
    Value = math.random(15000,25000)
  },
  {
    Pos   = {x = 33.200, y = 6609.200, z = 33.200},
    Size  = {x = 2.5, y = 2.5, z = 1.0},
    Color = {r = 204, g = 25, b = 25},
    Type  = 1,
    Car   = 'emperor2',
    CarName = 'Emperor',
    Heading = 220.0,
    Value = math.random(500,1500)
  }
}

-- MENU
Config.STRING_VEHICLE_INTERACTION = 'Interaction Véhicule'
Config.STRING_CITIZEN_INTERACTION = 'Interaction Joueur'
Config.STRING_CARTHIEF_MENU_TITLE = 'LS Import'
Config.STRING_SEARCH = 'Fouiller'
Config.STRING_HANDCUFF = 'Menotter'
Config.STRING_PICK_LOCK = 'Crocheter'
Config.STRING_CARTHIEF_INVENTORY = 'Inventaire LS Import'
Config.STRING_AMOUNT = 'Montant'
Config.STRING_INVALID_QUANTITY = 'Quantité Invalide'
Config.STRING_STORE_WEAPON = 'Stocker Arme'
Config.STRING_RETRIEVE_WEAPON = 'Prendre Arme'
Config.STRING_WITHDRAW_ITEM = 'Prendre Objet'
Config.STRING_STORE_ITEM = 'Stocker Objet'
Config.STRING_CONFISCATE_DIRTY_MONEY = 'Confisquer Argent Sale'
Config.STRING_CONFISCATE = 'Confisquer > '
Config.STRING_HAVE_WITHDRAWN = 'Retrait '
Config.STRING_ADDED = 'Ajout '
Config.STRING_OUTFIT = 'Vestiaire'

-- MESSAGES
Config.STRING_NO_PLAYERS_NEARBY = 'Pas de joueur proche'
Config.STRING_VEHICLE_UNLOCKED = 'Véhicule crocheté'
Config.STRING_SELL_VEHICLE_MSG = 'Appuyer sur E pour vendre le véhicule'
Config.STRING_STEAL_VEHICLE_MSG = 'Appuyer sur E pour voler le véhicule'
Config.STRING_ACCESS_INVENTORY_MSG = "Appuyer sur E pour accéder à l'inventaire"
Config.STRING_DELIVER_CAR = 'Livrer la voiture'
Config.STRING_NO_HEAT = "La voiture n'est plus traquée !"
Config.STRING_LOSE_HEAT = 'Fais toi oublier !'
Config.STRING_POLICE_MSG_P1 = 'VOL EN COURS - EMPLACEMENT MARQUE - '
Config.STRING_POLICE_MSG_P2 = ' - IMMATRICULEE '
Config.STRING_SIT_CAR = 'Vous devez être dans la voiture'
Config.STRING_WRONG_VEHICLE = 'Mauvaise voiture'
Config.STRING_INSUFF_POLICE = 'Pas assez de flics en service'
Config.STRING_COOLDOWN_P1 = 'Vous devez attendre '
Config.STRING_COOLDOWN_P2 = ' secondes'
Config.STRING_SOLD_CAR_VALUE = 'Vous avez vendu la voiture pour $'
