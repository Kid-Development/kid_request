if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.getIdentifier(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
   return xPlayer.identifier
end

function Framework.getFullName(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer.getName()
end

function Framework.serverNotify(src, message, _type, time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(message)
end