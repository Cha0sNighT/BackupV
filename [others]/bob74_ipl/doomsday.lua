local xnmark = xnmark or {}
local distance = 50.5999

xnmark.locations = {
  ["Doomsday Finale"] = {
    ["markin"] = { - 360.8825378418, 4826.5556640625, 143.14414978028},
    ["markout"] = {1256.2868652344, 4798.3833007812, - 39.471000671386},
    ["locin"] = {1259.5418701172, 4812.1196289062, - 39.77448272705, 344.82873535156},
    ["locout"] = { - 353.65161132812, 4815.8237304688, 142.7413635254},
  },
  ["Doomsday Silo"] = {
    ["markin"] = {598.3062133789, 5556.9243164062, - 716.76141357422}, -- Not Used
    ["markout"] = {369.55322265625, 6319.6455078125, - 159.92749023438},
    ["locin"] = {369.46231079102, 6319.7626953125, - 659.92739868164}, -- Not Used
    ["locout"] = {602.27032470704, 5546.9267578125, 716.38928222656, 246.04162597656},
  },
  ["Doomsday Facility"] = {
    ["markin"] = {1286.9239501954, 2845.8833007812, 49.394256591796},
    ["markout"] = {489.0622253418, 4785.3623046875, - 58.929149627686},
    ["locin"] = {483.2006225586, 4810.5405273438, - 58.919288635254, 18.04705619812},
    ["locout"] = {1267.4091796875, 2830.9741210938, 48.444499969482, 128.1668395996},
  },
  ["IAA Facility"] = {
    ["markin"] = {2049.8181152344, 2949.5847167968, 47.735733032226},
    ["markout"] = {2155.0627441406, 2921.0417480468, - 61.902416229248},
    ["locin"] = {2151.1369628906, 2921.3303222656, - 61.901874542236, 85.827827453614},
    ["locout"] = {2053.8020019532, 2953.4047851562, 47.664855957032, 354.8461303711},
  },
  ["IAA Server"] = {
    ["markin"] = {2477.6774902344, - 402.14556884766, 94.817413330078},
    ["markout"] = {2154.7639160156, 2921.0678710938, - 81.075424194336},
    ["locin"] = {2158.1184082032, 2920.9382324218, - 81.075386047364, 270.48007202148},
    ["locout"] = {2482.9174804688, - 405.25631713868, 93.735389709472, 318.76651000976},
  },
  ["Doomsday Sub"] = {
    ["markin"] = {493.83395385742, - 3222.7514648438, 10.49820137024},
    ["markout"] = {514.42980957032, 4888.4028320312, - 62.589431762696},
    ["locin"] = {514.29266357422, 4885.8706054688, - 62.589862823486, 180.25909423828},
    ["locout"] = {496.30267333984, - 3222.6359863282, 6.0695104599, 270.0},
  },
}

function TeleportIntoInterior(locationdata, ent)
  local x, y, z, h = table.unpack(locationdata)
  DoScreenFadeOut(1000)
  while IsScreenFadingOut() do Citizen.Wait(0) end
  NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
  Wait(1000)
  SetEntityCoords(GetPlayerPed(-1), x, y, z)
  SetEntityHeading(GetPlayerPed(-1), h)
  NetworkFadeInEntity(GetPlayerPed(-1), 0)
  Wait(1000)
  FreezeEntityPosition(PlayerPedId(), false)
  SetGameplayCamRelativeHeading(0.0)
  DoScreenFadeIn(1000)
  while IsScreenFadingIn() do Citizen.Wait(0) end
end

function TeleportIntoInteriorVehicle(locationdata, ent)
  local x, y, z, h = table.unpack(locationdata)
  DoScreenFadeOut(1000)
  while IsScreenFadingOut() do Citizen.Wait(0) end
  NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
  Wait(1000)
  SetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), x, y, z)
  SetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false), h)
  NetworkFadeInEntity(GetPlayerPed(-1), 0)
  Wait(1000)
  FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
  SetGameplayCamRelativeHeading(0.0)
  DoScreenFadeIn(1000)
  while IsScreenFadingIn() do Citizen.Wait(0) end
end

function SpawnFacility()
  interiorID = GetInteriorAtCoordsWithType(345.0041, 4842.001, - 59.9997, "xm_x17dlc_int_02")

  if IsValidInterior(interiorID) then
    EnableInteriorProp(interiorID, "set_int_02_decal_01")
    EnableInteriorProp(interiorID, "set_int_02_lounge1")
    EnableInteriorProp(interiorID, "set_int_02_cannon")
    EnableInteriorProp(interiorID, "set_int_02_clutter1")
    EnableInteriorProp(interiorID, "set_int_02_crewemblem")
    EnableInteriorProp(interiorID, "set_int_02_shell")
    EnableInteriorProp(interiorID, "set_int_02_security")
    EnableInteriorProp(interiorID, "set_int_02_sleep")
    EnableInteriorProp(interiorID, "set_int_02_trophy1")
    EnableInteriorProp(interiorID, "set_int_02_paramedic_complete")
    EnableInteriorProp(interiorID, "set_Int_02_outfit_paramedic")
    EnableInteriorProp(interiorID, "set_Int_02_outfit_serverfarm")
    SetInteriorPropColor(interiorID, "set_int_02_decal_01", 1)
    SetInteriorPropColor(interiorID, "set_int_02_lounge1", 1)
    SetInteriorPropColor(interiorID, "set_int_02_cannon", 1)
    SetInteriorPropColor(interiorID, "set_int_02_clutter1", 1)
    SetInteriorPropColor(interiorID, "set_int_02_shell", 1)
    SetInteriorPropColor(interiorID, "set_int_02_security", 1)
    SetInteriorPropColor(interiorID, "set_int_02_sleep", 1)
    SetInteriorPropColor(interiorID, "set_int_02_trophy1", 1)
    SetInteriorPropColor(interiorID, "set_int_02_paramedic_complete", 1)
    SetInteriorPropColor(interiorID, "set_Int_02_outfit_paramedic", 1)
    SetInteriorPropColor(interiorID, "set_Int_02_outfit_serverfarm", 1)
    RefreshInterior(interiorID)
  end
end

function DespawnFacility()
  interiorID = GetInteriorAtCoordsWithType(345.0041, 4842.001, - 59.9997, "xm_x17dlc_int_02")

  DisableInteriorProp(interiorID, "set_int_02_decal_01")
  DisableInteriorProp(interiorID, "set_int_02_lounge1")
  DisableInteriorProp(interiorID, "set_int_02_cannon")
  DisableInteriorProp(interiorID, "set_int_02_clutter1")
  DisableInteriorProp(interiorID, "set_int_02_crewemblem")
  DisableInteriorProp(interiorID, "set_int_02_shell")
  DisableInteriorProp(interiorID, "set_int_02_security")
  DisableInteriorProp(interiorID, "set_int_02_sleep")
  DisableInteriorProp(interiorID, "set_int_02_trophy1")
  DisableInteriorProp(interiorID, "set_int_02_paramedic_complete")
  DisableInteriorProp(interiorID, "Set_Int_02_outfit_paramedic")
  DisableInteriorProp(interiorID, "Set_Int_02_outfit_serverfarm")
end


Citizen.CreateThread(function()
  while true do
  Citizen.Wait(0)
  if not IsEntityDead(PlayerPedId(-1)) then
    for k, v in pairs(xnmark.locations) do

      local ix, iy, iz = table.unpack(v["markin"])
      local ox, oy, oz = table.unpack(v["markout"])

      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 50.5999 then -- Outside Marker
        DrawMarker(-1, ix, iy, iz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.75, 0.75, 0.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 1.0 then
          if k == "Doomsday Facility" then
            if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
              FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
              TeleportIntoInteriorVehicle(v["locin"], false)
              SpawnFacility()
            else
              FreezeEntityPosition(PlayerPedId(), true)
              SpawnFacility()
              TeleportIntoInterior(v["locin"], false)
            end
          elseif k == "Doomsday Finale" then
            if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
              FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
              TeleportIntoInteriorVehicle(v["locin"], false)
            else
              FreezeEntityPosition(PlayerPedId(), true)
              TeleportIntoInterior(v["locin"], false)
            end
          else
            FreezeEntityPosition(PlayerPedId(), true)
            TeleportIntoInterior(v["locin"], false)
          end
        end
      end

      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 50.5999 then -- Inside Marker
        DrawMarker(2, ox, oy, oz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.75, 0.75, 0.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 1.0 then
          if k == "Doomsday Facility" then
            if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
              FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
              TeleportIntoInteriorVehicle(v["locout"], false)
              DespawnFacility()
            else
              FreezeEntityPosition(PlayerPedId(), true)
              TeleportIntoInterior(v["locout"], false)
              DespawnFacility()
            end
          elseif k == "Doomsday Finale" then
            if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
              FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
              TeleportIntoInteriorVehicle(v["locout"], false)
            else
              FreezeEntityPosition(PlayerPedId(), true)
              TeleportIntoInterior(v["locout"], false)
            end
          else
            FreezeEntityPosition(PlayerPedId(), true)
            TeleportIntoInterior(v["locout"], false)
          end
        end
      end

    end
  end
end
end)
