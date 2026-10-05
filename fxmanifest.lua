fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'RanuK12'
description 'Sistema de carteles interactivos para FiveM'
version '1.1.0'

shared_scripts {
    'shared/utils.lua',
    '@ox_lib/init.lua',
    'config.lua',
    'shared/main.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/it.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

dependencies {
    'oxmysql',
    'ox_lib',
    'es_extended',
    'qb-core'
}
