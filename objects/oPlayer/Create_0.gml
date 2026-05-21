spd = 2;
hp = global.playerHP;
//If player is on board or not
board = false;
//If player is able to attack or not
combat = false;
attackCool = 0;
attackCoolMax = 60;
range = 38 + (global.attackUpgrade * 4);
invuln = 0;
knDir = 0;
knSpd = 0;
knockback = 0;
hMov = 0;
vMov = 0;
depth = -1;
boardAccel = 0.01;
boardDecel = 0.005;
boardSpd = 0;
boardSpdMax = 3 + (global.boardUpgrade * 2);
boardTurn = 0.5 + (0.15 * global.boardUpgrade);
boardDir = 0;
dismount = 80;
//If bouncing or not
bounce = false;
bounceX = 0;
bounceY = 0;
boardSpd = 0;
bounceSpd = 0;
dead = false;
timeout = false;
sand = layer_tilemap_get_id("Sand");
grass = layer_tilemap_get_id("Grass");
//waterSprite = 0;
global.waves = audio_play_sound(sfxWaves, 7, 1);
oMusic.underwater = false;