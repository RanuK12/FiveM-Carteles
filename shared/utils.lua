-- utils.lua: Funciones compartidas útiles

-- Verificar cooldown para anti-cheat
function CheckCooldown(playerId, cartelId)
    -- Implementación básica de cooldown
    -- En una implementación real, esto se manejaría con base de datos
    return true
end

-- Función para obtener el nombre del jugador
function GetPlayerName(playerId)
    if Config.Framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(playerId)
        return Player and Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname or 'Desconocido'
    elseif Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        return xPlayer and xPlayer.getName() or 'Desconocido'
    end
    return 'Desconocido'
end

-- Exportar funciones
if IsDuplicityVersion() then -- Server
    exports('CheckCooldown', CheckCooldown)
    exports('GetPlayerName', GetPlayerName)
else -- Client
    exports('CheckCooldown', CheckCooldown)
end