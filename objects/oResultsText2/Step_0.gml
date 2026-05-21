skip = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);

if (skip && !done && (finalStatus == "win" || finalStatus == "loss")) {
    
    audio_play_sound(sfxTextSkip, 4, 0); 
    
    shownLines = [];
    
    for (var i = 0; i < array_length(results); i++) {
        
        array_push(shownLines, results[i]);
        
    }
    
    index = array_length(results);
    
    if (finalStatus == "win" || finalStatus == "loss") {
        
        finalWait = true;
        pause = pauseMax * 2;
        
    }
    else {
        
        done = true;
        
    }
    
}

if (!done && !finalWait) {
    
    pause = pause - 1;
    
    if (pause <= 0) {
        
        if (index < array_length(results)) {
            
            array_push(shownLines, results[index]);
            audio_play_sound(sfxResult, 11, 0);
            index = index + 1;
            pause = pauseMax;
            
        }
        else {
            
            if (finalStatus == "win" || finalStatus == "loss") {
                
                finalWait = true;
                pause = pauseMax * 2;
                
            }
            else {
                
                done = true;
                
            }
            
        }
        
        
    }
    
}

if (finalWait) {
    
    pause = pause - 1;
    
    if (pause <= 0) {
        
        array_push(shownLines, finalLine);
        
        if (finalStatus == "win") {
            
            audio_play_sound(finalSound, 11, 0);
            
        }
        else {
            
            audio_play_sound(finalSound, 11, 0);
            
        }
        
        finalWait = false;
        finalShown = true;
        done = true;
    }
}

else if (skip && done) {
    
    with (oTransition) {
        
        targetRoom = "rLoading";
        state = "fade_out";
        
    }
    
    instance_destroy();
}
