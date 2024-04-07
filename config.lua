Config = {}

Config.Name = 'fullname' -- ("fullname", "citizendid", "server-id")

Config.Lang = {
    ['en'] = {
        notify = {
            accepted = "%s accepted your request!",
            denied = "%s denied your request!",
            sent = "%s sent a request to you!",
            busy = "This player is busy",
            noonline = "This player is offline"
        },
    }
}

local _lang = GetConvar('qb_locale', 'en')
Lang = Config.Lang[_lang]

Framework = {}

function Framework.ESX()
    return GetResourceState("es_extended") ~= "missing"
end

function Framework.QBCore()
    return GetResourceState("qb-core") ~= "missing"
end
