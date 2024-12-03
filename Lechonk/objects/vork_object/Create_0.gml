// Initialize bullet properties
speed = 8;
knockback_power = 12;
knockback_multiplier_increase = 0.33;

// Set the bullet size (smaller size)
image_xscale = 0.2;
image_yscale = image_xscale;

// Initial horizontal and vertical speeds
hsp = 0; // Test if it moves left
vsp = -2; // Starting vertical speed
gravity = 0.1; // Gravity factor to increase vsp over time
bullet_id = -1;