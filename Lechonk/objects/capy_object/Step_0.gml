// Input checks
if (global.p2_selected_character != capy_object) {
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

if (_key_throw) { // Fire when the attack button is held down
    if (fire_timer <= 0) {
        // Create the bullet
        var bullet = instance_create_layer(x, y, "Instances", melee_hitbox_object);

        // Set bullet speed and direction based on last_direction
        bullet.speed = last_direction * 10;
        bullet.bullet_direction = last_direction; // Use direction, not last_direction * 10

        // Reset fire timer
        fire_timer = fire_rate;

        // Dash when firing
        var dash_speed = 10; // Set the dash speed
        var dash_duration = 10; // Set the number of frames the dash lasts
        hspeed = dash_speed * last_direction; // Horizontal dash speed based on last_direction
        dash_timer = dash_duration;
    }
}

// If the dash timer is active, stop moving after dash duration
if (dash_timer > 0) {
    dash_timer -= 1;
    if (dash_timer <= 0) {
        hspeed = 0; // Stop horizontal movement after dash
        vspeed = 0; // Stop vertical movement after dash
    }
}

// Decrease the fire timer every step
if (fire_timer > 0) {
    fire_timer--;
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
    game_end_sequence(); // Call a script to handle the victory
}
// Change sprite based on movement state
if (_key_down) {
    // Change to down sprite if the down key is pressed
    sprite_index = capy_down_sprite;
} else if (vsp < 0) {
    // Moving upwards
    sprite_index = capy_jump_sprite;
    image_index = 0; // Set to first frame of the jump sprite
} else if (vsp > 0) {
    // Moving downwards
    sprite_index = capy_jump_sprite;
    image_index = 1; // Set to second frame of the jump sprite
} else if (_key_left || _key_right) {
    // Moving horizontally on the ground
    sprite_index = capy_walk_sprite;
} else {
    // Idle on the ground
    sprite_index = capy_idle_sprite;
}

