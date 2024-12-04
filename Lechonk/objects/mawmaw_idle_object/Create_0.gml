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

image_xscale = -0.2;
image_yscale = 0.2;


// Check if the player falls outside the map
if (y > room_height + 100) { // If the player falls below the map
    game_end_sequence(); // Call a script to handle the victory
}
