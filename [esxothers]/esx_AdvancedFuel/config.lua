petrolCanPrice = 1

--lang = "en"
 lang = "fr"

settings = {}
--settings["en"] = {
--	openMenu = "Press ~g~E~w~ to open the menu.",
--	electricError = "~r~You have an electric vehicle.",
--	fuelError = "~r~You're not in the good place.",
--	buyFuel = "buy fuel",
--	liters = "Gallons",
--	percent = "percent",
--	confirm = "Confirm",
--	fuelStation = "Fuel station",
--	boatFuelStation = "Fuel station | Boat",
--	avionFuelStation = "Fuel station | Plane ",
--	heliFuelStation = "Fuel station | Helicopter",
--	getJerryCan = "Press ~g~E~w~ to buy a jerry can ("..petrolCanPrice.."$)",
--	refeel = "Press ~g~E~w~ to refuel the car.",
--	YouHaveBought = "You have bought ",
--	fuel = " gallons of fuel",
--	price = "price"
--}

settings["fr"] = {
	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
	electricError = "~r~Vous avez une voiture électrique.",
	fuelError = "~r~Vous n'êtes pas au bon endroit.",
	buyFuel = "Faire le plein",
	liters = "Litres",
	percent = "Pourcent",
	confirm = "Valider",
	fuelStation = "Station essence",
	boatFuelStation = "Station d'essence | Bateau",
	avionFuelStation = "Station d'essence | Avions",
	heliFuelStation = "Station d'essence | Hélicoptères",
	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
	YouHaveBought = "Vous avez acheté ",
	fuel = " Litres d'essence",
	price = "Prix"
}


showBar = false
showText = true


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175
hud_y = 0.885

text_x = 0.998
text_y = 0.887


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = false --Random the price of each stations
price = 1 --If random price is on False, set the price here for 1 liter
