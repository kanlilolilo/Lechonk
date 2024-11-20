hsp = 0;
vsp = 0;
grv = 0.3;
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
// Initialize vibration control variables
vibration_offset = 0;
vibration_strength = 5; // The maximum displacement for the vibration (in pixels)
vibration_speed = 5;    // How fast the bar vibrates (higher value = faster vibration)
