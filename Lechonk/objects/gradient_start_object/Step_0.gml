// Check for any mouse button press
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle)) {
	TransitionStart(StartScreen, sq_fade_out, sq_fade_in)
}

// Check for any keyboard key press
if (keyboard_check_pressed(vk_anykey)) {
	TransitionStart(StartScreen, sq_fade_out, sq_fade_in)
}
