--Truck
Config = {}

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 0



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
  alive_chicken = 2000,
  slaughtered_chicken = 2000,
  packaged_chicken = 300,
  fish = 300,
  stone = 5000,
  washed_stone = 5000,
  copper = 1000,
  iron = 1000,
  gold = 1000,
  diamond = 1000,
  wood = 5000,
  cutted_wood = 5000,
  packaged_plank = 2000,
  petrol = 1000,
  petrol_raffin = 1000,
  essence = 1000,
  whool = 100,
  fabric = 150,
  clothe = 300,
  gazbottle = 1000,
  fixtool = 500,
  carotool = 500,
  blowpipe = 0,
  fixkit = 500,
  carokit = 500,
  bandage = 50,
  medikit = 500,
  bread = 250,
  water = 250,
  weed = 10,
  weed_pooch = 50,
  coke = 10,
  coke_pooch = 50,
  meth = 10,
  meth_pooch = 50,
  opium = 10,
  opium_pooch = 50,
  wine = 75,
  beer = 25,
  vodka = 75,
  chocolate = 30,
  sandwich = 250,
  hamburger = 350,
  tequila = 75,
  whisky = 75,
  cupcake = 30,
  cocacola = 25,
  icetea = 25,
  redbull = 25,
  donuts = 25,
  coffee = 15,
  clip = 250,
  viande = 250,
  cigarett = 1,
  lighter = 100,
  silencieux = 100,
  flashlight = 150,
  grip = 100,
  yusuf = 150,
  jager = 75,
  rhum = 75,
  martini = 75,
  soda = 75,
  jusfruit = 75,
  energy = 75,
  drpepper = 75,
  limonade = 75,
  bolcacahuetes = 150,
  bolnoixcajou = 150,
  bolpistache = 150,
  bolchips = 150,
  saucisson = 250,
  grapperaisin = 300,
  jagerbomb = 75,
  golem = 75,
  whiskycoca = 75,
  vodkaenergy = 75,
  vodkafruit = 75,
  rhumfruit = 75,
  teqpaf = 75,
  rhumcoca = 75,
  mojito = 75,
  ice = 10,
  mixapero = 200,
  metreshooter = 300,
  jagercerbere = 75,
  menthe = 25,
  raisin = 300,
  jus_raisin = 75,
  grand_cru = 75,
  poubelle = 2000,
  cerveau = 1000,
  coeur = 500,
  moelle = 50,
  intestin = 1000,
  os = 200,
  organ_pooch = 20,
  malt = 75,
  melange = 75,
  feuilletabac = 10,
  tabac = 100,
  cproducts = 1000,
  pillz = 10,
  sacbillets = 1000,
  contrat = 100,
  blackberry = 200,
  WEAPON_PISTOL = 1, -- poids pour une munition
  WEAPON_BAT = 2000,
  WEAPON_MICROSMG = 2,
  WEAPON_BALL = 150,
  WEAPON_NIGHTSTICK = 200,
  WEAPON_ASSAULTSMG = 2,
  WEAPON_ASSAULTRIFLE = 2,
  WEAPON_PUMPSHOTGUN = 3,
  WEAPON_STUNGUN = 500,
  WEAPON_FLASHLIGHT = 100,
  WEAPON_FIREEXTINGUISHER = 100,
  GADGET_PARACHUTE = 3000,
  WEAPON_STICKYBOMB = 100,
  WEAPON_SNIPERRIFLE = 5,
  WEAPON_FIREWORK = 100,
  WEAPON_GRENADE = 100,
  WEAPON_BZGAS = 100,
  WEAPON_SMOKEGRENADE = 100,
  WEAPON_APPISTOL = 1,
  WEAPON_CARBINERIFLE = 2,
  WEAPON_HEAVYSNIPER = 6,
  black_money = 0,
}

Config.VehicleLimit = {
  [0] = 30000, --Compact
  [1] = 40000, --Sedan
  [2] = 70000, --SUV
  [3] = 25000, --Coupes
  [4] = 30000, --Muscle
  [5] = 10000, --Sports Classics
  [6] = 5000, --Sports
  [7] = 5000, --Super
  [8] = 5000, --Motorcycles
  [9] = 180000, --Off-road
  [10] = 300000, --Industrial
  [11] = 70000, --Utility
  [12] = 100000, --Vans
  [13] = 0, --Cycles
  [14] = 5000, --Boats
  [15] = 20000, --Helicopters
  [16] = 0, --Planes
  [17] = 40000, --Service
  [18] = 40000, --Emergency
  [19] = 0, --Military
  [20] = 300000, --Commercial
  [21] = 0, --Trains
}
