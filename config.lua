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
    },
}

-- Tiempo de interacción (ms)
Config.InteractionTime = 3000

-- Notificaciones
Config.Notifications = {
    position = 'top-right', -- 'top-right', 'top-left', 'bottom-right', 'bottom-left'
    duration = 5000,
}

-- Progress bar (ox_lib)
Config.Progress = {
    label = 'Usando cartel...',
    duration = Config.InteractionTime,
    canCancel = true,
}