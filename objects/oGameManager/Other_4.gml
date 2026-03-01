// oGameManager Room Start Event
if (room == menu_room) {
    level_timer = 0; // Only reset to 0 if we are back at the main menu
}

show_win_screen = false;
vignette_alpha = 0;

// Ensure music stays playing
if (!audio_is_playing(snd_background_music)) {
    audio_play_sound(snd_background_music, 10, true);
}