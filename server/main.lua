local QBCore = nil
local ESX = nil

-- Inicialización del framework en el servidor
if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
end

-- Callback para obtener carteles desde el cliente
lib.callback.register('FiveM-Carteles:server:getCarteles', function(source)
    return Carteles
end)

-- Evento de interacción
RegisterNetEvent('FiveM-Carteles:server:interact', function(cartelId)
    local src = source
    local cartel = Carteles[cartelId]

    if not cartel then
        return lib.notify(src, {
            type = 'error',
            description = Locales[Config.Locale].cartel_not_found,
            position = Config.Notifications.position,
            duration = Config.Notifications.duration,
        })
    end

    -- Verificar job si es necesario
    if cartel.job then
        local hasJob = false
        if Config.Framework == 'qbcore' then
            local Player = QBCore.Functions.GetPlayer(src)
            if Player and Player.PlayerData.job.name == cartel.job then
                hasJob = true
            end
        elseif Config.Framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer and xPlayer.job.name == cartel.job then
                hasJob = true
            end
        end

        if not hasJob then
            lib.notify(src, {
                type = 'error',
                description = Locales[Config.Locale].no_permission,
                position = Config.Notifications.position,
                duration = Config.Notifications.duration,
            })
            return
        end
    end

    -- Verificar item si es necesario
    if cartel.item then
        local hasItem = false
        if Config.Framework == 'qbcore' then
            local Player = QBCore.Functions.GetPlayer(src)
            if Player and Player.Functions.GetItemByName(cartel.item) then
                hasItem = true
            end
        elseif Config.Framework == 'esx' then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer then
                local item = xPlayer.getInventoryItem(cartel.item)
                if item and item.count and item.count > 0 then
                    hasItem = true
                end
            end
        end

        if not hasItem then
            lib.notify(src, {
                type = 'error',
                description = Locales[Config.Locale].missing_item,
                position = Config.Notifications.position,
                duration = Config.Notifications.duration,
            })
            return
        end
    end

    -- Interacción exitosa
    lib.notify(src, {
        type = 'success',
        description = Locales[Config.Locale].interact_success,
        position = Config.Notifications.position,
        duration = Config.Notifications.duration,
    })

    if Config.Debug then
        print(('[FiveM-Carteles] Jugador %s interactuó con cartel %s'):format(src, cartelId))
    end
end)