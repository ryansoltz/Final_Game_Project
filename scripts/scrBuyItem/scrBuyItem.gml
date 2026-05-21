function scrBuyItem(item){
    
    if (item == "HP Upgrade") {
        
        global.playerHPMax = global.playerHPMax + 10;
        global.hpUpgrade = global.hpUpgrade + 1;
        global.playerHP = global.playerHPMax;
    }
    else if (item == "Air Upgrade") {
        
        global.airUpgrade = global.airUpgrade + 1;
        
        
    }
    else if (item == "Attack Upgrade") {
        
        global.attackUpgrade = global.attackUpgrade + 1;
        global.playerDamage = global.playerDamage + 1;
        
        
    }
    else if (item == "Board Upgrade") {
        
        global.boardUpgrade = global.boardUpgrade + 1;
        
    }
    

}