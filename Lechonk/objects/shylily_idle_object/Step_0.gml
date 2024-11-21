// Input checks
if (global.p2_selected_character != shylily_idle_object) {
var _key_left = keyboard_check(ord("D"));  // "A" for left
var _key_right = keyboard_check(ord("G")); // "D" for right
var _key_jump = keyboard_check(ord("R"));  // "W" for jump
var _key_throw = keyboard_check(ord("A"));
} else {
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);
var _key_throw = keyboard_check(vk_control); // Dash key input
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

// Detect if stuck inside a collision (can't move horizontally)
if (place_meeting(x, y, collision_object) && (hsp == 0)) {
    // If stuck horizontally, try moving up a little to avoid getting stuck in a collision
    y -= 3; // Apply small upward force (adjust value to suit your game)
    vsp = 0; // Reset vertical speed to avoid falling back down immediately
}

// Update last_direction based on movement keys
if (_key_left) {
    last_direction = -1; // Remember left
} else if (_key_right) {
    last_direction = 1; // Remember right
}

// Fire bullets based on direction and check if the minigun is overheated
if (_key_throw && minigun_heat < max_heat) { // Fire when F is pressed and not overheated
    if (fire_timer <= 0) {
        // Create the bullet
        var bullet = instance_create_layer(x, y, "Instances", shylily_bullet_object);

        // Set bullet speed based on last_direction
        bullet.speed = last_direction * 10;
        bullet.bullet_direction = last_direction;

        // Reset fire timer
        fire_timer = fire_rate;

        // Increase heat after firing
        minigun_heat += heat_per_shot;

        // Ensure the heat doesn't exceed the max limit
        if (minigun_heat > max_heat) {
            minigun_heat = max_heat;
        }
    }
}

// Decrease the fire timer every step
if (fire_timer > 0) {
    fire_timer--;
}

// Cool down the minigun if it's not firing
if (minigun_heat > 0 && !_key_throw) {
    minigun_heat -= cool_down_rate;
    if (minigun_heat < 0) {
        minigun_heat = 0;  // Prevent heat from going below 0
    }
}

// Overheating logic: When heat exceeds max, prevent firing
if (minigun_heat >= max_heat) {
    // Prevent firing until cool down
    fire_timer = fire_rate; // Optional: Prevent firing temporarily even if button is pressed
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
