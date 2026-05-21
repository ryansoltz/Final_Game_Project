function scrNextState(){

    nextState = "";
    
    if (global.currentState == "Title") {
        if (global.tutorial == true) { 
            nextState = "Exposition";
            global.currentState = "Exposition";
            global.currentSurface = rDemoSurface;
            global.currentDay = 1;
            global.daysRemaining = 2;
            global.totalEnemies = 12;
            global.enemiesLeft = global.totalEnemies;
        }
        else {
            global.tutorial1 = true;
            global.tutorial2 = true;
            global.resultsTut = true;
            global.shopTut = true;
            nextState = "Brief";
            global.currentState = "Brief";
        
        }

    }
    else if (global.currentState == "Exposition") {
        nextState = "game";
        global.currentState = "game";
    }
    else if (global.currentState == "game") {
        
        if (global.playerHP == 0) {
            
            
            global.coins = round(global.coins * 0.7);
            global.timeLeft = 17500;
            
            if (global.KOWarning == false) { 
                
                global.warningToGive = "KO";
                nextState = "Warning";
                global.currentState = "Warning";
                
            }
            else {
                
                global.playerHP = round(global.playerHPMax / 2);
                nextState = "Results";
                global.currentState = "Results";
                
            }
            
            
        }
        else if (global.timeLeft == 0) {
            

            
            if (global.timeoutWarning == false) {
                
                global.warningToGive = "timeout";
                nextState = "Warning";
                global.currentState = "Warning";                
            }
            else {
                
                
                global.timeLeft = 15000;
                nextState = "Results";
                global.currentState = "Results";                
                
            }

            
        }
        else { 
            
            global.timeLeft = 25000;
            nextState = "Results";
            global.currentState = "Results";
            
        }
    }
    
    else if (global.currentState == "Warning") {
        
        
        
        if (global.warningToGive == "KO") {
            
            global.KOWarning = true;
            global.playerHP = round(global.playerHPMax / 2);
        }
        else {
            
            global.timeoutWarning = true; 
            global.timeLeft = 15000;
            
        }
        
        nextState = "Results";
        global.currentState = "Results";        
        
    }
    else if (global.currentState == "Results") {
        
        global.playerSpawnX = global.playerXSpawns[global.currentJob];
        global.playerSpawnY = global.playerYSpawns[global.currentJob];
        global.boardSpawnX = global.boardXSpawns[global.currentJob];
        global.boardSpawnY = global.boardYSpawns[global.currentJob];
        
        if (global.tutorial) {
            
            if (global.enemiesLeft == 0) {
                
                nextState = "Win";
                global.currentState = "Win";
                
            }
            else if (global.daysRemaining > 0) {
                
                nextState = "Shop";
                global.currentState = "Shop";
                
            }
            else {
                
                nextState = "Lose";
                global.currentState = "Lose";
                
            }
            
        }
        else {
            
            if (global.enemiesLeft == 0) {
                
                
                
                nextState = "Brief";
                global.currentState = "Brief";
                
            }
            else if (global.daysRemaining > 0) {
                
                nextState = "Shop";
                global.currentState = "Shop";
                
            }
            else {
                
                nextState = "GameOver";
                global.currentState = "GameOver";
                
            
        }
        
        }
    }
    else if (global.currentState == "Shop") {
        global.countCoins = 0;
        global.totalEnemies = global.enemiesLeft;
        global.daysRemaining = global.daysRemaining - 1;
        global.currentDay = global.currentDay + 1;
        nextState = "game";
        global.currentState = "game";
    }
    else if (global.currentState == "Win") {
        nextState = "Brief";
        global.currentState = "Brief";
    }
    else if (global.currentState == "Brief") {
        
        nextState = "Shop";
        global.currentState = "Shop";
        
    }
    else {
        nextState = "Title";
        global.currentState = "Title";
    }
    
    return nextState;
    
    
}