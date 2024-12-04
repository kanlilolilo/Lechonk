function movement_collision() {

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
