if (keyboard_check_pressed(vk_escape)) {
    instance_create_layer(0, 0, "Instances", oShopText2);
    //shopOpen = false;
    instance_destroy();
}

if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_down)) {
    
    audio_play_sound(sfxChangeItem, 2, 0);
    selected = selected + 1;
    
    if (selected == itemCount) {
        selected = 0;
    }
    
    
}

if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_up)) {
    
    audio_play_sound(sfxChangeItem, 2, 0);
    selected = selected - 1;
    
    if (selected < 0) {
        selected = itemCount - 1;
    }
    
    
}

var arr = items[|selected];
var item = arr[0];
var price = scrGetPrice(item);

if ((keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E")))) {
    
    if (price != "Max") {
        
       if (global.coins >= price) {
           
           if(item == "Heal") {
               
               if (global.playerHP < global.playerHPMax) {
                   
                   audio_play_sound(sfxPurchase, 2, 0);
                   global.playerHP = min(global.playerHP + 10, global.playerHPMax);
                   global.coins = global.coins - price;                
                   
               }
               else {
                   
                   audio_play_sound(sfxCantPurchase, 2, 0);
               }
   
           
           }
           else {
               
               audio_play_sound(sfxPurchase, 2, 0);
               scrBuyItem(item);
               global.coins = global.coins - price;
               
           }
           
           
       }
       else {
           
           audio_play_sound(sfxCantPurchase, 2, 0);
           
       }
    }
    else {
        audio_play_sound(sfxCantPurchase, 2, 0);
    }
    
    
}
