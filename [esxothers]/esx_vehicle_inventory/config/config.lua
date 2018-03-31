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
  alive_chicken = 0,
  slaughtered_chicken = 0,
  packaged_chicken = 0,
  fish = 0,
  stone = 0,
  washed_stone = 0,
  copper = 0,
  iron = 0,
  gold = 0,
  diamond = 0,
  wood = 0,
  cutted_wood = 0,
  packaged_plank = 0,
  petrol = 0,
  petrol_raffin = 0,
  essence = 0,
  whool = 0,
  fabric = 0,
  clothe = 0,
  gazbottle = 0,
  fixtool = 0,
  carotool = 0,
  blowpipe = 0,
  fixkit = 0,
  carokit = 0,
  bandage = 0,
  medikit = 0,
  bread = 0,
  water = 0,
  weed = 0,
  weed_pooch = 0,
  coke = 0,
  coke_pooch = 0,
  meth = 0,
  meth_pooch = 0,
  opium = 0,
  opium_pooch = 0,
  wine = 0,
  beer = 0,
  vodka = 0,
  chocolate = 0,
  sandwich = 0,
  hamburger = 0,
  tequila = 0,
  whisky = 0,
  cupcake = 0,
  cocacola = 0,
  icetea = 0,
  redbull = 0,
  donuts = 0,
  coffee = 0,
  clip = 0,
  viande = 0,
  cigarett = 0,
  lighter = 0,
  silencieux = 0,
  flashlight = 0,
  grip = 0,
  yusuf = 0,
  jager = 0,
  rhum = 0,
  martini = 0,
  soda = 0,
  jusfruit = 0,
  energy = 0,
  drpepper = 0,
  limonade = 0,
  bolcacahuetes = 0,
  bolnoixcajou = 0,
  bolpistache = 0,
  bolchips = 0,
  saucisson = 0,
  grapperaisin = 0,
  jagerbomb = 0,
  golem = 0,
  whiskycoca = 0,
  vodkaenergy = 0,
  vodkafruit = 0,
  rhumfruit = 0,
  teqpaf = 0,
  rhumcoca = 0,
  mojito = 0,
  ice = 0,
  mixapero = 0,
  metreshooter = 0,
  jagercerbere = 0,
  menthe = 0,
  raisin = 0,
  jus_raisin = 0,
  grand_cru = 0,
  poubelle = 0,
  cerveau = 0,
  coeur = 0,
  moelle = 0,
  intestin = 0,
  os = 0,
  organ_pooch = 0,
  malt = 0,
  melange = 0,
  feuilletabac = 0,
  tabac = 0,
  cproducts = 0,
  pillz = 0,
  sacbillets = 0,
  contrat = 0,
  blackberry = 0,
  WEAPON_PISTOL = 0, -- poids pour une munition
  WEAPON_BAT = 0,
  WEAPON_MICROSMG = 0,
  WEAPON_BALL = 0,
  WEAPON_NIGHTSTICK = 0,
  WEAPON_ASSAULTSMG = 0,
  WEAPON_ASSAULTRIFLE = 0,
  WEAPON_PUMPSHOTGUN = 0,
  WEAPON_STUNGUN = 0,
  WEAPON_FLASHLIGHT = 0,
  WEAPON_FIREEXTINGUISHER = 0,
  GADGET_PARACHUTE = 0,
  WEAPON_STICKYBOMB = 0,
  WEAPON_SNIPERRIFLE = 0,
  WEAPON_FIREWORK = 0,
  WEAPON_GRENADE = 0,
  WEAPON_BZGAS = 0,
  WEAPON_SMOKEGRENADE = 0,
  WEAPON_APPISTOL = 0,
  WEAPON_CARBINERIFLE = 0,
  WEAPON_HEAVYSNIPER = 0,
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
