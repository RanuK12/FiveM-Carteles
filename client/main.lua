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

    if lib.progressBar({
        duration = Config.Progress.duration,
        label = Config.Progress.label,
        useWhileDead = false,
        canCancel = Config.Progress.canCancel,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    }) then
        TriggerServerEvent('FiveM-Carteles:server:interact', cartelId)
    end
end)

-- Evento para mostrar progreso de cultivo
RegisterNetEvent('FiveM-Carteles:client:showCultivoProgress', function()
    local ped = PlayerPedId()
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
        anim = {
            dict = 'anim@amb@business@cocaine@cocaine_cutting@',
            clip = 'cocoe_cutting',
        },
    })
end)

-- Evento para mostrar progreso de procesado
RegisterNetEvent('FiveM-Carteles:client:showProcesadoProgress', function()
    local ped = PlayerPedId()
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
        anim = {
            dict = 'mp_arresting',
            clip = 'idle',
        },
    })
end)

-- Evento para mostrar progreso de venta
RegisterNetEvent('FiveM-Carteles:client:showVentaProgress', function()
    local ped = PlayerPedId()
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
        anim = {
            dict = 'mp_common_missanimations',
            clip = 'deal_first_player',
        },
    })
end)

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