instance_create_layer(global.playerSpawnX, global.playerSpawnY, "InstancesLower", oPlayer);
instance_create_layer(global.boardSpawnX, global.boardSpawnY, "InstancesLower", oBoard);

if (!global.tutorial1) {
    
    instance_create_layer(0, 0, "Instances", oTutorial1);
    global.tutorial1 = true;
    
}
