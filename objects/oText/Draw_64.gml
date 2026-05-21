boxX = 80;
boxY = display_get_gui_height() - 180;
boxW = display_get_gui_width() - 160;
boxH = 120;
draw_set_alpha(0.6);
draw_set_color(#31a1bd);
draw_rectangle(boxX, boxY, boxX + boxW, boxY + boxH, false);
draw_set_alpha(0.8);
draw_set_color(#124766);

for (var i = 0; i < 8; i++) {
    
    draw_rectangle(boxX - i, boxY - i, boxX + boxW + i, boxY + boxH + i, true);
    
}

draw_set_font(fText);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_ext(boxX + 24, boxY + 24, current, 36, boxW - 48);
draw_set_color(c_white);
draw_set_alpha(1);
