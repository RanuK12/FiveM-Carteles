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