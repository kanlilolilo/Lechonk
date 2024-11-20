var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);

var _move = _key_right - _key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y+1, collision_object) && _key_jump) {
    vsp = -7;
}

// Change sprite to walking sprite when moving, or idle when not
if (_key_left || _key_right) {
    sprite_index = shylily_walk_sprite; // Set sprite to walking sprite
} else {
    sprite_index = shylily_idle_sprite; // Set to idle sprite when not moving
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
