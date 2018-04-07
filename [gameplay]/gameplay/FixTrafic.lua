--[[
----------------------------------------------------------------------------
____________________________________________________________________________

                        AUTHOR : ReedY

            Régule le trafic pnj
            FixTrafic - double cars


____________________________________________________________________________

---------------------------------------------------------------------------
]]--

Citizen.CreateThread(function()
    while true
        do
            -- 1.
        SetVehicleDensityMultiplierThisFrame(0.5)
        --SetPedDensityMultiplierThisFrame(0.0)
        --SetRandomVehicleDensityMultiplierThisFrame(0.0)
        --SetParkedVehicleDensityMultiplierThisFrame(0.0)
        --SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

        --local playerPed = GetPlayerPed(-1)
        --local pos = GetEntityCoords(playerPed)
        --RemoveVehiclesFromGeneratorsInArea(pos['x'] - 900.0, pos['y'] - 900.0, pos['z'] - 900.0, pos['x'] + 900.0, pos['y'] + 900.0, pos['z'] + 900.0);


        -- 2.
        --SetGarbageTrucks(0)
        --SetRandomBoats(0)
        --SetRandomBus(0)
        Citizen.Wait(1)
    end

end)
