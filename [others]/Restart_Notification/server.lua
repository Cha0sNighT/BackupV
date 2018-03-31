-- Made by FAXES
AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svrlist' then
        TriggerClientEvent('RestartList', player)
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 5' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————————— \n LE SERVEUR REDEMARRE DANS 5 MINUTES \n DECONNECTEZ POUR SAUVEGARDER \n ——————————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 10' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————————— \n LE SERVEUR REDEMARRE DANS 10 MINUTES \n FINISSEZ VOTRE ACTION EN COURS \n ——————————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 15' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————————— \n LE SERVEUR REDEMARRE DANS 15 MINUTES \n FINISSEZ VOTRE ACTION EN COURS \n ——————————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)

AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr 30' then --                        <- Command used to display the message          Message displayed server wide.
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————————— \n LE SERVEUR REDEMARRE DANS 30 MINUTES \n ——————————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)


AddEventHandler('chatMessage', function(player, playerName, message)
    if message:sub(1) == '/svr now' then
        TriggerClientEvent("chatMessage", -1, " \n —————————————————————————— \n LE SERVEUR VA REDEMARRER \n RECONNECTEZ VOUS  \n ——————————————————————————", {239, 0, 0})
        CancelEvent()
    end
end)
-- Made by FAXES