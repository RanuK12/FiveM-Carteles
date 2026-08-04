local ESX = exports['es_extended']:getSharedObject()
local QBCore = exports['qb-core']:GetCoreObject()

-- Variables locales
local playerCartel = nil
local inCartelZone = false

-- Evento cuando el jugador se une a un cartel
RegisterNetEvent('carteles:joinCartel')
AddEventHandler('carteles:joinCartel', function(cartelName)
    local source = source
    
    if Config.Framework == 'ESX' then
        ESX.TriggerCallback('carteles:checkMembership', function(isMember)
            if not isMember then
                TriggerClientEvent('carteles:notification', source, 'No eres miembro de este cartel')
                return
            end
            
            playerCartel = cartelName
            TriggerClientEvent('carteles:joinedCartel', source, cartelName)
        end, cartelName)
    elseif Config.Framework == 'QB-Core' then
        QBCore.Functions.GetPlayer(source).PlayerData.metadata['cartel'] = cartelName
        playerCartel = cartelName
        TriggerClientEvent('carteles:joinedCartel', source, cartelName)
    end
end)

-- Evento cuando el jugador sale de un cartel
RegisterNetEvent('carteles:leaveCartel')
AddEventHandler('carteles:leaveCartel', function()
    local source = source
    
    if Config.Framework == 'ESX' then
        ESX.TriggerCallback('carteles:leaveCartel', function(success)
            if success then
                playerCartel = nil
                TriggerClientEvent('carteles:leftCartel', source)
            end
        end)
    elseif Config.Framework == 'QB-Core' then
        QBCore.Functions.GetPlayer(source).PlayerData.metadata['cartel'] = nil
        playerCartel = nil
        TriggerClientEvent('carteles:leftCartel', source)
    end
end)

-- Evento para obtener el cartel del jugador
RegisterNetEvent('carteles:getPlayerCartel')
AddEventHandler('carteles:getPlayerCartel', function()
    local source = source
    TriggerClientEvent('carteles:receivePlayerCartel', source, playerCartel)
end)

-- Evento para procesar drogas
RegisterNetEvent('carteles:processDrugs')
AddEventHandler('carteles:processDrugs', function(drugType)
    local source = source
    
    if not playerCartel then
        TriggerClientEvent('carteles:notification', source, 'No eres miembro de ningún cartel')
        return
    end
    
    if Config.Framework == 'ESX' then
        ESX.TriggerCallback('carteles:canProcessDrugs', function(canProcess)
            if canProcess then
                -- Lógica de procesamiento de drogas
                TriggerClientEvent('carteles:startProcessing', source, drugType)
            else
                TriggerClientEvent('carteles:notification', source, 'No puedes procesar drogas en este momento')
            end
        end, playerCartel, drugType)
    elseif Config.Framework == 'QB-Core' then
        -- Lógica de procesamiento de drogas para QB-Core
        TriggerClientEvent('carteles:startProcessing', source, drugType)
    end
end)