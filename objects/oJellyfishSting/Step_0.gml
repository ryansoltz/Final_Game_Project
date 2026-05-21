var hMov = sin(current_time / 600) * 1.5;
var vMov = 0;


nextX = x + hMov;
nextY = y + vMov;

if (stopFollow > 0) {
    
    stopFollow = stopFollow - 1;
    
}


function isBlocked(_x, _y) {
    
    if (grass != -1 && place_meeting(_x, _y, grass)) {
        
        return true;
        
    }
    if (walls != -1 && place_meeting(_x, _y, walls)) {
        
        return true;
        
    }
    if (place_meeting(_x, _y, oBoard)) {
        
        return true
        
    };
    
    if (place_meeting(_x, _y, oDock)) {
        
        return true
        
    };

    if (sand != -1 && waterlocked && place_meeting(_x, _y, sand)) {
        
        return true;
        
    }

    if (sand != -1 && landlocked && !place_meeting(_x, _y, sand)) {
        
        return true;
        
    }
    
    return false;

}

if (knockback > 0) {
    
    knX = lengthdir_x(knSpd, knDir);
    knY = lengthdir_y(knSpd, knDir);

    if (!isBlocked(x + knX, y)) {
        
        x = x + knX;
        
    }
    else {
        
        knSpd = 0;
        
    }

    if (!isBlocked(x, y + knY)) {
        
        y = y +  knY;
        
    }
    else {
        
        knSpd = 0;
        
    }

    knSpd = knSpd * 0.85;
    knockback = knockback - 1;
}

player = noone;

if (instance_exists(oPlayer)) {
        
    player = oPlayer;
        
}
else if (instance_exists(oPlayerUnderwater)) {
        
    player = oPlayerUnderwater;
}

if (follows && stun <= 0) {
    
    if (player != noone) {
        
        dist = point_distance(x, y, player.x, player.y);
        onSand = place_meeting(player.x, player.y, sand);
        canFollow = true;
        
        if (landlocked && !onSand) {
            
            canFollow = false;
            
        }
        
        if (waterlocked && onSand) {
            
            canFollow = false;
            
        }
        
        
        if (dist <= followDist && canFollow && player.invuln == 0 && stopFollow == 0) {
            
            following = true;
            dir = point_direction(x, y, player.x, player.y);
            hMov = lengthdir_x(spd, dir);
            vMov = lengthdir_y(spd, dir);
            
        }
        else {
            
            following = false;
            
        }
        
        
    }
}

while (place_meeting(x, y, oBoard)) {
    
    audio_play_sound(sfxBump, 9, 0);
    x = x + lengthdir_x(32, point_direction(oBoard.x, oBoard.y, x, y));
    y = y + lengthdir_y(32, point_direction(oBoard.x, oBoard.y, x, y));
    
}

if (shootCool > 0) {
    
    shootCool = shootCool - 1;
    
}

if (shoots && stun <= 0 && shootCool <= 0) {
    
    if (player != noone) {
        
        shootDir = point_direction(x, y, player.x, player.y);
        shot = instance_create_layer(x + lengthdir_x(24, shootDir), y + lengthdir_y(24, shootDir), "Instances", projectile);
        shot.dir = shootDir;
        shootCool = firerate;
        
    }
    
}

if (wanders && !following && stun <= 0) {
    
    changeWander = changeWander - 1;
    
    if (changeWander <= 0) {
        
        wanDir = wanDir + irandom_range(-45, 45);
        changeWander = irandom_range(30, 90);
        
    }
    
    hMov = lengthdir_x(spd * 0.5, wanDir);
    vMov = lengthdir_y(spd * 0.5, wanDir);
}

if (stun <= 0) {
    
    if (!isBlocked(x + hMov, y)) {
        
        x = x + hMov;
        
    }
    else {
        
        wanDir = wanDir + (irandom_range(105, 180) * choose(-1, 1));
        
    }
    if (!isBlocked(x, y + vMov)) {
        
        y = y + vMov;
        
    }
    else {
        
        wanDir = wanDir + (irandom_range(105, 180) * choose(-1, 1));
        
    }
    
}




if (invuln > 0) {
    
    invuln = invuln - 1;
    
}

if (stun > 0) {
    
    stun = stun - 1;
    
}

if (place_meeting(x, y, oSlash) && invuln == 0) {
    
    hp = hp - global.playerDamage;
    
    if (hp > 0) {
        
        audio_play_sound(sfxEnemyHit, 5, 0);
        
    }
    
    if (hp > 0) {
        knDir = point_direction(oSlash.x, oSlash.y, x, y);
        knSpd = 16;
        knockback = 32;
        stun = 80;
        invuln = 120;
    }
    
}

if (hp <= 0) {
    
    audio_play_sound(sfxEnemyDie, 11, 0);
    global.enemiesLeft = global.enemiesLeft - 1;
    global.defeatedEnemies[? id] = true;
    
    if (instance_exists(oPlayerUnderwater)){
        
        oPlayerUnderwater.air = oPlayerUnderwater.airMax;
        
    }
    
    if (global.enemiesLeft == 0) {
        
        audio_play_sound(sfxAllKill, 1, 0);
        
    }
    
    instance_create_layer(x, y, "Instances", oExplod);
    instance_destroy();
    
}
