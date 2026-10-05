<<<<<<< HEAD
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
=======
-- Funciones compartidas entre cliente y servidor

-- Función para obtener el framework actual
function GetFramework()
    return Config.Framework
end

-- Función para formatear números
function FormatNumber(num)
    local formatted = num
    local i = 1
    while true do
        formatted = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if string.find(formatted, '^(-?%d+)(%d%d%d)') then
            i = i + 1
        else
            break
        end
    end
    return formatted
end

-- Función para obtener el cartel por nombre
function GetCartelByName(name)
    for _, cartel in ipairs(Config.Cartels) do
        if cartel.name == name then
            return cartel
        end
    end
    return nil
end

-- Función para obtener droga por nombre
function GetDrugByName(name)
    for _, drug in ipairs(Config.Drugs) do
        if drug.name == name then
            return drug
        end
    end
    return nil
end

-- Función para generar un ID único
function GenerateUniqueId()
    return math.random(100000, 999999)
end

-- Función para registrar logs
function LogAction(action, details)
    local timestamp = os.date('%Y-%m-%d %H:%M:%S')
    local logMessage = string.format('[%s] %s: %s', timestamp, action, json.encode(details))
    
    -- Guardar en archivo de log
    local file = io.open('logs/cartel_actions.log', 'a')
    if file then
        file:write(logMessage .. '\n')
        file:close()
    end
    
    -- También guardar en base de datos si está disponible
    MySQL.Async.execute('INSERT INTO cartel_logs (action, details, timestamp) VALUES (?, ?, ?)', {
        action,
        json.encode(details),
        os.time()
    })
>>>>>>> ranukita/3975c4
end