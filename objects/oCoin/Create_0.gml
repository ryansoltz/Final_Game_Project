if (!variable_global_exists("collectedCoins")) {
    
    global.collectedCoins = ds_map_create();
    
}

if (ds_map_exists(global.collectedCoins, id)) {
    
    
    //MAY HAVE TO CHANGE THIS IF CHANGE THE WAYS ROOMS ARE GENERATED
    instance_destroy();
    
}
