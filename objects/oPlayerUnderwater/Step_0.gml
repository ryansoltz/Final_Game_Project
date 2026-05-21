
if (global.noInp) {
    exit;
}


if (!timeout) {
    
    global.timeLeft = global.timeLeft - 1;
    
}




if (global.timeLeft == 3125) {
    
    audio_play_sound(sfxTimeWarn, 1, 0);
    
}

if (global.timeLeft == 0 && !timeout) {
    
    timeout = true;
    audio_play_sound(sfxTimeout, 1, 0);
    with (oTransition) {
        targetRoom = "rLoading";
        state = "fade_out";
    }
    exit;
    
}

if (invuln > 0) {
    invuln = invuln - 1;
}


if (knockback > 0) {
    
    knX = lengthdir_x(knSpd, knDir);
    knY = lengthdir_y(knSpd, knDir);
    
    if (!place_meeting(x + knX, y, walls)) {
        
        x = x + knX;
        
    }
    else {
        
        knSpd = 0;
        
    }

    if (!place_meeting(x, y + knY, walls) && y + knY >= 1) {
        
        y = y + knY;
        
    }
    else {
        knSpd = 0;
        
    }
    
    knSpd = knSpd * 0.85;
    knockback = knockback - 1;
}

if (invuln <= 0 && place_meeting(x, y, oEnemy)) {
    
    enemy = instance_place(x, y, oEnemy);
    hp = hp - enemy.damage;
    global.playerHP = hp;
    
    if (hp > 0) {
        
        audio_play_sound(sfxPlayerHit, 3, 0);
        
    }
    
    knDir = point_direction(enemy.x, enemy.y, x, y);
    knSpd = 16;
    knockback = 32;
    invuln = 120;
}

if (invuln <= 0 && place_meeting(x, y, oProjectile)) {
    
    proj = instance_place(x, y, oProjectile);
    hp = hp - proj.damage;
    global.playerHP = hp;
    if (hp > 0) {
        
        audio_play_sound(sfxPlayerHit, 3, 0);
        
    }
    knDir = point_direction(proj.x, proj.y, x, y);
    knSpd = 12;
    knockback = 24;
    invuln = 120;
    
}


if (hp <= 0 && !dead) {
    
    dead = true;
    hp = 0;
    global.playerHP = 0;
    
    audio_play_sound(sfxDie, 11, false);
    
    with (oTransition) {
        targetRoom = "rLoading";
        state = "fade_out";
    }
    exit;
}

if (attackCool > 0) {
    attackCool = attackCool - 1;
}



var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));

hDir = keyRight - keyLeft;

if (attackCool <= 0 && mouse_check_button_pressed(mb_left)) {
    
    slaDir = aim;
    slash = instance_create_layer(x + lengthdir_x(range, slaDir), y + lengthdir_y(range, slaDir), "Instances", oSlash);
    audio_play_sound(sfxSwing, 11, 0);
    slash.owner = id;
    slash.range = range;
    slash.dir = slaDir;
    slash.image_angle = slaDir;
    attackCool = attackCoolMax;
}

x = x + (spd * hDir);

if (place_meeting(x, y, walls)) {
    
    x = x - (hDir * spd);
    
}

if (air == 1) {
    
    audio_play_sound(sfxAirOut, 2, 0);
    
}

if (air == 0) {
    
    drown = drown + 1;
    
    if (drown == 100) {
        
        drown = 0;
        audio_play_sound(sfxDrown, 11, 0);
        hp = hp - 1;
        global.playerHP = hp;
        
    }
    
}




if (keyboard_check_pressed(ord("W"))) {
    
    audio_play_sound(sfxSwim, 11, 0);
    vsp = vsp - 10;
    
}

if ((keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right)) && y < 60) {
    
    audio_play_sound(sfxEnterWater, 3, 0);
    
    room_goto(global.currentSurface);
    
}

vsp = vsp + sink;

if (keyboard_check(ord("S"))) {
    
    vsp = clamp(vsp, -3, 3);
    
}
else {
    
    vsp = clamp(vsp, -3, 1);
    
}

y = y + vsp;

if (place_meeting(x, y, walls) || y < 1) {
    
    y = y - vsp;
    
}

air = max(air - 1, 0);
airMeterTo = (air / airMax);
airMeter= lerp(airMeter, airMeterTo, 0.35);


