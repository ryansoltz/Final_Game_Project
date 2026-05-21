

if ((invuln > 105) || (invuln < 91 && invuln > 75) || (invuln < 61 && invuln > 45) || (invuln < 31 && invuln > 15)) {
    
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, 0.45);
    
}
else if ((invuln < 106 && invuln > 90) || ( invuln < 76 && invuln > 60) || ( invuln < 46 && invuln > 30) || ( invuln < 16 && invuln > 0)) {
    
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, 0.6);
    
}
else {
    
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, 1);
    
}
