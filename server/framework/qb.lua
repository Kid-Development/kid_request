if not Framework.QBCore() then return end

local QBCore = exports['rep-core']:GetCoreObject()

function Framework.getIdentifier(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
   return xPlayer.PlayerData.citizenid
end

function Framework.getFullName(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    return xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
end

function Framework.serverNotify(src, message, _type, time)
    TriggerClientEvent('QBCore:Notify', src, message, 'error', _type, time)
end

