// Input 
var _input = rollback_get_input();

var _key_left = _input.a
var _key_right = _input.d 
var _key_jump = _input.w; 
var _key_throw = _input.space
var _key_rightswitch = _input.right

//if (room == wait) {
//	room_goto(wait_2)
//}

if (_key_rightswitch && start_timer == false) {
	key_pressed = 1
}

if (!_key_rightswitch && key_pressed == 1) {
	 if (character = 3) {
        character = 2
		key_pressed = 0
		
		//stats capy
		sprite_index = capy_idle_sprite;
		hsp = 0;
vsp = 0;
grv = 0.4;
walksp = 3.2;
fire_rate = 60;
fire_timer = 0;
last_direction = 1; // Default to facing right
// Create event (initialize knockback variables)
knockback_x = 0;  // Horizontal knockback velocity
knockback_y = 0;  // Vertical knockback velocity
knockback_cooldown = 0;  // Initialize cooldown
is_knocked_back = false;  // Whether the object is in a knockback state
knockback_cooldown = 0;  // Initialize cooldown
knockback_multiplier = 1; // Starts at 1
max_knockback_multiplier = 5; // Cap the multiplier to avoid excessive knockback
// Initialize vibration control variables
vibration_offset = 0;
vibration_strength = 5; // The maximum displacement for the vibration (in pixels)
vibration_speed = 5;    // How fast the bar vibrates (higher value = faster vibration)
dash_timer = 10;
image_xscale = 1
image_yscale = 1
		
    } else if (character = 2) {
        character = 1
		key_pressed = 0
		
		//stats shylily
		sprite_index = shylily_idle_sprite;
		hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 2.8;
fire_rate = 5; // How many steps between each bullet
fire_timer = 0; // Counts steps to manage firing timing
last_direction = 1; // Default to facing right
// Create event (initialize knockback variables)
knockback_x = 0;  // Horizontal knockback velocity
knockback_y = 0;  // Vertical knockback velocity
is_knocked_back = false;  // Whether the object is in a knockback state
knockback_cooldown = 0;  // Initialize cooldown
knockback_multiplier = 1; // Starts at 1
max_knockback_multiplier = 5; // Cap the multiplier to avoid excessive knockback
// Initialize heat variables
minigun_heat = 0;  // Current heat level of the minigun
max_heat = 100;    // Maximum heat before the minigun overheats
heat_per_shot = 2; // Amount of heat the minigun generates per shot
cool_down_rate = 0.5; // Rate at which the minigun cools down per step (when not firing)
image_xscale = 1
image_yscale = 1

		
    } else if (character = 1) {
	    character = 3
		key_pressed = 0
		
		//soviet stats
		sprite_index = soviet_union_sprite
		
		hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 3.2;
fire_rate = 60;
fire_timer = 0;
last_direction = 1; // Default to facing right
// Create event (initialize knockback variables)
knockback_x = 0;  // Horizontal knockback velocity
knockback_y = 0;  // Vertical knockback velocity
knockback_cooldown = 0;  // Initialize cooldown
is_knocked_back = false;  // Whether the object is in a knockback state
knockback_cooldown = 0;  // Initialize cooldown
knockback_multiplier = 1; // Starts at 1
max_knockback_multiplier = 5; // Cap the multiplier to avoid excessive knockback
// Initialize vibration control variables
vibration_offset = 0;
vibration_strength = 5; // The maximum displacement for the vibration (in pixels)
vibration_speed = 5;    // How fast the bar vibrates (higher value = faster vibration)

image_xscale = 0.2
image_yscale = 0.2

	}
}


if (start_timer == true) {
	depth = 0
if (character == 1) {
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

		bullet.bullet_id = player_id
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


}

//----------------------------------

if (character == 2) {
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

		bullet.bullet_id = player_id
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
   // game_end_sequence(); // Call a script to handle the victory
}
}

//--------------------------------------------------------------------------

if (character == 3) {
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
        var bullet = instance_create_layer(x, y, "Instances", vork_object);

		bullet.bullet_id = player_id
        // Set bullet speed based on last_direction
        bullet.speed = last_direction * 10;
		bullet.bullet_direction = last_direction

        // Reset fire timer
        fire_timer = fire_rate;
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
}
}

//if (y > room_height + 100) { // If the player falls below the map
//   game_end_sequence(); // Call a script to handle the victory
//}