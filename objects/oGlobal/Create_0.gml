randomize();

//Game Info

//The time left in the current day
global.timeLeft = 25000;
//The current state of the game ("game" for in game, "shop" for shop, etc.)
global.currentState = "Title";
//The current day of a job you are on
global.currentDay = 0;
//Days remaining in the job
global.daysRemaining = 0;
//The current job you are on, 0 for tutorial
global.currentJob = 0;
//Number of total enemies there were for the day
global.totalEnemies = 0;
//How many enemies there were to start on a job
global.startJobEnemies = 0;
//The enemies left of the current job
global.enemiesLeft = 0;
global.hasRadar = false;
global.countCoins = 0;
global.currentSurface = "";

//Player Info

global.playerHPMax = 20;
global.playerHP = global.playerHPMax;
global.coins = 0;
global.airUpgrade = 0;
global.attackUpgrade = 0;
global.boardUpgrade = 0;
global.hpUpgrade = 0;
global.playerDamage = 1;
global.noInp = false;


//Costs

global.boardCosts = [30, 75, "Max"];
global.airCosts = [15, 30, 45, 65, 90, "Max"];
global.healthCosts = [15, 25, 40, 55, 70, 90, "Max"];
global.attackCosts = [35, 60, 100, "Max"];

//Only 2 levels for now, may add more one day
global.enemyCounts = [12, 24, 36];
global.playerXSpawns = [300, 564, 4093];
global.playerYSpawns = [300, 1522, 4099];
global.boardXSpawns = [360, 593, 4125];
global.boardYSpawns = [380, 1610, 4221];

//Pop-ups

//If the tutorial warning has popped up on first playthrough, set to true afterwards
//global.tutorialWarning = false;
global.tutorial1 = false;
global.tutorial2 = false;
global.resultsTut = false;
global.shopTut = false;
//If warnings for if the player has been KOed or slept for the first time
global.KOWarning = false;
global.timeoutWarning = false;
global.warningToGive = "";


//Options

//If the tutorial is on or not.
global.tutorial = true;
global.music = true;
global.options = false;

