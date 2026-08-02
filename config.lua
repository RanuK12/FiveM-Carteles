Config = Config or {}

-- Framework: 'esx' o 'qbcore'
Config.Framework = 'esx'

-- Idioma: 'en', 'es', 'it'
Config.Locale = 'es'

-- Debug mode
Config.Debug = false

-- Carteles disponibles
Config.Carteles = {
    -- Ejemplo:
    -- {
    --     id = 'cartel_1',
    --     label = 'Cartel de prueba',
    --     coords = vector3(0.0, 0.0, 72.0),
    --     heading = 0.0,
    --     model = 'prop_poster_01',
    --     interactionDistance = 3.0,
    --     job = nil,  -- nil = todos pueden interactuar, 'police' = solo policía
    --     item = nil, -- nil = sin item requerido
    --     blip = {
    --         enabled = true,
    --         sprite = 1,
    --         color = 2,
    --         scale = 0.8,
    --     },
    -- },
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