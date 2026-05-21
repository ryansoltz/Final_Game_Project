mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);


if (global.tutorial == false) {
    
    tutorialText = "Tutorial: OFF";
    
} 
else {
    
    tutorialText = "Tutorial: ON";
    
}

if (global.music == false) {
    
    musicText = "Music: OFF";
    
}
else {
    
    musicText = "Music: ON";
    
}


tutorialHover = mx >= 520 && mx <= 760 && my >= 280 && my <= 320;
musicHover    = mx >= 520 && mx <= 760 && my >= 340 && my <= 380;
closeHover    = mx >= 520 && mx <= 760 && my >= 420 && my <= 460;

if (tutorialHover && mouse_check_button_pressed(mb_left)) {
    
    audio_play_sound(sfxOptions, 2, 0);
    global.tutorial = !global.tutorial;
    
}

if (musicHover && mouse_check_button_pressed(mb_left)) {
    
    audio_play_sound(sfxOptions, 2, 0);
    global.music = !global.music;
    
}

if (closeHover && mouse_check_button_pressed(mb_left)) {
    
    audio_play_sound(sfxOptions, 2, 0);
    global.options = false;
    instance_destroy();
    
}