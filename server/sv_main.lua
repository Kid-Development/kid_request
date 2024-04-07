local waitingConfirm = {}

local function IsPlayerOnline(playerId)
	playerId = tostring(playerId)
	for _, src in ipairs(GetPlayers()) do
		if playerId == src then
			return true
		end
	end
	return false
end

AddEventHandler("playerDropped", function(reason)
    if waitingConfirm[source] then
        TriggerClientEvent('kid_request:client:recieveAnswerRequestConfirm', waitingConfirm[source].from, false)
        waitingConfirm[source] = nil
    end
end)

lib.callback.register('kid_request:callback:sendRequest', function(source, targetId, title, message, acpButton, cancelButton)
    local src = source
    if IsPlayerOnline(targetId) then
        if not waitingConfirm[targetId] then
            waitingConfirm[targetId] = {
                from = source
            }
            TriggerClientEvent('kid_request:client:sendRequest', targetId, src, title, message, acpButton, cancelButton)
            if Config.Name == 'fullname' then
                Framework.serverNotify(targetId, Lang.notify.sent:format(Framework.getFullName(src)))
            elseif Config.Name == 'citizendid' then
                Framework.serverNotify(targetId, Lang.notify.sent:format(Framework.getIdentifier(src)))
            elseif Config.Name == 'server-id' then
                Framework.serverNotify(targetId, Lang.notify.sent:format("#"..src))
            end
            return true
        else
            Framework.serverNotify(targetId, Lang.notify.busy)
            return false
        end
    else
        Framework.serverNotify(targetId, Lang.notify.noonline)
        return false
    end
end)

RegisterNetEvent('kid_request:server:accepted', function(targetId)
	local src = source
    if Config.Name == 'fullname' then
        Framework.serverNotify(targetId, Lang.notify.accepted:format(Framework.getFullName(src)))
    elseif Config.Name == 'citizendid' then
        Framework.serverNotify(targetId, Lang.notify.accepted:format(Framework.getIdentifier(src)))
    elseif Config.Name == 'server-id' then
        Framework.serverNotify(targetId, Lang.notify.accepted:format("#"..src))
    end
    if waitingConfirm[src] then
        TriggerClientEvent('kid_request:client:recieveAnswerRequestConfirm', waitingConfirm[src].from, true)
        waitingConfirm[src] = nil
    end
end)

RegisterNetEvent('kid_request:server:denied', function(targetId)
	local src = source
    if Config.Name == 'fullname' then
        Framework.serverNotify(targetId, Lang.notify.denied:format(Framework.getFullName(src)))
    elseif Config.Name == 'citizendid' then
        Framework.serverNotify(targetId, Lang.notify.denied:format(Framework.getIdentifier(src)))
    elseif Config.Name == 'server-id' then
        Framework.serverNotify(targetId, Lang.notify.denied:format("#"..src))
    end
    if waitingConfirm[src] then
        TriggerClientEvent('kid_request:client:recieveAnswerRequestConfirm', waitingConfirm[src].from, false)
        waitingConfirm[src] = nil
    end
end)