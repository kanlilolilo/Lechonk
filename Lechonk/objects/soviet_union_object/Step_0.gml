if (!input_disabled) {

if (global.p2_selected_character != soviet_union_object) {
global._key_left = keyboard_check(ord("A"));
global._key_right = keyboard_check(ord("D"));
global._key_jump = keyboard_check(ord("W"));
global._key_down = keyboard_check(ord("S"));
global._key_throw = keyboard_check(ord("1"));
global._key_throw2 = keyboard_check(ord("2"));

} else {
global._key_left = keyboard_check(vk_left);
global._key_right = keyboard_check(vk_right);
global._key_jump = keyboard_check(vk_up);
global._key_down = keyboard_check(vk_down);
global._key_throw = keyboard_check(191);
global._key_throw = keyboard_check(190);
}

	movement_collision();

	soviet_player()

	if (y > room_height + 100) { // If the player falls below the map
		game_end_sequence(); // Call a script to handle the victory
	}
}