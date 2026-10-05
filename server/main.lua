<<<<<<< HEAD
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

-- Función para enviar webhook de Discord
local function SendDiscordWebhook(message, type)
    if not Config.DiscordWebhook or Config.DiscordWebhook == '' then return end
    
    local embed = {
        title = Locales[Config.Locale].webhook_title or 'FiveM-Carteles Notifica',
        description = message,
        color = type == 'success' and 65280 or type == 'error' and 16711680 or 16776960,
        timestamp = os.date('%Y-%m-%dT%H:%M:%S.000Z'),
        footer = {
            text = 'FiveM-Carteles v1.0.0'
        }
    }
    
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers)
        if Config.Debug then
            print(('[FiveM-Carteles] Webhook response: %s'):format(text or 'nil'))
        end
    end, 'POST', json.encode({username = 'FiveM-Carteles', embeds = {embed}}), {['Content-Type'] = 'application/json'})
end

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
            
            -- Enviar webhook de intento fallido
            SendDiscordWebhook(string.format('%s intentó interactuar con %s sin permisos', GetPlayerName(src), cartel.label), 'error')
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
            
            -- Enviar webhook de intento fallido
            SendDiscordWebhook(string.format('%s intentó interactuar con %s sin el item requerido', GetPlayerName(src), cartel.label), 'error')
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

    -- Enviar webhook de Discord
    local webhookMessage = string.format('%s ha interactuado con %s', GetPlayerName(src), cartel.label)
    SendDiscordWebhook(webhookMessage, 'success')

    if Config.Debug then
        print(('[FiveM-Carteles] Jugador %s interactuó con cartel %s'):format(src, cartelId))
    end
=======
local ESX = nil
local QBCore = nil

-- Inicialización del framework
CreateThread(function()
    if Config.Framework == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
    elseif Config.Framework == 'QB-Core' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

-- Tabla para almacenar miembros de carteles
local cartelMembers = {}

-- Evento cuando un jugador se une a un cartel
RegisterNetEvent('carteles:server:joinCartel')
AddEventHandler('carteles:server:joinCartel', function(cartelName)
    local source = source
    
    -- Verificar si el jugador ya está en un cartel
    if cartelMembers[source] then
        TriggerClientEvent('carteles:notification', source, 'Ya eres miembro de un cartel')
        return
    end
    
    -- Verificar si el cartel existe
    local cartelExists = false
    for _, cartel in ipairs(Config.Cartels) do
        if cartel.name == cartelName then
            cartelExists = true
            break
        end
    end
    
    if not cartelExists then
        TriggerClientEvent('carteles:notification', source, 'El cartel no existe')
        return
    end
    
    -- Verificar cupo del cartel
    local memberCount = 0
    for _, playerId in pairs(cartelMembers) do
        if playerId.cartel == cartelName then
            memberCount = memberCount + 1
        end
    end
    
    local cartel = nil
    for _, c in ipairs(Config.Cartels) do
        if c.name == cartelName then
            cartel = c
            break
        end
    end
    
    if memberCount >= cartel.maxMembers then
        TriggerClientEvent('carteles:notification', source, 'El cartel ha alcanzado su cupo máximo')
        return
    end
    
    -- Agregar al jugador al cartel
    cartelMembers[source] = {
        cartel = cartelName,
        joinedAt = os.time()
    }
    
    -- Guardar en base de datos
    MySQL.Async.execute('INSERT INTO cartel_members (identifier, cartel_name, joined_at) VALUES (?, ?, ?)', {
        GetPlayerIdentifier(source),
        cartelName,
        os.time()
    })
    
    -- Notificar al jugador
    TriggerClientEvent('carteles:notification', source, 'Te has unido a ' .. cartel.label)
    
    -- Notificar a otros miembros del cartel
    TriggerClientEvent('carteles:memberJoined', -1, source, cartelName)
end)

-- Evento cuando un jugador sale de un cartel
RegisterNetEvent('carteles:server:leaveCartel')
AddEventHandler('carteles:server:leaveCartel', function()
    local source = source
    
    if not cartelMembers[source] then
        TriggerClientEvent('carteles:notification', source, 'No eres miembro de ningún cartel')
        return
    end
    
    local cartelName = cartelMembers[source].cartel
    
    -- Eliminar del cartel
    cartelMembers[source] = nil
    
    -- Eliminar de base de datos
    MySQL.Async.execute('DELETE FROM cartel_members WHERE identifier = ?', {
        GetPlayerIdentifier(source)
    })
    
    -- Notificar al jugador
    TriggerClientEvent('carteles:notification', source, 'Has dejado el cartel')
    
    -- Notificar a otros miembros del cartel
    TriggerClientEvent('carteles:memberLeft', -1, source, cartelName)
end)

-- Callback para verificar membresía (ESX)
ESX = nil
CreateThread(function()
    if Config.Framework == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
    end
end)

-- Export para obtener miembros de un cartel
exports('getCartelMembers', function(cartelName)
    local members = {}
    for playerId, memberData in pairs(cartelMembers) do
        if memberData.cartel == cartelName then
            table.insert(members, {
                id = playerId,
                name = GetPlayerName(playerId),
                joinedAt = memberData.joinedAt
            })
        end
    end
    return members
>>>>>>> ranukita/3975c4
end)