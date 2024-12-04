function movement_collision() {
    // Define input keys as global variables
    if (global.p2_selected_character != capy_object) {
        global._key_left = keyboard_check(ord("A"));
        global._key_right = keyboard_check(ord("D"));
        global._key_jump = keyboard_check(ord("W"));
        global._key_down = keyboard_check(ord("S"));
        global._key_throw = keyboard_check(vk_shift);
    } else {
        global._key_left = keyboard_check(vk_left);
        global._key_right = keyboard_check(vk_right);
        global._key_jump = keyboard_check(vk_up);
        global._key_down = keyboard_check(vk_down);
        global._key_throw = keyboard_check(vk_control);
    }

    // Resolve potential stuck states
    if (place_meeting(x, y, collision_object) && hsp == 0) {
        y -= 3; // Adjust upward to escape collision
        vsp = 0;
    }

    // Movement variables
    var _move = global._key_right - global._key_left;
    hsp = _move * walksp;
    vsp += grv;

    // Jumping logic
    if (global._key_jump) {
        if (place_meeting(x, y + 1, collision_object)) {
            vsp = -7;
        } else if (place_meeting(x, y + 1, collision_top_object)) {
            vsp = -7;
        }
    }
	
	// Handle sprite flipping based on movement direction
	if (global._key_left) {
		sprite_index = capy_walk_sprite;
	    image_xscale = -1; // Mirror sprite when moving left
	} else if (global._key_right) {
		sprite_index = capy_walk_sprite;
	    image_xscale = 1; // Reset to original when moving right
	} else {
		sprite_index = capy_idle_sprite;
	}

    // Horizontal movement and collisions
    if (place_meeting(x + hsp, y, collision_object)) {
        while (!place_meeting(x + sign(hsp), y, collision_object)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    // Vertical movement and collisions
    if (place_meeting(x, y + vsp, collision_object)) {
        while (!place_meeting(x, y + sign(vsp), collision_object)) {
            y += sign(vsp);
        }
        vsp = 0;
    }

    if (vsp > 0 && place_meeting(x, y + vsp, collision_top_object)) {
        while (!place_meeting(x, y + 1, collision_top_object)) {
            y += 1;
        }
        vsp = 0;
    }

    // Apply vertical movement
    y += vsp;

    // Update last direction
    if (global._key_left) {
        last_direction = -1;
    } else if (global._key_right) {
        last_direction = 1;
    }
}
