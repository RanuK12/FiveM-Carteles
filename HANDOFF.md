# FiveM-Carteles - Handoff

## Resumen del Proyecto
FiveM-Carteles es un resource para FiveM que implementa un sistema de gestión de carteles/narcotráfico para servidores RolePlay. El sistema permite a los jugadores unirse a carteles, procesar drogas y venderlas.

## Estructura del Proyecto

```
FiveM-Carteles/
├── README.md
├── fxmanifest.lua
├── config.lua
├── client/
│   └── main.lua
├── server/
│   └── main.lua
├── shared/
│   └── utils.lua
├── locales/
│   ├── es.lua
│   ├── en.lua
│   └── it.lua
└── HANDOFF.md
```

## Características Implementadas

### 1. Framework Soportado
- ESX
- QB-Core

### 2. Configuración
- Configuración de carteles (nombre, etiqueta, color, cupo máximo, salario)
- Configuración de drogas (nombre, etiqueta, precio, tiempo de procesamiento)
- Sistema de locales (español, inglés, italiano)

### 3. Sistema de Carteles
- Unirse/Dejar carteles
- Ver miembros del cartel
- Límite de miembros por cartel
- Salarios automáticos

### 4. Sistema de Drogas
- Procesamiento de drogas
- Venta de drogas
- Inventario integrado con el framework

## Próximos Pasos

1. Implementar zonas interactivas para procesamiento de drogas
2. Sistema de territorios controlados por carteles
3. Sistema de misiones para carteles
4. Sistema de puntos de venta de drogas
5. Sistema de lavado de dinero

## Instalación

1. Copiar el resource en la carpeta `resources` del servidor FiveM
2. Agregar `ensure FiveM-Carteles` en `server.cfg`
3. Configurar `config.lua` según las necesidades del servidor
4. Crear las tablas necesarias en la base de datos

## Requisitos

- oxmysql
- ESX o QB-Core (configurable en config.lua)

## Base de Datos

Las siguientes tablas son necesarias en la base de datos:

```sql
CREATE TABLE cartel_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(60) NOT NULL,
    cartel_name VARCHAR(50) NOT NULL,
    joined_at INT NOT NULL,
    UNIQUE KEY unique_member (identifier, cartel_name)
);

CREATE TABLE cartel_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(50) NOT NULL,
    details JSON,
    timestamp INT NOT NULL
);

CREATE TABLE cartel_drugs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cartel_name VARCHAR(50) NOT NULL,
    drug_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    last_updated INT NOT NULL
);
```

## Contribuciones

Pull requests son bienvenidos. Asegúrate de seguir las convenciones de código existentes y de incluir pruebas adecuadas.