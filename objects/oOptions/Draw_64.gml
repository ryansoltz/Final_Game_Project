draw_set_alpha(0.6);
draw_set_color(#000000);
boxX = 420;
boxY = 220;
boxW = 860;
boxH = 500;
draw_rectangle(boxX, boxY, boxW, boxH, false);
draw_set_alpha(0.8);
draw_set_color(#ffffff);

for (var i = 0; i < 8; i++) {
    
    draw_rectangle(boxX - i, boxY - i,  boxW + i,  boxH + i, true);
    
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fText);

draw_text(520, 280, tutorialText);
draw_text(520, 340, musicText);
draw_text(520, 420, closeText);

draw_set_alpha(1);
draw_set_color(c_white);