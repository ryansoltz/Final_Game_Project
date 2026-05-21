global.noInp = true;

if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
    
    if (!textOver) {
        
        audio_play_sound(sfxTextSkip, 4, 0);
        current = text;
        textPos = string_length(text);
        textOver = true;
        
    }
    else {
        
        i++;
        audio_play_sound(sfxTextAdv, 11, 0);
        
        if (i == array_length(lines)) {
            
            if (transitions) {
                
                with (oTransition) {
                    targetRoom = "rLoading";
                    state = "fade_out";
                }       
                
            }
            global.noInp = false;
            instance_create_layer(0, 0, "Instances", oShopMenu);
            instance_destroy();
            
        }
        else {
            
            text = lines[i];
            current = "";
            textPos = 0;
            textOver = false;
            
        }
        
    }
}
else if (!textOver) {
    
    textPos = textPos + textSpd;
    current = string_copy(text, 1, floor(textPos));
    
    if (textPos >= string_length(text)) {
        
        current = text;
        textOver = true;
        
    }
}