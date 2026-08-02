-- FiveM-Carteles: Esquema de base de datos (oxmysql)

CREATE TABLE IF NOT EXISTS `carteles_data` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `cartel_id` VARCHAR(50) NOT NULL UNIQUE,
    `owner` VARCHAR(60) DEFAULT NULL,
    `owner_name` VARCHAR(100) DEFAULT NULL,
    `last_interaction` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `metadata` JSON DEFAULT NULL,
    INDEX `idx_cartel_id` (`cartel_id`),
    INDEX `idx_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert de carteles iniciales desde config
-- (se puede poblar automáticamente al iniciar el recurso)