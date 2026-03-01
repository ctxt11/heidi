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

// oGameManager Draw GUI Event
if (show_win_screen) {
    // 1. Black background
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // 2. "YOU WIN!" Text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _screen_w = display_get_gui_width() / 2;
    var _screen_h = display_get_gui_height() / 2;
    
    draw_text(_screen_w, _screen_h - 40, "YOU WIN!"); // Moved up slightly
    
    // 3. Final Time (Moved further down)
    // We change "+ 20" to "+ 60" to push it lower
    var _seconds = level_timer / game_get_speed(gamespeed_fps);
    draw_text(_screen_w, _screen_h + 60, "FINAL TIME: " + string_format(_seconds, 0, 2) + "s");
}

// Use these variables so the UI always stays relative to the screen size
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// 1. Get the screen dimensions
var _gui_w = display_get_gui_width();

// 2. Only show the timer if we are NOT in the menu or mode select rooms
if (room != menu_room && room != modeselect) {
    if (!show_win_screen) {
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_set_valign(fa_top);
        
        var _seconds = level_timer / game_get_speed(gamespeed_fps);
        draw_text(_gui_w - 20, 20, "TIME: " + string_format(_seconds, 0, 2));
    }
}