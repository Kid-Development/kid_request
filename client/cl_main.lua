local function ReQuest(targetId, title, message, acpButton, cancelButton, action)
    TriggerServerEvent("kid_request:server:sendRequest", targetId, title, message, acpButton, cancelButton, action)
end

exports("ReQuest", ReQuest)

RegisterNetEvent("kid_request:client:sendRequest", function(targetId, title, message, acpButton, cancelButton, action)
    local acp = lib.alertDialog({
        header = title,
        content = message,
        centered = true,
        cancel = true,
        labels = {
            ['cancel'] = acpButton,
            ['confirm'] = cancelButton,
        }
    })
    if acp then
        TriggerServerEvent('kid_request:server:accepted', targetId)
        action()
    else
        TriggerServerEvent('kid_request:server:denied', targetId)
    end
end)