fx_version "cerulean"
description "Kid ReQuest"
author "Q4D"
version '1.0.0'

lua54 'yes'

games { "gta5", "rdr3" }

shared_scripts { '@ox_lib/init.lua', 'config.lua' }

client_scripts {'client/*.lua' }

server_scripts {
    'server/framework/*.lua',
    'server/*.lua' }

dependencies {
    'ox_lib'
}