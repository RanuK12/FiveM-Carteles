-- Shared: funciones y datos accesibles desde cliente y servidor

-- Índice rápido de carteles por ID
Carteles = {}

for _, cartel in ipairs(Config.Carteles) do
    Carteles[cartel.id] = cartel
end

-- Función compartida para obtener un cartel por ID
function GetCartel(id)
    return Carteles[id]
end

-- Función compartida para obtener todos los carteles
function GetAllCarteles()
    return Carteles
end

-- Export
exports('GetCartel', GetCartel)
exports('GetAllCarteles', GetAllCarteles)