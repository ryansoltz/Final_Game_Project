enemiesDefeated = global.totalEnemies - global.enemiesLeft;
results = ["Day " + string(global.currentDay), ["Defeated: ", string(enemiesDefeated)], ["Enemies Left: ", string(global.enemiesLeft)]];
shownLines = [];
index = 0;
pauseMax = 60;
pause = pauseMax;
done = false;
finalWait = false;
finalShown = false;
finalSound = sfxResult;
finalStatus = "continue";

if (global.enemiesLeft == 0) {
    
    finalLine = "All Enemies Cleared!";
    finalStatus = "win";
    finalSound = sfxDidit;
    
}
else if (global.daysRemaining == 0 && global.enemiesLeft > 1) {
    
    finalLine = "Mission Failed";
    finalStatus = "loss";
    finalSound = sfxFailure;
    
}
else {
    
    finalLine = string(global.daysRemaining) + " Days Remaining";
    array_push(results, finalLine);
    
}


