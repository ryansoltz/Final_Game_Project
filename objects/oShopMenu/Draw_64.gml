draw_set_colour(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, guiWidth, guiHeight, 0);
draw_set_alpha(0.5);
draw_rectangle(menuMargin, 0, menuMargin + menuWidth, guiHeight, 0);
draw_set_alpha(1);
draw_set_colour(c_white);

for (var i = 0; i < itemCount; i++) {
    
    var arr = items[| i];
    var item = arr[0];
    
    var _x = menuMargin + menuWidth / 2;
    var _y = (guiHeight / 2) + (i - selected) * 64;
    
    var s = 0.8;
    if (i == selected) {
        s = 1;
    }
    if (i == selected) {
        item = "> " + item + " <";
    }
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fText);
    draw_text_transformed(_x, _y, item, s, s, 0);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    
}

var arr = items[|selected];
var item = arr[0];
var price = scrGetPrice(item);
var desc = arr[1];

var _x = (menuMargin + menuWidth) + previewWidth / 2;
var _y = (guiHeight / 2);

var spr = scrGetProperName(item);

if (spr != -1) {
    
    draw_sprite_ext(spr, 0, _x, _y - 24, 0.6, 0.6, 0, c_white, 1);
    
}

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fText);
    draw_text(_x, _y + 80, desc);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);

width = 120;
height = 30;
margin = 70;
spacing = 40;

draw_sprite_ext(sHeartUI, 0, width - margin , height, 0.15, 0.15, 0, c_white, 0.7);

draw_set_font(fNumbers);
draw_set_color(#ae3535);
draw_set_alpha(0.7);
draw_text_transformed(width - margin, height + spacing, string(global.playerHP), 0.8, 0.8, 0);
draw_set_alpha(1);
draw_sprite_ext(sCoinUI, 0, width - margin, height + (spacing * 2) + 20, 0.15, 0.15, 0, c_white, 0.7);
draw_set_alpha(0.7);
draw_set_color(#d0834c);
draw_text_transformed(width - margin, height + (spacing * 3) + 20, string(global.coins), 0.8, 0.8, 0);
draw_set_color(#ffffff);
draw_set_font(fText);

guideHeight = 720 - 80;
spacing = 24;
draw_text_transformed(width - margin - 24, guideHeight, "(A/D) Browse", 0.6, 0.6, 0);
draw_text_transformed(width - margin - 24, guideHeight + spacing, "(E) Buy Item", 0.6, 0.6, 0);
draw_text_transformed(width - margin - 24, guideHeight + (spacing * 2), "(ESC) Leave", 0.6, 0.6, 0);
draw_set_alpha(1);

draw_set_valign(fa_bottom);

if (price != "Max") {
    
    draw_text(menuMargin + menuWidth + 4, guiHeight - 4, "Cost: " + string(price));
    
}
else {
    
    draw_text(menuMargin + menuWidth + 4, guiHeight - 4, "Max Upgrade Reached");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);



