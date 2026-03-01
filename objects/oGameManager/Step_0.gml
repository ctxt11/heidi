// 1. Determine if we are actually playing a level
var _is_playing = (room == room_game || room == hardgameplaceholder);

// 2. Timer Logic
if (_is_playing) {
    // Only count up if the win screen isn't showing
    if (!show_win_screen) {
        level_timer += 1;
    }
} else {
    // If we are in Menu or Mode Select, force timer to 0
    level_timer = 0;
}

// 3. Red Screen Fade Logic
if (vignette_alpha > 0) {
    vignette_alpha -= 0.01; 
}

// 4. Music Logic (If win screen is triggered by the Player)
if (show_win_screen) {
    if (audio_is_playing(snd_background_music)) {
        audio_stop_sound(snd_background_music);
    }
}