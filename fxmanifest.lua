fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Emilio RanuK12'
description 'Carteles y señalización para servidores RP (FiveM)'
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
    'config.lua',
    'shared/utils.lua',
    'shared/main.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/it.lua',
}

-- UI (HTML/CSS/JS/IMAGES)
files {
    'assets/cartel_cultivo_demo.png',
    'assets/cartel_demo.png',
    'fivem_cartel_mockup.png',
}

-- DEPENDENCIES
dependencies {
    'oxmysql',
    'ox_lib',
    'es_extended',
    'qb-core'
}