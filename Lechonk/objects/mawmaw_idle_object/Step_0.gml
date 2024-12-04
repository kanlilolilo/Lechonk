if (global.p2_selected_character != mawmaw_idle_object) {
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D")); 
var _key_jump = keyboard_check(ord("W"));  
var _key_down = keyboard_check(ord("S"));
var _key_throw = keyboard_check(vk_shift);
} else {
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);
var _key_down = keyboard_check(vk_down);
var _key_throw = keyboard_check(vk_control); // Dash key input
}

// Detect if stuck inside a collision (can't move horizontally)
if (place_meeting(x, y, collision_object) && (hsp == 0)) {
    // If stuck horizontally, try moving up a little to avoid getting stuck in a collision
    y -= 3; // Apply small upward force (adjust value to suit your game)
    vsp = 0; // Reset vertical speed to avoid falling back down immediately
}

// Movement variables
var _move = _key_right - _key_left;
hsp = _move * walksp;
vsp = vsp + grv;

if (_key_jump) {
    if (place_meeting(x, y + 1, collision_object)) {
        vsp = -7; // Jump velocity
    } else if (place_meeting(x, y + 1, collision_top_object)) {
        vsp = -7; // Jump velocity
    }
}

// Change sprite to walking sprite when moving, or idle when not
if (_key_left || _key_right) {
    sprite_index = mawmaw_walk_sprite;
} else {
    sprite_index = mawmaw_idle_sprite;
}

// Handle sprite flipping based on movement direction
if (_key_left) {
    image_xscale = 0.2; // Mirror sprite when moving left
} else if (_key_right) {
    image_xscale = -0.2; // Reset to original when moving right
}

// Handle horizontal movement and collisions
if (place_meeting(x+hsp, y, collision_object)) {
    while (!place_meeting(x+sign(hsp), y, collision_object)) {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// Check for collision with the main collision object
if (place_meeting(x, y + vsp, collision_object)) {
    while (!place_meeting(x, y + sign(vsp), collision_object)) {
        y += sign(vsp);
    }
    vsp = 0;
}

// Check for collision with collision_top_object
if (vsp > 0 && place_meeting(x, y + vsp, collision_top_object)) { 
    // If falling (vsp > 0) and colliding from the top, stop falling
    while (!place_meeting(x, y + 1, collision_top_object)) {
        y += 1;
    }
    vsp = 0;
}

// Apply vertical movement
y += vsp;


// Update last_direction based on movement keys
if (_key_left) {
    last_direction = 1; // Remember left
} else if (_key_right) {
    last_direction = -1; // Remember right
}

// Decrease cooldown timer
if (knockback_cooldown > 0) {
	knockback_cooldown -= 1;
}

if (is_knocked_back) {
	// Apply knockback to position
	x += knockback_x * knockback_multiplier;
	y += abs(knockback_y * knockback_multiplier) * -1;

	// Gradually reduce knockback velocity in the x-direction
	knockback_x *= 0.9;
	knockback_y *= 0.9;

	// Stop knockback entirely when both x and y velocities are small
	if (abs(knockback_x) < 0.1 && abs(knockback_y) < 0.1) {
	    knockback_x = 0;
	    knockback_y = 0;  // Reset knockback_y
	    is_knocked_back = false;  // End knockback state
	}
}

if (y > room_height + 100) { // If the player falls below the map
	game_end_online_sequence(); // Call a script to handle the victory
}

if (_key_throw) {
	sprite_index = mawmaw_attack_sprite
}