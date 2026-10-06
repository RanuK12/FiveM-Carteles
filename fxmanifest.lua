fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Emilio RanuK12'
description 'Carteles y señalización para RP (FiveM)'
version '1.0.0'

-- CLIENT
client_scripts {
    'client/main.lua',
}

-- SERVER
server_scripts {
    'server/main.lua',
}

-- SHARED
shared_scripts {
    'shared/main.lua',
    'shared/utils.lua',
    'config.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/it.lua',
}

-- FILES (assets)
files {
    'assets/cartel_demo.png',
    'assets/cartel_cultivo_demo.png',
}