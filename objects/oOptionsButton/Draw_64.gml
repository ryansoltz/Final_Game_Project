draw_set_font(fOther);

if (isHover && !global.options) {
    draw_set_alpha(1);
}
else {
    draw_set_alpha(0.85);
}

draw_text_transformed(x, y, text, 0.7, 0.7, 0);
draw_set_alpha(1);
draw_set_color(c_white);