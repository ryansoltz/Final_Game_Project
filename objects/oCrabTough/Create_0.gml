hp = 3;
spd = 3;
damage = 3;
shoots = false;
firerate = 120;
shootCool = firerate;
projectile = noone;
follows = true;
followDist = 500;
stopFollow = 0;
following = false;
wanders = true;
//HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAHAHA
wanDir = irandom(359);
changeWander = irandom_range(30, 240);
landlocked = true;
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