// 1. Horizontal Movement & Direction
x_speed = 0; 
if (visible) { // Only allow movement if the player hasn't died/won yet
    if keyboard_check(vk_right) {
        x_speed = movement_speed;
        image_xscale = -1; 
    } else if keyboard_check(vk_left) {
        x_speed = -movement_speed;
        image_xscale = 1; 
    }
}

// 2. Gravity & Jumping
y_speed += grav; 
move_and_collide(x_speed, y_speed, oSolid);

if (place_meeting(x, y + 1, oSolid)) {
    if (keyboard_check_pressed(vk_space) && visible) {
        y_speed = -7; 
    } else {
        y_speed = 0; 
    }
}

// 3. Death Logic (Spikes OR Falling out of bounds)
// We check if Y is greater than room_height (fell down)
if (place_meeting(x, y, oSpikes) || y > room_height || y < 0 || x > room_width || x < 0) {
    if (visible) { // Only trigger this once
        if (instance_exists(oGameManager)) {
            oGameManager.vignette_alpha = 0.6; 
        }
        visible = false; 
        x_speed = 0;
        y_speed = 0;
        // Start 3-second timer
        alarm[0] = game_get_speed(gamespeed_fps) * 3; 
    }
}

// 4. Win Logic (Flag)
if (place_meeting(x, y, oFlag)) {
    if (visible) {
        if (instance_exists(oGameManager)) {
            oGameManager.show_win_screen = true; 
        }
        visible = false;
        x_speed = 0;
        y_speed = 0;
        
        // This starts the countdown. When it hits 0, Alarm 1 runs.
        if (alarm[1] == -1) { 
            alarm[1] = game_get_speed(gamespeed_fps) * 4; 
        }
    }
}