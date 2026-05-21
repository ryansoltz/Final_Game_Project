draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(#000000);
draw_set_font(fText);
draw_text_transformed( display_get_gui_width() - 80, display_get_gui_height() - 20, "Loading...", 1, 1, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);