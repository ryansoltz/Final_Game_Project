hp = 2;
spd = 2;
damage = 1;
shoots = true;
firerate = 200;
shootCool = 60;
projectile = oInk;
follows = true;
followDist = 420;
stopFollow = 0;
following = false;
wanders = true;
//HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHAHA
wanDir = irandom(359);
changeWander = irandom_range(30, 240);
landlocked = false;
waterlocked = false;
invuln = 0;
knDir = 0;
knSpd = 0;
knockback = 0;
stun = 0;
grass = layer_tilemap_get_id("Grass");
sand = layer_tilemap_get_id("Sand");
walls = layer_tilemap_get_id("Walls");

if (!variable_global_exists("defeatedEnemies")) {
    
    global.defeatedEnemies = ds_map_create();
    
}

if (ds_map_exists(global.defeatedEnemies, id)) {
    
    instance_destroy();
    
}