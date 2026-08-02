# FiveM-Carteles

Sistema de carteles/marcadores interactivos para FiveM. Compatible con ESX y QB-Core.

## Estructura

```
FiveM-Carteles/
├── fxmanifest.lua       # Manifest del resource
├── config.lua           # Configuración general
├── client/
│   └── main.lua         # Lógica del cliente
├── server/
│   └── main.lua         # Lógica del servidor
├── shared/
│   └── main.lua         # Lógica compartida
├── locales/
│   ├── en.lua           # Inglés
│   ├── es.lua           # Español
│   └── it.lua           # Italiano
├── sql/
│   └── schema.sql       # Esquema de base de datos (oxmysql)
└── README.md
```

## Dependencias

- [oxmysql](https://github.com/overextended/oxmysql)
- ESX o QB-Core (configurable)

## Instalación

1. Copiá la carpeta `FiveM-Carteles` a tu directorio `resources/`
2. Agregá `ensure FiveM-Carteles` a tu `server.cfg`
3. Ejecutá el SQL en `sql/schema.sql` en tu base de datos
4. Ajustá `config.lua` según tu framework (ESX / QB-Core)

## Configuración

Editá `config.lua` para:
- Elegir framework (`Config.Framework = 'esx'` o `'qbcore'`)
- Definir los carteles y sus posiciones
- Ajustar tiempos de interacción y permisos