// Input checks
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);
var _key_throw = keyboard_check_pressed(vk_enter); // Check if ENTER is pressed

// Movement variables
var _move = _key_right - _key_left;
hsp = _move * walksp;
vsp = vsp + grv;

if (place_meeting(x, y+1, collision_object) && _key_jump) {
    vsp = -7;
}

// Change sprite to walking sprite when moving, or idle when not
if (_key_left || _key_right) {
    sprite_index = soviet_union_walk_sprite;
} else {
    sprite_index = soviet_union_sprite;
}

// Handle sprite flipping based on movement direction
if (_key_left) {
    image_xscale = -0.2; // Mirror sprite when moving left
} else if (_key_right) {
    image_xscale = 0.2; // Reset to original when moving right
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


// Fire bullets based on direction
if (keyboard_check(vk_space)) { // Fire when Space is held down
    if (fire_timer <= 0) {
        // Create the bullet
        var bullet = instance_create_layer(x, y, "Instances", vork_object);

        // Update last_direction based on movement keys
        if (_key_left) {
            last_direction = -1; // Remember left
        } else if (_key_right) {
            last_direction = 1; // Remember right
        }

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
