
switch (state) {
    
    case "fade_out":
        fade += fadeSpeed;
        
        if (fade >= 1) {
            fade = 1;
            waitTimer = waitMax;   
            state = "wait";
        }
    break;
    
    
    case "wait":
        waitTimer -= 1;
        
        if (waitTimer <= 0) {
            global.freeze = false;
            targetRoom = asset_get_index(targetRoom);
            room_goto(targetRoom);
            state = "fade_in";
        }
    break;
    
    
    case "fade_in":
        fade -= fadeSpeed;
        
        if (fade <= 0) {
            fade = 0;
            state = "idle";
        }
    break;
}