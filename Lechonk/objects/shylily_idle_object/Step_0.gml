// Input checks for WASD keys and Enter key using double quotes
var _key_left = keyboard_check(ord("A"));  // "A" for left
var _key_right = keyboard_check(ord("D")); // "D" for right
var _key_jump = keyboard_check(ord("W"));  // "W" for jump
var _key_throw = keyboard_check(ord("F"));

// Movement variables
var _move = _key_right - _key_left;
hsp = _move * walksp;
vsp = vsp + grv;

if (place_meeting(x, y+1, collision_object) && _key_jump) {
    vsp = -7;
}

// Change sprite to walking sprite when moving, or idle when not
if (_key_left || _key_right) {
    sprite_index = shylily_walk_sprite;
} else {
    sprite_index = shylily_idle_sprite;
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

// Fire bullets based on direction
if (_key_throw) { // Fire when Space is held down
    if (fire_timer <= 0) {
        // Create the bullet
        var bullet = instance_create_layer(x, y, "Instances", shylily_bullet_object);

        // Set bullet speed based on last_direction
        bullet.speed = last_direction * 10;

        // Reset fire timer
        fire_timer = fire_rate;
    }
}

// Decrease the fire timer every step
if (fire_timer > 0) {
    fire_timer--;
}

if (is_knocked_back) {
    // Apply knockback to position
    x += knockback_x;
    y += knockback_y;

    // Gradually reduce knockback velocity
    knockback_x *= 0.9;  // Reduce horizontal velocity
    knockback_y *= 0.9;  // Reduce vertical velocity

    // Stop knockback when velocity is very small
    if (abs(knockback_x) < 0.1 && abs(knockback_y) < 0.1) {
        knockback_x = 0;
        knockback_y = 0;
        is_knocked_back = false;  // End knockback state
    }
}

// Decrease cooldown timer
if (knockback_cooldown > 0) {
    knockback_cooldown -= 1;
}

if (is_knocked_back) {
    // Apply knockback to position
    x += knockback_x;
    y += knockback_y;

    // Gradually reduce knockback velocity
    knockback_x *= 0.9;
    knockback_y *= 0.9;

    // Stop knockback when velocity is very small
    if (abs(knockback_x) < 0.1 && abs(knockback_y) < 0.1) {
        knockback_x = 0;
        knockback_y = 0;
        is_knocked_back = false;  // End knockback state
    }
}

