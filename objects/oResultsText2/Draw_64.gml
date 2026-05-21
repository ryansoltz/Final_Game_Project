draw_set_font(fOtherSM);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(1);

guiW = display_get_gui_width();
guiH = display_get_gui_height();

labelX = guiW * 0.5 - 200;
valueX = guiW * 0.5 + 120;
startY = guiH * 0.25;
lineGap = 85;

for (var i = 0; i < array_length(shownLines); i++) {
    
    line = shownLines[i];
    yPos = startY + (i * lineGap);
    
    if (is_array(line)) {
        
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        
        draw_text(labelX, yPos, line[0]);
        draw_text(valueX, yPos, line[1]);
    }
    
    else {
        
        if (line == "All Enemies Cleared!") {
            
            draw_set_color(#0fc664);
            
        }
        else if (line == "Mission Failed") {
            
            draw_set_color(#501d1d);
            
        }
        else {
            
            draw_set_color(c_white);
            
        }
        
        draw_set_halign(fa_center);
        draw_text((guiW * 0.5) - 16, yPos, line);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);