# HotWire React Application

### [Preview](https://streamable.com/ejpjek)
### [Download](https://github.com/Kid-Development/kid_request)
### [Support](https://discord.gg/8Z4w5UBGwK)

## Example:
```lua

exports['kid_request']:ReQuest(function()
    local playerId, playerPed, playerCoords = lib.getClosestPlayer(GetEntityCoords(cache.ped), 5.0)
    if playerId and playerPed then
        ReQuest(GetPlayerServerId(playerId), "ReQuest", playerData.charinfo.firstname.." "..playerData.charinfo.lastname.." request to sell health insured for $500", "Accept", "Deny", function(result)
            if result then
                FreezeEntityPosition(playerPed, true)
                QBCore.Functions.Progressbar('hospital_healwounds', 'Healing Wounds...', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = 'mini@cpr@char_a@cpr_str',
                    anim = 'cpr_pumpchest',
                    flags = 33,
                }, {}, {}, function() -- Done
                    StopAnimTask(PlayerPedId(), 'mini@cpr@char_a@cpr_str', 'exit', 1.0)
                    FreezeEntityPosition(playerPed, false)
                    TriggerServerEvent('hospital:server:TreatWounds', GetPlayerServerId(playerId))
                end, function() -- Cancel
                    StopAnimTask(PlayerPedId(), 'mini@cpr@char_a@cpr_str', 'exit', 1.0)
                    FreezeEntityPosition(playerPed, false)
                end)
            end
        end)
    end
end)


```