-- Huge server file.

local interiors = {
	[1] = { ["xe"] = -227.92, ["ye"] = 6333.55, ["ze"] = 31.43, ["he"] = 137.5, ["xo"] = 996.82, ["yo"] = -3200.7, ["zo"] = -36.39, ["ho"] = 234.62, ["name"] = 'Labo de Meth'}, --04/04/18
	[2] = { ["xe"] = 387.62, ["ye"] = 3584.83, ["ze"] = 32.30, ["he"] = 347.3, ["xo"] = 1066.15, ["yo"] = -3183.52, ["zo"] = -39.16, ["ho"] = 96.5, ["name"] = 'Labo de Weed'}, --04/04/18
	[3] = { ["xe"] = 1441.24, ["ye"] = 1137.89, ["ze"] = 113.34, ["he"] = 100.0, ["xo"] = 1088.6, ["yo"] = -3187.6, ["zo"] = -38.99, ["ho"] = 234.62, ["name"] = 'Labo de Coke'}, --04/04/48
	[4] = { ["xe"] = 1269.008, ["ye"] = -1710.82, ["ze"] = 53.78, ["he"] = 25.2, ["xo"] = 1173.79, ["yo"] = -3196.51, ["zo"] = -39.01, ["ho"] = 234.62, ["name"] = 'Usine Faux Papiers'}, --04/04/48
	[5] = { ["xe"] = 311.381713, ["ye"] = -283.3082, ["ze"] = 54.17509, ["he"] = 73.2703399, ["xo"] = 5.85000, ["yo"] = -709.214, ["zo"] = 16.141017, ["ho"] = 353.802, ["name"] = 'Coffre Fort'},
	[6] = { ["xe"] = 1723.13, ["ye"] = 6417.86, ["ze"] = 34.5, ["he"] = 66.9, ["xo"] = 1138.13, ["yo"] = -3199.12, ["zo"] = -39.67, ["ho"] = 234.62, ["name"] = 'Blanchisserie'},
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)
