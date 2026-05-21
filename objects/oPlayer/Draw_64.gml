width = 120;
height = 30;
margin = 70;

var x1 = display_get_gui_width() - width - margin - 80;
var y1 = margin - 24;
var x2 = x1 + width;  
var y2 = y1 + height - 5;

draw_sprite_ext(sHeartUI, 0, width - margin , height, 0.25, 0.25, 0, c_white, 1);
draw_sprite_ext(sCoinUI, 0, width - margin, height + 80, 0.25, 0.25, 0, c_white, 1);

cx = x2 + 70;
cy = y1 + (height * 0.5);
ammtFill = clamp(global.timeLeft / 25000, 0, 1);
draw_set_alpha(0.6);
draw_set_color(#ffffff);

if (global.timeLeft < 3125) {
    
    
    
    if ((3094 < global.timeLeft && global.timeLeft < 3124) || (3034 < global.timeLeft && global.timeLeft < 3064) || (2974 < global.timeLeft && global.timeLeft < 3004) ) {
        
        draw_set_alpha(0.9);
        draw_set_colour(#e13a34);
        
    }
    else {
        
        draw_set_alpha(0.75)
        draw_set_colour(#c8241e);
        
    }
}
    
startAngle = 90;
totalAngle = 360 * ammtFill;
steps = 40;
draw_primitive_begin(pr_trianglefan);
draw_vertex(cx, cy);

for (var i = 0; i <= steps; i++) {
    
    a = startAngle + (totalAngle * (i / steps));
    draw_vertex(cx + lengthdir_x(28, a), cy + lengthdir_y(28, a));
    
}

draw_primitive_end();
draw_set_color(#ffffff);
draw_set_alpha(1);


draw_set_alpha(0.85);
draw_set_font(fNumbers);
draw_set_color(#ae3535);
draw_text_transformed(width - margin + 74, height, string(hp), 1, 1, 0);
draw_set_color(#d0834c);
draw_text_transformed(width - margin + 74, height + 80, string(global.coins), 1, 1, 0);
draw_set_alpha(1);
draw_set_color(#ffffff);


