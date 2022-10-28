fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Collective'
description 'A simple license plate system'
version '1.0'
lua54 'yes'

shared_scripts{
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts{
    'config.lua',
    'shared/client_config.lua',
    'client.lua'
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'shared/server_config.lua',
    'server.lua'
}