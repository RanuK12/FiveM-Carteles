local QBCore = nil
local ESX = nil

-- Inicialización del framework
if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
end

-- Eventos del cliente
RegisterNetEvent('FiveM-Carteles:client:interact', function(cartelId)
    local cartel = Carteles[cartelId]
    if not cartel then return end
    
    -- Verificar anti-cheat cooldown
    if not CheckCooldown(source, cartelId) then
        return
    end

    -- Determinar qué tipo de interacción es
    if cartelId == 'droga_cultivo' then
        TriggerEvent('FiveM-Carteles:client:showCultivoProgress')
    elseif cartelId == 'droga_procesado' then
        TriggerEvent('FiveM-Carteles:client:showProcesadoProgress')
    elseif cartelId == 'droga_venta' then
        TriggerEvent('FiveM-Carteles:client:showVentaProgress')
    end
end)

-- Evento para mostrar progreso de cultivo
RegisterNetEvent('FiveM-Carteles:client:showCultivoProgress', function()
    local cartel = GetCartel('droga_cultivo')
    if not cartel then return end
    
    local ped = PlayerPedId()
    
    -- Animación de cultivo
    if cartel.animation and cartel.animation_clip then
        RequestAnimDict(cartel.animation)
        while not HasAnimDictLoaded(cartel.animation) do
            Wait(100)
        end
        
        TaskPlayAnim(ped, cartel.animation, cartel.animation_clip, 8.0, -8.0, -1, 49, 0, false, false, false)
    end
    
    lib.progressBar({
        duration = 30000, -- 30 segundos
        label = Locales[Config.Locale].cultivo_start,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    })
    
    -- Reportar progreso al servidor (éxito si se completó la barra)
    local success = lib.progressBarCompleted
    
    -- Limpiar animación
    if cartel.animation then
        RemoveAnimDict(cartel.animation)
    end
    
    -- Reportar resultado al servidor
    TriggerEvent('FiveM-Carteles:client:reportProgress', 'droga_cultivo', success)
end)

-- Evento para mostrar progreso de procesado
RegisterNetEvent('FiveM-Carteles:client:showProcesadoProgress', function()
    local cartel = GetCartel('droga_procesado')
    if not cartel then return end
    
    local ped = PlayerPedId()
    
    -- Animación de procesado
    if cartel.animation and cartel.animation_clip then
        RequestAnimDict(cartel.animation)
        while not HasAnimDictLoaded(cartel.animation) do
            Wait(100)
        end
        
        TaskPlayAnim(ped, cartel.animation, cartel.animation_clip, 8.0, -8.0, -1, 49, 0, false, false, false)
    end
    
    lib.progressBar({
        duration = 20000, -- 20 segundos
        label = Locales[Config.Locale].procesado_start,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    })
    
    -- Reportar progreso al servidor (éxito si se completó la barra)
    local success = lib.progressBarCompleted
    
    -- Limpiar animación
    if cartel.animation then
        RemoveAnimDict(cartel.animation)
    end
    
    -- Reportar resultado al servidor
    TriggerEvent('FiveM-Carteles:client:reportProgress', 'droga_procesado', success)
end)

-- Evento para mostrar progreso de venta
RegisterNetEvent('FiveM-Carteles:client:showVentaProgress', function()
    local cartel = GetCartel('droga_venta')
    if not cartel then return end
    
    local ped = PlayerPedId()
    
    -- Animación de venta
    if cartel.animation and cartel.animation_clip then
        RequestAnimDict(cartel.animation)
        while not HasAnimDictLoaded(cartel.animation) do
            Wait(100)
        end
        
        TaskPlayAnim(ped, cartel.animation, cartel.animation_clip, 8.0, -8.0, -1, 49, 0, false, false, false)
    end
    
    lib.progressBar({
        duration = 15000, -- 15 segundos
        label = Locales[Config.Locale].venta_start,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    })
    
    -- Reportar progreso al servidor (éxito si se completó la barra)
    local success = lib.progressBarCompleted
    
    -- Limpiar animación
    if cartel.animation then
        RemoveAnimDict(cartel.animation)
    end
    
    -- Reportar resultado al servidor
    TriggerEvent('FiveM-Carteles:client:reportProgress', 'droga_venta', success)
end)

-- Anti-cheat: cooldown tracking
local interactionCooldowns = {}

-- Spawn de carteles
CreateThread(function()
    for _, cartel in pairs(Carteles) do
        if cartel.blip and cartel.blip.enabled then
            local blip = AddBlipForCoord(cartel.coords.x, cartel.coords.y, cartel.coords.z)
            SetBlipSprite(blip, cartel.blip.sprite)
            SetBlipColour(blip, cartel.blip.color)
            SetBlipScale(blip, cartel.blip.scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(cartel.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- Anti-cheat: función para verificar cooldown
function CheckCooldown(source, cartelId)
    if not interactionCooldowns[source] then
        interactionCooldowns[source] = {}
    end
    
    if not interactionCooldowns[source][cartelId] then
        interactionCooldowns[source][cartelId] = 0
    end
    
    local currentTime = GetGameTimer()
    if currentTime - interactionCooldowns[source][cartelId] < Config.Cooldown then
        local remainingTime = Config.Cooldown - (currentTime - interactionCooldowns[source][cartelId])
        lib.notify(source, {
            type = 'error',
            description = Locales[Config.Locale].cooldown_active:format(math.ceil(remainingTime / 1000)),
            position = Config.Notifications.position,
            duration = Config.Notifications.duration,
        })
        return false
    end
    
    interactionCooldowns[source][cartelId] = currentTime
    return true
end

-- Evento para reportar progreso completado al servidor
RegisterNetEvent('FiveM-Carteles:client:reportProgress', function(cartelId, success)
    local cartel = Carteles[cartelId]
    if not cartel then return end
    
    TriggerServerEvent('FiveM-Carteles:server:reportProgress', cartelId, success)
end)

-- Crear props visuales para cada cartel
CreateThread(function()
    for _, cartel in pairs(Carteles) do
        if cartel.prop then
            RequestModel(cartel.prop.model)
            while not HasModelLoaded(cartel.prop.model) do
                Wait(100)
            end
            
            local prop = CreateObject(
                cartel.prop.model,
                cartel.prop.coords.x,
                cartel.prop.coords.y,
                cartel.prop.coords.z,
                false,
                false,
                false
            )
            
            SetEntityHeading(prop, cartel.prop.heading)
            FreezeEntityPosition(prop, true)
            SetEntityCollision(prop, false, false)
            
            -- Guardar referencia para limpieza
            cartel.prop.entity = prop
        end
    end
end)

-- Zonas de interacción
CreateThread(function()
    for _, cartel in pairs(Carteles) do
        exports.ox_target:addSphereZone({
            coords = cartel.coords,
            radius = cartel.interactionDistance,
            options = {
                {
                    label = cartel.label,
                    icon = 'fas fa-sign',
                    onSelect = function()
                        TriggerEvent('FiveM-Carteles:client:interact', cartel.id)
                    end,
                },
            },
        })
    end
end)

-- Limpiar props al salir
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    for _, cartel in pairs(Carteles) do
        if cartel.prop and cartel.prop.entity then
            DeleteEntity(cartel.prop.entity)
        end
    end
end)