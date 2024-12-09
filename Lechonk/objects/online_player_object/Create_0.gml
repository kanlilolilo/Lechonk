character = 1;
character_name = "shylily"
key_pressed = 0;
key_pressed2 = 0;
depth = -10;
start_timer = false
alarm[0] = 300
can_jump = true
can_jump2 = true
jump_timer = 0; // Timer to delay the double jump

switch_character = false

is_following = false;
input_disabled = false;
attack_cooldown = 0
attack_duration = 0
mawmaw_full = false

knockback_power = 20;
knockback_multiplier_increase = 0.04;

can_double_jump = false;
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
// Initialize vibration control variables
vibration_offset = 0;
vibration_strength = 5; // The maximum displacement for the vibration (in pixels)
vibration_speed = 5;    // How fast the bar vibrates (higher value = faster vibration)
dash_timer = 10;











//-------------------------------------
if (player_id == 0)
{
    x = 2560
}
else if (player_id == 1)
{
    x = 2272
}

y = 256