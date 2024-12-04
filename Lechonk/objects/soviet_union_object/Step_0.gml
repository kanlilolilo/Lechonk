if (global.p2_selected_character != soviet_union_object) {
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

// Change sprite to walking sprite when moving, or idle when not
if (global._key_left || global._key_right) {
    sprite_index = soviet_union_walk_sprite;
} else {
    sprite_index = soviet_union_sprite;
}

soviet_player()