fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Ranuk IT'
description 'Sistema de carteles para FiveM RP'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/*.lua',
    'locales/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}

dependencies {
    'oxmysql'
}