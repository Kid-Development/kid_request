local confirmCallback = nil

local function ReQuest(targetId, title, message, acpButton, cancelButton, cb)
    if not confirmCallback then
        local result =lib.callback.await('kid_request:callback:sendRequest', false, targetId, title, message, acpButton, cancelButton)
        if result == true then
            confirmCallback = cb
        else
            cb(nil)
        end
    end
end

exports("ReQuest", ReQuest)

RegisterNetEvent('kid_request:client:recieveAnswerRequestConfirm', function(isConfirm)
    confirmCallback(isConfirm)
    confirmCallback = nil
end)

RegisterNetEvent("kid_request:client:sendRequest", function(targetId, title, message, acpButton, cancelButton)
    local acp = lib.alertDialog({
        header = title,
        content = message,
        centered = true,
        cancel = true,
        labels = {
            ['cancel'] = cancelButton,
            ['confirm'] = acpButton,
        }
    })
    if acp == 'confirm' then
        TriggerServerEvent('kid_request:server:accepted', targetId)
    else
        TriggerServerEvent('kid_request:server:denied', targetId)
    end
end)