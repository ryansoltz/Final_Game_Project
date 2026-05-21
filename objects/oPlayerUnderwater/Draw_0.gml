
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


if (hp == 0) {
    
    draw_sprite(sEyes, 3, x + lengthdir_x(6, dir), y + lengthdir_y(6, dir));
    
}
else if (invuln > 0) {
    
    draw_sprite(sEyes, 2, x + lengthdir_x(6, dir), y + lengthdir_y(6, dir));
    
}
else if (air > 0) {
    
    draw_sprite(sEyes, 0, x + lengthdir_x(6, dir), y + lengthdir_y(6, dir));
    
}
else {
    
    draw_sprite(sEyes, 1, x + lengthdir_x(6, dir), y + lengthdir_y(6, dir));
    
}


if (y < 60) {
    
    arrowX = x;
    arrowY = y + 48; 
    
    draw_set_alpha(0.8);
    draw_set_color(#ffffff);
    draw_triangle(arrowX - 12, arrowY, arrowX + 12, arrowY, arrowX, arrowY - 16, false);
    
}

draw_set_alpha(0.8);