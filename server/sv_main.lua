RegisterNetEvent('kid_request:server:sendRequest', function (targetId, title, message, acpButton, cancelButton, action)
    local src = source
    TriggerClientEvent('kid_request:client:sendRequest', targetId, src, title, message, acpButton, cancelButton, action)
    if Config.Name == 'fullname' then
        Framework.serverNotify(targetId, Lang.notify.sent:format(Framework.getFullName(src)))
    elseif Config.Name == 'citizendid' then
        Framework.serverNotify(targetId, Lang.notify.sent:format(Framework.getIdentifier(src)))
    elseif Config.Name == 'server-id' then
        Framework.serverNotify(targetId, Lang.notify.sent:format("#"..src))
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
end)