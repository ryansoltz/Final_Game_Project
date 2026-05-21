if (distance_to_object(oPlayerUnderwater) <= 0) {
    
    audio_play_sound(sfxBubble, 11, 0);
    oPlayerUnderwater.air = oPlayerUnderwater.airMax;
    instance_destroy();
    
}