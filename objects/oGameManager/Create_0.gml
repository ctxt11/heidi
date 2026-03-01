vignette_alpha = 0;
show_win_screen = false;

// oGameManager Create Event
level_timer = 0;
final_time = 0;
show_timer = true;


if (!audio_is_playing(snd_background_music)) {

    audio_play_sound(snd_background_music, 10, true);
}