// Initialize bullet properties
speed = 10;
knockback_power = 5;
knockback_multiplier_increase = 0.26;

// Set the bullet size (smaller size)
image_xscale = 0.2;
image_yscale = 0.2;

image_angle = 90;

// Initial horizontal and vertical speeds
hsp = 0; // Test if it moves left
vsp = -3; // Starting vertical speed
bullet_id = -1;

//alarms for turning and gravity because stofzuiger
alarm[0] = (5);
alarm[1] = (10);
alarm[2] = (25);
alarm[3] = (20);
alarm[4] = (25);
alarm[5] = (30);