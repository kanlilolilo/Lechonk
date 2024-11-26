// Check for any mouse button press
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle)) {
    room_goto(StartScreen);  // Go to the Start_Screen room
}

// Check for any keyboard key press
if (keyboard_check_pressed(vk_anykey)) {
    room_goto(StartScreen);  // Go to the Start_Screen room
}
