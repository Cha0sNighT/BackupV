-- Huge server file.

local interiors = {
	[1] = { ["xe"] = 1889.18, ["ye"] = 3928.03, ["ze"] = 32.41, ["he"] = 321.7075, ["xo"] = 996.82, ["yo"] = -3200.7, ["zo"] = -36.39, ["ho"] = 234.62, ["name"] = 'Labo de Meth'},
	[2] = { ["xe"] = 1930.05, ["ye"] = 4634.93, ["ze"] = 40.47, ["he"] = 357.3, ["xo"] = 1066.15, ["yo"] = -3183.52, ["zo"] = -39.16, ["ho"] = 96.5, ["name"] = 'Labo de Weed'},
	[3] = { ["xe"] = -679.2, ["ye"] = 5834.44, ["ze"] = 17.33, ["he"] = 321.7075, ["xo"] = 1088.6, ["yo"] = -3187.6, ["zo"] = -38.99, ["ho"] = 234.62, ["name"] = 'Labo de Coke'},
	[4] = { ["xe"] = 298.9, ["ye"] = -758.99, ["ze"] = 29.39, ["he"] = 321.7075, ["xo"] = 1173.79, ["yo"] = -3196.51, ["zo"] = -39.01, ["ho"] = 234.62, ["name"] = 'Usine Faux Papiers'},
	[5] = { ["xe"] = 311.381713, ["ye"] = -283.3082, ["ze"] = 54.17509, ["he"] = 73.2703399, ["xo"] = 5.85000, ["yo"] = -709.214, ["zo"] = 16.141017, ["ho"] = 353.802, ["name"] = 'Coffre Fort'},
	[6] = { ["xe"] = 2889.99, ["ye"] = 4391.59, ["ze"] = 49.35, ["he"] = 300, ["xo"] = 1138.13, ["yo"] = -3199.12, ["zo"] = -39.67, ["ho"] = 234.62, ["name"] = 'Blanchisserie'},
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)
