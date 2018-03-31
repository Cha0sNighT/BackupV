local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PID = 0
local GUI = {}
ESX = nil
GUI.Time = 0
local PlayerData = {}
local GUI = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local KartingStartTimer = false
local RaceStarted = false



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.TriggerServerCallback("esx_karting:getSteamId", function(steamId)
  SteamID = steamId
end)
end)

function isSteamIdInList(psteamId)

local steamIdIsFound = false
for i = 1, #Config.SteamID, 1 do
  if Config.SteamID[i] == psteamId then
    return true
  end
end
return false
end

Citizen.CreateThread(function()
while ESX == nil do
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.Wait(0)
end
end)

AddEventHandler('esx_various:hasEnteredMarker', function(zone)

ESX.UI.Menu.CloseAll()

for i = 1, #Config.RedKart, 1 do
if zone == 'RedKart' .. i and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
  CurrentAction = 'red_kart_create'
  CurrentActionMsg = _U('press_red')
  CurrentActionData = {}
end
end

for i = 1, #Config.BlueKart, 1 do
if zone == 'BlueKart' .. i and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
  CurrentAction = 'blue_kart_create'
  CurrentActionMsg = _U('press_blue')
  CurrentActionData = {}
end
end

for i = 1, #Config.Cloakroom, 1 do
if zone == 'Cloakroom' .. i and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
  CurrentAction = 'cloakroom_kart'
  CurrentActionMsg = _U('press_cloakroom')
  CurrentActionData = {}
end
end

for i = 1, #Config.Finish, 1 do
if zone == 'Finish' .. i and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
  CurrentAction = 'finish'
  CurrentActionMsg = ''
  CurrentActionData = {vehicle = vehicle}
end
end

end)

AddEventHandler('esx_various:hasExitedMarker', function(zone)

CurrentAction = nil
ESX.UI.Menu.CloseAll()

end)

function BlueKartCreate()

if KartingStartTimer then
local essence = math.random(80, 100)
local playerPed = GetPlayerPed(-1)
local model = "kart3"

RequestModel(model)
while not HasModelLoaded(model) do
  Citizen.Wait(1)
end

DoScreenFadeOut(800)
Wait(1000)
BlueKart = CreateVehicle(model, GetEntityCoords(playerPed, false), 193.8983, true, false)
TaskWarpPedIntoVehicle(playerPed, BlueKart, - 1)
DoScreenFadeIn(800)
TriggerEvent("advancedFuel:setEssence", essence, GetVehicleNumberPlateText(BlueKart), GetDisplayNameFromVehicleModel(GetEntityModel(BlueKart)))
FreezeEntityPosition(BlueKart, true)
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20.0)

if Config.EnableSociety then
  TriggerServerEvent('esx_karting:pay')
end

else
ESX.ShowNotification(_U'starttime')
end

end


function RedKartCreate()

if KartingStartTimer then
local essence = math.random(80, 100)
local playerPed = GetPlayerPed(-1)
local model = "kart20"

RequestModel(model)
while not HasModelLoaded(model) do
  Citizen.Wait(1)
end


DoScreenFadeOut(800)
Wait(1000)
RedKart = CreateVehicle(model, GetEntityCoords(playerPed, false), 193.8983, true, false)
DoScreenFadeIn(800)
TaskWarpPedIntoVehicle(playerPed, RedKart, - 1)
TriggerEvent("advancedFuel:setEssence", essence, GetVehicleNumberPlateText(RedKart), GetDisplayNameFromVehicleModel(GetEntityModel(RedKart)))
FreezeEntityPosition(RedKart, true)
SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20.0)
if Config.EnableSociety then
  TriggerServerEvent('esx_karting:pay')
end

else
ESX.ShowNotification(_U'starttime')
end
end


function Cloakroom()

ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(account)
Citizen.Trace(account)
local elements = {
  {label = _U('start_race'), value = 'start_race'},
  {label = _U('cloakroom_solo'), value = 'cloakroom_solo'},
  {label = _U('cloakroom_kart'), value = 'cloakroom_kart'},
  {label = _U('cloakroom_civil'), value = 'cloakroom_civil'},
  {label = _U('finatime'), value = 'finaltime'},
}

--      if isSteamIdInList(SteamID) then
table.insert(elements, {label = '<span style="color:red;"><----------------------- Gestion ----------------------->',   value = nil,})
table.insert(elements, {label = '<span style="color:blue;">Solde : <span style="color:green;">' .. account .. ' $', value = nil, })
table.insert(elements, {label = _U('remove'), value = "remove_solde", })
table.insert(elements, {label = _U('deposit'), value = "deposit", })
if not Config.EnableSociety then
  table.insert(elements, {label = '<span style="color:red;">Vous devez activer la gestion societé', value = nil, })
end
--      end

ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'accountant_actions',
  {
    title = _U('Menu'),
    elements = elements
  },
  function(data, menu)

    if data.current.value == 'start_race' then
      KartingStartTimer = true
      ESX.ShowNotification(_U('Time') .. Config.secondsRemaining .. _U('Time2'))
    end

    if data.current.value == 'cloakroom_solo' then
      TriggerEvent('skinchanger:getSkin', function(skin)
        ESX.TriggerServerCallback('esx_helmet:getHelmet', function(hasHelmet, helmetSkin)
        if hasHelmet then
          TriggerEvent('skinchanger:loadClothes', skin, {
            helmet_1 = helmetSkin.helmet_1,
            helmet_2 = helmetSkin.helmet_2
          })
          local player = GetPlayerPed(-1)
          SetPedPropIndex(player, 1, - 1, 0, 0)
          ClearPedProp(player, 2)
        else
          ESX.ShowNotification(_U('no_helmet'))
        end
      end)
    end)
  end

  if data.current.value == 'cloakroom_kart' then
    ByHelmet()
  end

  if data.current.value == 'cloakroom_civil' then
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
      TriggerEvent('skinchanger:loadSkin', skin)
    end)
  end

  if data.current.value == 'finaltime' then
    ESX.ShowNotification(_U('yourlastetime') .. finaltime .. _U('seconde'))
  end

  if data.current.value == 'remove_solde' then
    menu.close()

    ESX.UI.Menu.Open(
      'dialog', GetCurrentResourceName(), 'remove_solde',
      {
        title = _U('amount_number')
      },
      function(data2, menu)

        local amount = tonumber(data2.value)

        if amount == nil then
          ESX.ShowNotification(_U('invalid_amount'))
        else

          menu.close()
          TriggerServerEvent('esx_karting:remove_solde', amount)
          Wait(500)
          Cloakroom()

        end

      end,
      function(data2, menu)
        menu.close()
      end
    )

  end

  if data.current.value == 'deposit' then
    menu.close()

    ESX.UI.Menu.Open(
      'dialog', GetCurrentResourceName(), 'remove_solde',
      {
        title = _U('amount_number')
      },
      function(data2, menu)

        local amount = tonumber(data2.value)

        if amount == nil then
          ESX.ShowNotification(_U('invalid_amount'))
        else

          menu.close()
          TriggerServerEvent('esx_karting:deposit', amount)
          Wait(500)
          Cloakroom()

        end

      end,
      function(data2, menu)
        menu.close()
      end
    )

  end


end,
function(data, menu)
  menu.close()
end
)
end, 'karting')
end


function DrawTextCentre(text)

SetTextFont(4)
SetTextProportional(0)
SetTextScale(0.0, 1.0)
SetTextColour(255, 255, 255, 255)
SetTextDropshadow(0, 0, 0, 0, 255)
SetTextEdge(1, 0, 0, 0, 255)
SetTextDropShadow()
SetTextOutline()
SetTextEntry("STRING")
AddTextComponentString(text)
SetTextCentre(true)
DrawText(0.5, 0.5)

end

function ByHelmet()
TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

menu.close()

end, function(data, menu)

menu.close()

CurrentAction = 'shop_menu'
CurrentActionMsg = _U('press_access')
CurrentActionData = {}

end, {
  'helmet_1',
  'helmet_2',
})
end


Citizen.CreateThread(function()
while true do

Wait(0)

local coords = GetEntityCoords(GetPlayerPed(-1))

for k, v in pairs(Config.Zones) do
  if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
  end
end
end
end)


Citizen.CreateThread(function()
while true do

Wait(0)

local coords = GetEntityCoords(GetPlayerPed(-1))
local isInMarker = false
local currentZone = nil

for k, v in pairs(Config.Zones) do
if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x / 2) then
  isInMarker = true
  currentZone = k
end
end

if isInMarker and not HasAlreadyEnteredMarker then
HasAlreadyEnteredMarker = true
LastZone = currentZone
TriggerEvent('esx_various:hasEnteredMarker', currentZone)
end

if not isInMarker and HasAlreadyEnteredMarker then
HasAlreadyEnteredMarker = false
TriggerEvent('esx_various:hasExitedMarker', LastZone)
end
end
end)


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
if KartingStartTimer then
Citizen.Wait(1000)
Config.secondsRemaining = Config.secondsRemaining - 1
if Config.secondsRemaining <= 0 and not RaceStarted then
DrawTextCentre('~g~~h~GO')
FreezeEntityPosition(BlueKart, false)
FreezeEntityPosition(RedKart, false)
RaceStarted = true
end
end
end
end)


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
if CurrentAction ~= nil then
SetTextComponentFormat('STRING')
AddTextComponentString(CurrentActionMsg)
DisplayHelpTextFromStringLabel(0, 0, 1, - 1)
if IsControlJustReleased(0, 38) then

if CurrentAction == 'cloakroom_kart' and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
Cloakroom()
end

if CurrentAction == 'blue_kart_create' and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
BlueKartCreate()
end

if CurrentAction == 'red_kart_create' and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
RedKartCreate()
end

CurrentAction = nil
end
end
end
end)


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
if CurrentAction ~= nil then
SetTextComponentFormat('STRING')
AddTextComponentString(CurrentActionMsg)
DisplayHelpTextFromStringLabel(0, 0, 1, - 1)

if CurrentAction == 'finish' then
local playerPed = GetPlayerPed(-1)
local vehicle = GetVehiclePedIsIn(playerPed, false)
finaltime = math.floor(Config.secondsRemaining * - 1 )

if IsPedInAnyVehicle(playerPed, false) and RaceStarted then
ESX.Game.DeleteVehicle(vehicle)
KartingStartTimer = false
RaceStarted = false
Config.secondsRemaining = 60
ESX.ShowNotification(_U('yourtime') .. finaltime .. _U('seconde'))
TriggerServerEvent('esx_karting:logs', finaltime)
end
end
end

if KartingStartTimer and not RaceStarted then
DrawTextCentre(_U('start') .. Config.secondsRemaining .. _U('seconde'))
end

end
end)

Citizen.CreateThread(function()
local blip = AddBlipForCoord(1741.8509521484, 3296.2543945313, 41.127906799316)
SetBlipSprite (blip, 38)
SetBlipDisplay(blip, 4)
SetBlipScale (blip, 1.0)
SetBlipColour (blip, 5)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(_U'Menu')
EndTextCommandSetBlipName(blip)
end)
