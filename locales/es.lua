<<<<<<< HEAD
Locales = Locales or {}
Locales['es'] = {
    cartel_not_found = 'Cartel no encontrado',
    no_permission = 'No tenés permiso para usar esto',
    missing_item = 'Te falta un objeto necesario',
    interact_success = 'Interacción exitosa',
    cooldown_active = 'Debes esperar {1} segundos antes de volver a interactuar',
    
    -- Cultivo
    cultivo_start = 'Iniciando cultivo de marihuana...',
    cultivo_success = 'Has cultivado marihuana exitosamente',
    cultivo_fail = 'El cultivo ha fallado',
    
    -- Procesado
    procesado_start = 'Procesando marihuana...',
    procesado_success = 'Has procesado marihuana en droga',
    procesado_fail = 'El procesamiento ha fallado',
    
    -- Venta
    venta_start = 'Vendiendo droga...',
    venta_success = 'Has vendido droga por $',
    venta_fail = 'La venta ha fallado',
    
    -- Tiempo de espera
    cultivo_wait = 'Debes esperar antes de volver a cultivar',
    procesado_wait = 'Debes esperar antes de volver a procesar',
    venta_wait = 'Debes esperar antes de volver a vender',
=======
Locales = {
    -- Notificaciones
    ['notification_joined_cartel'] = 'Te has unido a %s',
    ['notification_left_cartel'] = 'Has dejado el cartel',
    ['notification_already_member'] = 'Ya eres miembro de un cartel',
    ['notification_not_member'] = 'No eres miembro de ningún cartel',
    ['notification_cartel_full'] = 'El cartel ha alcanzado su cupo máximo',
    ['notification_invalid_cartel'] = 'El cartel no existe',
    ['notification_processing_started'] = 'Procesamiento de %s iniciado',
    ['notification_processing_completed'] = 'Procesamiento de %s completado',
    ['notification_processing_failed'] = 'Error al procesar %s',
    ['notification_not_enough_materials'] = 'No tienes suficientes materiales',
    ['notification_sell_drugs'] = 'Has vendido %s por $%s',
    ['notification_no_buyer'] = 'No hay compradores disponibles',
    
    -- Menús
    ['menu_title_cartel'] = 'Menú del Cartel',
    ['menu_option_join'] = 'Unirse a Cartel',
    ['menu_option_leave'] = 'Dejar Cartel',
    ['menu_option_members'] = 'Ver Miembros',
    ['menu_option_process'] = 'Procesar Drogas',
    ['menu_option_sell'] = 'Vender Drogas',
    ['menu_option_storage'] = 'Almacén',
    
    -- Información de carteles
    ['cartel_north'] = 'Cartel del Norte',
    ['cartel_south'] = 'Cartel del Sur',
    
    -- Información de drogas
    ['cocaine'] = 'Cocaína',
    ['weed'] = 'Marihuana',
    ['heroin'] = 'Heroína',
    ['meth'] = 'Metanfetamina',
    
    -- Estados
    ['status_processing'] = 'Procesando...',
    ['status_ready'] = 'Listo',
    ['status_insufficient'] = 'Insuficiente',
    
    -- Botones
    ['button_confirm'] = 'Confirmar',
    ['button_cancel'] = 'Cancelar',
    ['button_close'] = 'Cerrar',
    
    -- Mensajes de error
    ['error_database'] = 'Error de base de datos',
    ['error_no_permission'] = 'No tienes permiso para esto',
    ['error_server_restart'] = 'El servidor se reiniciará pronto',
    
    -- Miscelánea
    ['press_to_interact'] = 'Presiona [E] para interactuar',
    ['zone_cartel_territory'] = 'Territorio del Cartel',
    ['zone_drug_processing'] = 'Zona de Procesamiento'
>>>>>>> ranukita/3975c4
}