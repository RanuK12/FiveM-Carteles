<<<<<<< HEAD
Config = Config or {}

-- Framework: 'esx' o 'qbcore'
Config.Framework = 'esx'

-- Idioma: 'en', 'es', 'it'
Config.Locale = 'es'

-- Debug mode
Config.Debug = false

-- Carteles disponibles
Config.Carteles = {
    -- Cartel de cultivo de droga
    {
        id = 'droga_cultivo',
        label = 'Cultivo de droga',
        coords = vector3(225.5, -1362.3, 31.5),
        heading = 45.0,
        model = 'prop_lab_table_01',
        interactionDistance = 2.0,
        job = 'cartel',  -- Solo miembros del cartel pueden interactuar
        item = 'semilla_marihuana',  -- Se necesita semilla para cultivar
        blip = {
            enabled = true,
            sprite = 496,
            color = 1,
            scale = 0.8,
        },
        prop = {
            model = 'prop_lab_table_01',
            coords = vector3(225.5, -1362.3, 31.5),
            heading = 45.0,
            distance = 2.0
        },
        animation = 'anim@amb@business@cocaine@cocaine_cutting@',
        animation_clip = 'cocoe_cutting'
    },
    
    -- Cartel de procesado
    {
        id = 'droga_procesado',
        label = 'Procesado de droga',
        coords = vector3(1354.3, -1560.2, 52.3),
        heading = 180.0,
        model = 'prop_tool_bench_01',
        interactionDistance = 2.0,
        job = 'cartel',
        item = 'marihuana_cultivada',  -- Se necesita marihuana cultivada para procesar
        blip = {
            enabled = true,
            sprite = 489,
            color = 2,
            scale = 0.8,
        },
        prop = {
            model = 'prop_tool_bench_01',
            coords = vector3(1354.3, -1560.2, 52.3),
            heading = 180.0,
            distance = 2.0
        },
        animation = 'mp_arresting',
        animation_clip = 'idle'
    },
    
    -- Cartel de venta
    {
        id = 'droga_venta',
        label = 'Venta de droga',
        coords = vector3(-644.2, 129.8, 80.1),
        heading = 90.0,
        model = 'prop_vend_coke_01',
        interactionDistance = 2.0,
        job = 'cartel',
        item = 'droga_procesada',  -- Se necesita droga procesada para vender
        blip = {
            enabled = true,
            sprite = 356,
            color = 3,
            scale = 0.8,
        },
        prop = {
            model = 'prop_vend_coke_01',
            coords = vector3(-644.2, 129.8, 80.1),
            heading = 90.0,
            distance = 2.0
        },
        animation = 'mp_common_missanimations',
        animation_clip = 'deal_first_player'
    },
}

-- Tiempo de interacción (ms)
Config.InteractionTime = 3000

-- Notificaciones
Config.Notifications = {\n    position = 'top-right',\n    duration = 5000,\n}\n\nConfig.Cooldown = 5000 -- ms, anti-cheat cooldown\nConfig.DiscordWebhook = '' -- Set your Discord webhook URL here
    position = 'top-right', -- 'top-right', 'top-left', 'bottom-right', 'bottom-left'
    duration = 5000,
}

-- Progress bar (ox_lib)
Config.Progress = {
    label = 'Usando cartel...',
    duration = Config.InteractionTime,
    canCancel = true,
}
=======
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
>>>>>>> ranukita/3975c4
