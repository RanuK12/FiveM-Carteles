fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Ranuk IT'
description 'Sistema de carteles para FiveM RP'
version '1.0.0'

shared_scripts {
  'config.lua',
  'shared/utils.lua',
  'locales/en.lua',
  'locales/es.lua',
  'locales/it.lua'
}

client_scripts {
  'client/main.lua'
}

server_scripts {
  'server/main.lua',
  '@oxmysql/lib/MySQL.lua'
}

dependencies {
  'oxmysql'
}