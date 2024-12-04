if (state == "fadein") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "fadeout";
        alarm[0] = 200;
    }
}

if (state == "fadeout") {
    alpha -= fade_speed; // Fade out
    if (alpha <= 0) {
        alpha = 0;
        room_goto(TitleScreen); // Ga naar de volgende room
    }
}

// Check for any mouse button press
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle)) {
	TransitionStart(TitleScreen, sq_fade_out, sq_fade_in)
}

// Check for any keyboard key press
if (keyboard_check_pressed(vk_anykey)) {
	TransitionStart(TitleScreen, sq_fade_out, sq_fade_in)
}

