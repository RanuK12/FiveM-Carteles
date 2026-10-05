fx_version 'cerulean'
game 'gta5'
lua54 'yes'

<<<<<<< HEAD
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
=======
author 'Emilio RanuK12'
description 'Carteles y señalización para servidores RP (FiveM).'
version '1.0.0'
>>>>>>> ranukita/3975c4

client_scripts {
    'client/main.lua',
}

server_scripts {
<<<<<<< HEAD
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

dependencies {
    'oxmysql',
    'ox_lib',
    'es_extended',
    'qb-core'
}
=======
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
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
>>>>>>> ranukita/3975c4
