fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Emilio RanuK12'
description 'Carteles y señalización para servidores RP (FiveM).'
version '1.0.0'

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

shared_scripts {
    'config.lua',
    'shared/utils.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/it.lua',
}

dependencies {
    'oxmysql'
}