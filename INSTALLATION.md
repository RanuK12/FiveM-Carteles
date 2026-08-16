# Instalación de FiveM-Carteles

## Requisitos previos
- **FiveM Server** (Linux/Windows)
- **oxmysql** (para base de datos)
- **ox_lib** (para UI y componentes)
- **Framework**: ESX o QBCore

## Pasos de instalación
1. **Descargar el recurso**
   - Clonar el repo:
     ```bash
     git clone https://github.com/RanuK12/FiveM-Carteles.git
     ```
2. **Colocar en el directorio de recursos**
   - Mover la carpeta a `resources/` de tu servidor FiveM.
3. **Asegurar dependencias**
   - Instalar `oxmysql` y `ox_lib` si no están presentes.
4. **Agregar al server.cfg**
   - Añadir esta línea al final:
     ```cfg
     start FiveM-Carteles
     ```
5. **Ejecutar SQL**
   - Importar el esquema en tu base de datos MySQL.
6. **Configurar opciones**
   - Editar `config.lua` para ajustar:
     - Framework (ESX/QBCore)
     - Coordenadas de carteles
     - Tiempos de interacción
     - Webhook de Discord

## Iniciar el servidor
- Reiniciar el servidor FiveM para cargar el recurso.
- Verificar en la consola que no haya errores de carga.
