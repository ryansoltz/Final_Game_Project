/*
waterSprite = waterSprite + 1;

if (waterSprite > 120) {
    
    waterSprite = 0;
    
}
*/

left = oBoard.x - 54;
right = oBoard.x + 54;
top = oBoard.y - 34;
bottom = oBoard.y + 34;

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
    
    if (!place_meeting(x + knX, y, grass)) {
        
        x = x + knX;
        
    }
    else {
        
        knSpd = 0;
        
    }

    if (!place_meeting(x, y + knY, grass) && y + knY >= 1) {
        
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
    enemy.stopFollow = 360;
    knDir = point_direction(enemy.x, enemy.y, x, y);
    knSpd = 24;
    knockback = 48;
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
    knSpd = 16;
    knockback = 32;
    invuln = 120;
    
}


var keyLeft = keyboard_check(ord("A"));
var keyRight = keyboard_check(ord("D"));
var keyUp = keyboard_check(ord("W"));
var keyDown = keyboard_check(ord("S"));

bMov = keyUp - keyDown;
turn = keyRight - keyLeft;
hDir = keyRight - keyLeft;
vDir = keyDown - keyUp;

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

if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right)) {
    
    if (!board) {
        
       if (distance_to_object(oBoard) < 16) {
            x = oBoard.x;
            y = oBoard.y;
            audio_play_sound(sfxGetOn, 11, 0);
            board = true;
            combat = true;
            boardDir = oBoard.image_angle;
        } 
    }
    else {
        
        disx = oBoard.x + lengthdir_x(dismount, aim);
        disy = oBoard.y + lengthdir_y(dismount, aim);
        
        if (!place_meeting(disx, disy, grass) && !place_meeting(disx + 12, disy, grass) && !place_meeting(disx - 12, disy, grass) && !place_meeting(disx, disy + 12, grass) && !place_meeting(disx, disy - 12, grass)) {
            
            audio_play_sound(sfxEnterWater, 4, 0);
            x = disx;
            y = disy;
            board = false;
            combat = false;
            
        }
        else {
            
            audio_play_sound(sfxNo, 11, 0);
            
        }
            
    }
    
}

if (place_meeting(x, y, sand)) {
    
    combat = true;
    spd = 3;
    
}
else if (!board) {
    
    combat = false;
    spd = 2;
    
}

if (attackCool > 0) {
    
    attackCool = attackCool - 1;
    
}

if (combat && attackCool == 0 && mouse_check_button_pressed(mb_left)) {
    
    slash = instance_create_layer(x + lengthdir_x(range, aim), y + lengthdir_y(range, aim), "Instances", oSlash);
    slash.owner = id;
    slash.range = range;
    slash.dir = aim;
    slash.image_angle = aim;
    audio_play_sound(sfxSwing, 11, 0);
    attackCool = attackCoolMax;
    
}

if (board) {
    
    if (abs(boardSpd) > 0.05) {
        
        oBoard.image_angle = oBoard.image_angle - (turn * boardTurn);
        
    }
    else {
        
        oBoard.image_angle = oBoard.image_angle - (turn * (boardTurn * 0.8));
        
    }
    
    boardDir = oBoard.image_angle;
    
    if (keyUp) {
        
        boardSpd = boardSpd + boardAccel;
        
    }
    if (keyDown) {
        
        boardSpd = max(0, boardSpd - (boardDecel * 2.5));
        
    }
    

}
if (board && !keyUp && !keyDown) {
        
    boardSpd = max(0, boardSpd - boardDecel);
        
}
if (!board) {
    
    boardSpd = max(0, boardSpd - (boardDecel * 4));
    
}


if (bounce) {
    
    dir = point_direction(oBoard.x, oBoard.y, bounceX, bounceY);
    dist = point_distance(oBoard.x, oBoard.y, bounceX, bounceY);
    apple = clamp(dist / 100, 0, 1);
    bounceLim = 1 + power(bounceSpd, 2);
    moveSpd = max(0.2, bounceLim * 4 * apple * (1 - apple));

    if (dist > moveSpd) {
        
        oBoard.x = oBoard.x +  lengthdir_x(moveSpd, dir);
        oBoard.y = oBoard.y + lengthdir_y(moveSpd, dir);
        
    }
    else {
        
        oBoard.x = bounceX;
        oBoard.y = bounceY;
        bounce = false;
        
    }

    boardSpd = 0;
}
else {
    
    boardSpd = clamp(boardSpd, 0, boardSpdMax);
    hMov = lengthdir_x(boardSpd, boardDir);
    vMov = lengthdir_y(boardSpd, boardDir);
    colX = (place_meeting(oBoard.x + hMov, oBoard.y, sand) || place_meeting(oBoard.x, oBoard.y + vMov, grass) || place_meeting(oBoard.x, oBoard.y + vMov, oDock));
    colY = (place_meeting(oBoard.x, oBoard.y + vMov, sand) || place_meeting(oBoard.x, oBoard.y + vMov, grass) || place_meeting(oBoard.x, oBoard.y + vMov, oDock));

    if (!colX && !colY) {
        
        oBoard.x = oBoard.x + hMov;
        oBoard.y = oBoard.y + vMov;
        
    }
    else {
        
        bounceStr = 8 + (boardSpd * 16);
        bounceDir = boardDir + 180;

        if (colX && !colY) {
            
            bounceDir = 180 - boardDir;
            
        }
        else if (!colX && colY) {
            
            bounceDir = 360 - boardDir;
            
        }

        bounceX = oBoard.x + lengthdir_x(bounceStr, bounceDir);
        bounceY = oBoard.y + lengthdir_y(bounceStr, bounceDir);
        bounceSpd = max(1, boardSpd * 0.5);
        boardSpd = 0;
        audio_play_sound(sfxBump, 11, 0);
        bounce = true;
    }
}

if (!board) {
    
    while (place_meeting(x, y, oBoard)) {
        
        sideR= boardDir + 90;
        sideL = boardDir - 90;
        potXR = x + lengthdir_x(16, sideR);
        potYR = y + lengthdir_y(16, sideR);
        potXL = x + lengthdir_x(16, sideL);
        potYL = y + lengthdir_y(16, sideL);

        if (point_distance(potXR, potYR, oBoard.x, oBoard.y) > point_distance(potXL, potYL, oBoard.x, oBoard.y)) {
            
            pushDir = sideR;
            
        }
        else {
            
            pushDir = sideL;
            
        }

        x = x + lengthdir_x(1 + (boardSpd * 3), pushDir);
        y = y + lengthdir_y(1 + (boardSpd * 3), pushDir);
        
    }
}



if (board) {
    
    
    enem = collision_rectangle(left, top, right, bottom, oEnemy, false, true);
    
    if (enem != noone) { 
        
        enem.stopFollow = 360;
        board = false;
        combat = false;
        boardSpd = 0;
        knDir = point_direction(enem.x, enem.y, x, y);
        audio_play_sound(sfxEnterWater, 4, 0);
        knSpd = 24;
        knockback = 48;
        invuln = 60;
        x = oBoard.x + lengthdir_x(dismount, knDir);
        y = oBoard.y + lengthdir_y(dismount, knDir);
        
    }
    
}


if (board) {
    
    x = oBoard.x;
    y = oBoard.y;
    
}
else {
    
    hMov = spd * hDir;
    vMov = spd * vDir;
    
    if (!place_meeting(x + hMov, y, grass)) {
        x = x + hMov;
    }

    if (!place_meeting(x, y + vMov, grass)) {
        y = y + vMov;
    }
    
}

water = instance_nearest(x, y, oDeepWater);

if (water != noone && point_distance(x, y, water.x, water.y) < 64 && !board && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right))) {
    
    global.playerSpawnX = x;
    global.playerSpawnY = y;
    global.boardSpawnX = oBoard.x;
    global.boardSpawnY = oBoard.y;
    audio_play_sound(sfxSubmerge, 3, 0);
    room_goto(water.roomTo);
    
}

if (distance_to_object(oDock) < 4 && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right))) { 
    
    if (!global.tutorial2) {
        
        instance_create_layer(0, 0, "Instances", oTutorialWarn);
        
    }
    else {
        
        audio_play_sound(sfxDock, 2, 0);
        with (oTransition) {
              targetRoom = "rLoading";
              state = "fade_out";
        }  
    } 
    
}

if (distance_to_object(oShop) < 16 && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right) ) && global.coins >= 5) {
    
    hp = min(hp + 5, global.playerHPMax);
    global.playerHP = hp;
    global.coins = global.coins - 5;
    
}

if (distance_to_object(oExit) < 16 && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right) ) ) {
    
    with (oTransition) {
        targetRoom = "rLoading";
        state = "fade_out";
    }  
    
}



