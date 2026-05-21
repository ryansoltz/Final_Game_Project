if (distance_to_object(oPlayerUnderwater) <= 0) {
    
    audio_play_sound(sfxCoin, 11, 0);
    global.coins = global.coins + 1;
    global.countCoins = global.countCoins + 1;
    global.collectedCoins[? id] = true;
    instance_destroy();
    
}