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

if (global._key_left || global._key_right) {
    sprite_index = shylily_walk_sprite;
} else {
    sprite_index = shylily_idle_sprite;
}

shylily_player();

if (y > room_height + 100) { // If the player falls below the map
	game_end_sequence(); // Call a script to handle the victory
}