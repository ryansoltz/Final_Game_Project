if (audio_is_playing(global.waves)) {
        
    audio_stop_sound(global.waves);
        
}


if (!started) {
    
    timer -= 1;
    
    if (timer <= 0) {
        
        started = true;
        state = scrNextState();
        nextRoom = "r" + state;
        
        if (state == "Brief") {
            
            global.tutorial = false;
            global.tutorial1 = true;
            global.tutorial2 = true;
            global.resultsTut = true;
            global.shopTut = true;
            global.currentJob = global.currentJob + 1;
            if (global.currentJob > array_length(global.enemyCounts) - 1) {
                
                global.currentJob = 1;
                
            }
            nextSurface = asset_get_index("rSurface" + string(global.currentJob));
            global.currentSurface = nextSurface;
            global.currentDay = 0;
            global.totalEnemies = global.enemyCounts[global.currentJob];
            global.startJobEnemies = global.totalEnemies;
            global.enemiesLeft = global.totalEnemies;
            global.daysRemaining = 3;
            global.playerSpawnX = global.playerXSpawns[global.currentJob];
            global.playerSpawnY = global.playerYSpawns[global.currentJob];
            global.boardSpawnX = global.boardXSpawns[global.currentJob];
            global.boardSpawnY = global.boardYSpawns[global.currentJob];
            
        }
        
        if (state == "game" && global.tutorial) {
            
            global.playerSpawnX = 300;
            global.playerSpawnY = 300;
            global.boardSpawnX = global.playerSpawnX + 60;
            global.boardSpawnY = global.playerSpawnX + 80;
            nextRoom = "rDemoSurface";
            
        }
        else if (state == "game" && !global.tutorial) {
            
            nextRoom = global.currentSurface;
            
        }
        
    }
}

if (started && oTransition.state == "idle") {
    
    with (oTransition) {
        targetRoom = other.nextRoom;
        state = "fade_out";
    }
    
}