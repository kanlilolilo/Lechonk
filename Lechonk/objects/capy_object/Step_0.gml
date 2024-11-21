// Input checks
if (global.p2_selected_character != capy_object) {
var _key_left = keyboard_check(ord("A"));  // "A" for left
var _key_right = keyboard_check(ord("D")); // "D" for right
var _key_jump = keyboard_check(ord("W"));  // "W" for jump
var _key_dash = keyboard_check(ord("F"));
} else {
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);
var _key_dash = keyboard_check(vk_space); // Dash key input
}
// Movement variables
var _move = _key_right - _key_left;
hsp = _move * walksp;
vsp = vsp + grv;

// Dash variables
if (_key_dash && !is_dashing) {
    dash_timer = dash_duration;
    is_dashing = true;
    dash_speed = dash_base_speed * last_direction; // Dash in the direction the character last moved

    // Create melee hitbox
    if (!instance_exists(melee_hitbox_object)) {
        hitbox = instance_create_layer(x + last_direction * 16, y, "Instances", melee_hitbox_object);
    }
}

// Handle dashing
if (is_dashing) {
    hsp = dash_speed;
    
    // Update hitbox position to follow the player
    if (instance_exists(hitbox)) {
        hitbox.x = x + last_direction * 16;
        hitbox.y = y;
    }
    
    dash_timer--;
    if (dash_timer <= 0) {
        is_dashing = false;

        // Destroy the hitbox when the dash is over
    }
}

// Handle jumping
if (place_meeting(x, y+1, collision_object) && _key_jump) {
    vsp = -7;
}

// Change sprite to walking sprite when moving, or idle when not
if (_key_left || _key_right) {
    sprite_index = capy_walk_sprite;
} else {
    sprite_index = capy_idle_sprite;
}

// Handle sprite flipping based on movement direction
if (_key_left) {
    image_xscale = -1; // Mirror sprite when moving left
} else if (_key_right) {
    image_xscale = 1; // Reset to original when moving right
}

// Handle horizontal movement and collisions
if (place_meeting(x+hsp, y, collision_object)) {
    while (!place_meeting(x+sign(hsp), y, collision_object)) {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// Handle vertical movement and collisions
if (place_meeting(x, y+vsp, collision_object)) {
    while (!place_meeting(x, y+sign(vsp), collision_object)) {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// Update last_direction based on movement keys
if (_key_left) {
    last_direction = -1; // Remember left
} else if (_key_right) {
    last_direction = 1; // Remember right
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
