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
end)