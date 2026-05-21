
mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);
w = string_width(text);
h = string_height(text);
isHover = (mx >= x && mx <= x + w && my >= y && my <= y + h);

if (!global.options) {
        
    if (isHover && play == true) {
        
        audio_play_sound(sfxHover, 2, 0);
        play = false;
        
    }
    else if (!isHover) {
        
        play = true;
        
    }
    
    
    if (isHover && mouse_check_button_pressed(mb_left)) {
        
        audio_play_sound(sfxButton, 11, 0);
        with (oTransition) {
            targetRoom = "rLoading";
            state = "fade_out";
        }
        
    }
    
}