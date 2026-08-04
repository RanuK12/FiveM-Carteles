Config = {}

-- Configuración del Framework
Config.Framework = 'ESX' -- Opciones: 'ESX', 'QB-Core'

-- Configuración de la base de datos
Config.Database = {
    host = 'localhost',
    database = 'fivem_carteles',
    username = 'root',
    password = ''
}

-- Configuración de los carteles
Config.Cartels = {
    {
        name = 'Cartel del Norte',
        label = 'Norte Cartel',
        color = '#FF0000',
        maxMembers = 10,
        salary = 500
    },
    {
        name = 'Cartel del Sur',
        label = 'Sur Cartel', 
        color = '#0000FF',
        maxMembers = 10,
        salary = 500
    }
}

-- Configuración de drogas
Config.Drugs = {
    {
        name = 'cocaine',
        label = 'Cocaína',
        price = 1000,
        processingTime = 30000
    },
    {
        name = 'weed',
        label = 'Marihuana',
        price = 500,
        processingTime = 20000
    }
}

-- Configuración de locales
Config.Locale = 'es' -- Opciones: 'es', 'en', 'it'