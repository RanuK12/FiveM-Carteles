# FiveM-Carteles — Handoff

## Fase B2-F1: Scaffold inicial ✓

### Qué se hizo
- Repo creado con `git init`
- Estructura del resource: fxmanifest, config, client/server/shared, locales, SQL
- fxmanifest con `cerulean` y `lua54`
- config.lua con soporte dual ESX/QB-Core
- Locales en en/es/it
- Esquema SQL para oxmysql

### Qué sigue (próxima fase)
- Implementar lógica real de carteles: spawn, interacción, UI
- Sincronización cliente↔servidor
- Comandos y permisos

### Cómo probar
1. Copiar la carpeta a un servidor FiveM con oxmysql
2. Ejecutar `sql/schema.sql`
3. `ensure FiveM-Carteles` en server.cfg
4. Verificar que carga sin errores en la consola del servidor

### Branch actual
`ranukita/071b80`