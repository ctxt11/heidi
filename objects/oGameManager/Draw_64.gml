// Draw Red Vignette if we hit a spike
if (vignette_alpha > 0) {
    draw_set_color(c_red);
    draw_set_alpha(vignette_alpha);
    // Draws a rectangle over the whole screen
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}

// Draw Win Screen
if (show_win_screen) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "YOU WIN!");
}