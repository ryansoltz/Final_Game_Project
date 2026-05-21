timer = timer + 1;

if (timer > 360) {
    
    instance_destroy();
    
}

x = x + lengthdir_x(spd, dir);
y = y + lengthdir_y(spd, dir);

if (place_meeting(x, y, grass) || place_meeting(x, y, walls)) {
    
    instance_destroy();
    
}
