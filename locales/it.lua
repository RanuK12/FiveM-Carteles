<<<<<<< HEAD
Locales = Locales or {}
Locales['it'] = {
    webhook_title = 'FiveM-Carteles Notifica',
    cartel_not_found = 'Cartello non trovato',
    no_permission = 'Non hai il permesso per usarlo',
    missing_item = 'Ti manca un oggetto necessario',
    interact_success = 'Interazione riuscita',
    cooldown_active = 'Devi attendere {1} secondi prima di interagire di nuovo',
    -- Discord webhook messages
    webhook_cultivo = 'Cultivo iniziato',
    webhook_procesado = 'Procesamento iniziato',
    webhook_venta = 'Vendita iniziata',
    webhook_success = 'Transazione completata con successo',
    webhook_fail = 'Transazione fallita'
    
    -- Cultivo
    cultivo_start = 'Inizio coltivazione di marijuana...',
    cultivo_success = 'Hai coltivato con successo marijuana',
    cultivo_fail = 'La coltivazione è fallita',
    
    -- Procesado
    procesado_start = 'Elaborazione marijuana...',
    procesado_success = 'Hai elaborato marijuana in droga',
    procesado_fail = 'L\'elaborazione è fallita',
    
    -- Venta
    venta_start = 'Vendita di droga...',
    venta_success = 'Hai venduto droga per $',
    venta_fail = 'La vendita è fallita',
    
    -- Tiempo de espera
    cultivo_wait = 'Devi attendere prima di coltivare di nuovo',
    procesado_wait = 'Devi attendere prima di elaborare di nuovo',
    venta_wait = 'Devi attendere prima di vendere di nuovo',
=======
Locales = {
    -- Notifiche
    ['notification_joined_cartel'] = 'Ti sei unito a %s',
    ['notification_left_cartel'] = 'Hai lasciato il cartello',
    ['notification_already_member'] = 'Sei già membro di un cartello',
    ['notification_not_member'] = 'Non sei membro di nessun cartello',
    ['notification_cartel_full'] = 'Il cartello ha raggiunto la capacità massima',
    ['notification_invalid_cartel'] = 'Il cartello non esiste',
    ['notification_processing_started'] = 'Elaborazione di %s iniziata',
    ['notification_processing_completed'] = 'Elaborazione di %s completata',
    ['notification_processing_failed'] = 'Errore durante l\'elaborazione di %s',
    ['notification_not_enough_materials'] = 'Non hai abbastanza materiali',
    ['notification_sell_drugs'] = 'Hai venduto %s per $%s',
    ['notification_no_buyer'] = 'Nessun acquirente disponibile',
    
    -- Menu
    ['menu_title_cartel'] = 'Menu del Cartello',
    ['menu_option_join'] = 'Unisci al Cartello',
    ['menu_option_leave'] = 'Lascia il Cartello',
    ['menu_option_members'] = 'Visualizza Membri',
    ['menu_option_process'] = 'Elabora Droga',
    ['menu_option_sell'] = 'Vendi Droga',
    ['menu_option_storage'] = 'Magazzino',
    
    -- Informazioni sui cartelli
    ['cartel_north'] = 'Cartello del Nord',
    ['cartel_south'] = 'Cartello del Sud',
    
    -- Informazioni sulle droghe
    ['cocaine'] = 'Cocaina',
    ['weed'] = 'Marihuana',
    ['heroin'] = 'Eroina',
    ['meth'] = 'Metanfetamina',
    
    -- Stati
    ['status_processing'] = 'Elaborazione...',
    ['status_ready'] = 'Pronto',
    ['status_insufficient'] = 'Insufficiente',
    
    -- Pulsanti
    ['button_confirm'] = 'Conferma',
    ['button_cancel'] = 'Annulla',
    ['button_close'] = 'Chiudi',
    
    -- Messaggi di errore
    ['error_database'] = 'Errore del database',
    ['error_no_permission'] = 'Non hai il permesso per questo',
    ['error_server_restart'] = 'Il server si riavvierà a breve',
    
    -- Varie
    ['press_to_interact'] = 'Premi [E] per interagire',
    ['zone_cartel_territory'] = 'Territorio del Cartello',
    ['zone_drug_processing'] = 'Zona di Elaborazione Droga'
>>>>>>> ranukita/3975c4
}