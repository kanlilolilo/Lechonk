if (global.p2_selected_character != shylily_idle_object) {
	global._key_left = keyboard_check(ord("A"));
	global._key_right = keyboard_check(ord("D"));
	global._key_jump = keyboard_check(ord("W"));
	global._key_throw = keyboard_check(vk_shift);
} else {
	global._key_left = keyboard_check(vk_left);
	global._key_right = keyboard_check(vk_right);
	global._key_jump = keyboard_check(vk_up);
	global._key_throw = keyboard_check(vk_control);
}

movement_collision();

// Handle sprite flipping based on movement direction
if (global._key_left) {
    image_xscale = -1; // Mirror sprite when moving left
} else if (global._key_right) {
    image_xscale = 1; // Reset to original when moving right
}

shylily_player();
