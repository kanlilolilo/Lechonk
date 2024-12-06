function capy_stats(){	
	character_name = "capy"
	
	is_following = false;
	input_disabled = false;
	attack_cooldown = 0
	attack_duration = 0
	mawmaw_full = false
	
	knockback_power = 20;
	knockback_multiplier_increase = 0.04;
	
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

	inactive_timer = 0;
	image_xscale = 1;
	image_yscale = 1;
}

function capy_player(){
	// Handle firing logic
	if (global._key_throw) {
	    if (fire_timer <= 0) {
	        // Create a projectile
	        var bullet = instance_create_layer(x, y, "Instances", melee_hitbox_object);

	        // Set bullet speed and direction
			if (global.has_created_character) {
				bullet.bullet_id = player_id
			}
	        bullet.speed = last_direction * 10;
	        bullet.bullet_direction = last_direction;

	        // Reset fire timer
	        fire_timer = fire_rate;

	        // Dash when firing
	        hspeed = 10 * last_direction; // Dash speed
	        dash_timer = 10;              // Dash duration
	    }
	}

	// Manage dash timing
	if (dash_timer > 0) {
	    dash_timer--;
	    if (dash_timer <= 0) {
	        hspeed = 0;
	    }
	}

	// Fire timer countdown
	if (fire_timer > 0) fire_timer--;

	// Knockback handling
	if (is_knocked_back) {
	    x += knockback_x * knockback_multiplier;
	    y -= abs(knockback_y * knockback_multiplier);

	    knockback_x *= 0.9;
	    knockback_y *= 0.9;

	    if (abs(knockback_x) < 0.1 && abs(knockback_y) < 0.1) {
	        knockback_x = 0;
	        knockback_y = 0;
	        is_knocked_back = false;
	    }
	}

	// Handle sprite states
	if (global._key_down) {
	    sprite_index = capy_down_sprite;
	} else if (vsp < 0) {
	    sprite_index = capy_jump_sprite;
	    image_index = 0;
	} else if (vsp > 0) {
	    sprite_index = capy_jump_sprite;
	    image_index = 1;
	} else if (global._key_left || global._key_right) {
	    sprite_index = capy_walk_sprite;
	} else {
	    sprite_index = capy_idle_sprite;
	}

	// Idle animation handling
	if (vsp == 0 && hsp == 0) {
	    if (inactive_timer < 5 * room_speed) {
	        inactive_timer++;
	    } else {
	        sprite_index = capy_idle_throw_sprite;
	    }
	} else {
	    inactive_timer = 0;
	}
}

function capy_draw() {
	
	draw_self();
	
	if (global.has_created_character) {
		if (player_id == 0) {
			var bar_x = 1940;
		} else {
			var bar_x = 2740;
		}
	} else {
		if (global.p2_selected_character != capy_object) {
		    var bar_x = 80;
		} else {
		    var bar_x = room_width - 80;
		}
	}
	
	var bar_y = 20;

	// Determine the frame index for the knockback sprite
	var max_frames = 14; // Total number of frames in knockback_bar_sprite
	var current_frame;

	// Check if the knockback_multiplier exceeds the threshold
	if (knockback_multiplier > 5) {
	    current_frame = max_frames - 1; // Last frame (index 13)
	} else {
	    // Adjust the calculation to map `knockback_multiplier = 1` to frame `0`
	    current_frame = clamp(floor(((knockback_multiplier - 1) / (max_knockback_multiplier - 1)) * max_frames), 0, max_frames - 1);
	}

	// Draw the knockback bar sprite at the correct frame
	draw_sprite(knockback_bar_sprite, current_frame, bar_x, bar_y);

	// Draw the knockback multiplier value next to the bar
	draw_set_color(c_white);
	draw_text(bar_x + 50, bar_y, string(knockback_multiplier));
}