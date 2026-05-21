lines = ["Results of day " + string(global.currentDay), 
"You defeated " + string(global.totalEnemies - global.enemiesLeft) +  " enemies. " + string(global.enemiesLeft) + " enemies still remain.",
"You have " + string(global.daysRemaining) + " day(s) left for this job. Don't disappoint."];
i = 0;
text = lines[i];
current = "";
textPos = 0;
textSpd = 1; 
textOver = false;
transitions = true;