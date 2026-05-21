if (global.music) {
    
    if (global.currentState == "game") {
    
        if (!active) {
            
            surfaceMus = audio_play_sound(sfxCrappyMusic, 1, true);
            underwaterMus = audio_play_sound(sfxCrappyMusic2, 1, true);
            audio_sound_gain(surfaceMus, 1, 0);
            audio_sound_gain(underwaterMus, 0, 0);
            active = true;
            
        }
        
        if (underwater) {
            
            audio_sound_gain(surfaceMus, 0, 1000);
            audio_sound_gain(underwaterMus , 1, 1000);
        }
        else {
            
            audio_sound_gain(surfaceMus, 1, 1000);
            audio_sound_gain(underwaterMus , 0, 1000);
        }
        
    }
    else {
        
        if (active) {
            
            audio_stop_sound(surfaceMus);
            audio_stop_sound(underwaterMus);
            active = false;
        }
    }
    
       
}