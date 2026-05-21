/*
if (!board && !place_meeting(x, y, sand) && waterSprite < 60) {
    
    draw_sprite(sWaterUnder, 0, x, y);
    
}
else if (!board && !place_meeting(x, y, sand) && waterSprite > 60) {
    
    draw_sprite(sWaterUnder, 1, x, y);
    
}
 */

dir = point_direction(x, y, mouse_x, mouse_y);

if ((invuln > 105) || (invuln < 91 && invuln > 75) || (invuln < 61 && invuln > 45) || (invuln < 31 && invuln > 15)) {
    
    draw_sprite(sprite_index, 2, x, y);
    
}
else if ((invuln < 106 && invuln > 90) || ( invuln < 76 && invuln > 60) || ( invuln < 46 && invuln > 30) || ( invuln < 16 && invuln > 0)) {
    
    draw_sprite(sprite_index, 1, x, y);
    
}
else {
    
    draw_sprite(sprite_index, 0, x, y);
    
}

if (invuln > 0) {
    
    draw_sprite_ext(sEyes2, 1, x + lengthdir_x(14, dir), y + lengthdir_y(14, dir), 1, 1, dir, c_white, 1);
    
}
else {
    
    draw_sprite_ext(sEyes2, 0, x + lengthdir_x(14, dir), y + lengthdir_y(14, dir), 1, 1, dir, c_white, 1);
    
}





if (!board && distance_to_object(oBoard) < 16) {
    
    bord = instance_nearest(x, y, oBoard);
    
    if (bord != noone) {
        
        draw_set_alpha(0.9);
        draw_set_color(#ffffff);
        arrowX = bord.x;
        arrowY = bord.y - 60;
        draw_triangle(arrowX - 16, arrowY, arrowX + 16, arrowY, arrowX, arrowY + 20, false);
    }
}

if (!board && distance_to_object(oDeepWater) < 3) {
    
    wadder = instance_nearest(x, y, oDeepWater);
    
    if (wadder != noone) {
        
        draw_set_alpha(0.9);
        draw_set_color(#ffffff);
        arrowX = wadder.x;
        arrowY = wadder.y - 60;
        draw_triangle(arrowX - 16, arrowY, arrowX + 16, arrowY, arrowX, arrowY + 20, false);
        
    }
}


if (!board && distance_to_object(oDock) < 4) {
    
    duck = instance_nearest(x, y, oDock);
    
    if (duck != noone) {
        
        draw_set_alpha(0.9);
        draw_set_color(#ffffff);
        arrowX = duck.x + 80;
        arrowY = duck.y - 30;
        draw_triangle(arrowX - 16, arrowY, arrowX + 16, arrowY, arrowX, arrowY + 20, false);
        
    }
}

draw_set_font(fText);

if (distance_to_object(oShop) < 16 && global.coins >= 5) {
    
    draw_text_transformed(x - 20, y + 20, "BUY", 1, 1, 0);
    
}

if (distance_to_object(oExit) < 16 ) {
    
    draw_text_transformed(x - 20, y + 20, "EXIT", 1, 1, 0);
    
}

//draw_set_alpha(0.5);
//draw_rectangle(left, top, right, bottom, true);

draw_set_alpha(1);

