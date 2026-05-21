function scrGetPrice(item){
    
    
    if (item == "HP Upgrade") {
        
        return global.healthCosts[global.hpUpgrade];
        
    }
    else if (item == "Air Upgrade") {
        
        return global.airCosts[global.airUpgrade];
        
    }
    else if (item == "Attack Upgrade") {
        
        return global.attackCosts[global.attackUpgrade];
        
    }
    else if (item == "Board Upgrade") {
        
        return global.boardCosts[global.boardUpgrade];
        
    }
    else if (item == "Heal"){
        
        return 10;
        
    }
    return "Max";
    

}