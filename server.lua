local playerCount = 0

AddEventHandler('playerConnecting', function()
    playerCount = playerCount + 1
    TriggerClientEvent('nexgen-rpc:PlayerCount', -1, playerCount)
end)

AddEventHandler('playerDropped', function(reason)
    playerCount = playerCount - 1
    if playerCount < 0 then playerCount = 0 end
    TriggerClientEvent('nexgen-rpc:PlayerCount', -1, playerCount)
end)

RegisterNetEvent('nexgen-rpc:UpdatePlayerCount')
AddEventHandler('nexgen-rpc:UpdatePlayerCount', function()
    TriggerClientEvent('nexgen-rpc:PlayerCount', source, playerCount)
end)
