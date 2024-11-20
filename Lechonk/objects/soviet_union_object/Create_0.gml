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
