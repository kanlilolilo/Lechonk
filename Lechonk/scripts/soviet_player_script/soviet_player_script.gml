function soviet_stats(){
	character_name = "soviet"
	
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

function soviet_player(){
	// Handle sprite flipping based on movement direction
	if (global._key_left) {
	    image_xscale = -0.2; // Mirror sprite when moving left
	} else if (global._key_right) {
	    image_xscale = 0.2; // Reset to original when moving right
	}
	
	// Change sprite to walking sprite when moving, or idle when not
	if (global._key_left || global._key_right) {
	    sprite_index = soviet_union_walk_sprite;
	} else {
	    sprite_index = soviet_union_sprite;
	}
	
		// Fire bullets based on direction
	if (global._key_throw) { // Fire when Space is held down
	    if (fire_timer <= 0) {
	        // Create the bullet
	        var bullet = instance_create_layer(x, y, "Instances", vork_object);

	        // Set bullet speed based on last_direction
			if (global.has_created_character) {
				bullet.bullet_id = player_id
			}
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

function soviet_draw(){
	
	draw_self();
	
	if (global.has_created_character) {
		if (player_id == 0) {
			var bar_x = 1940;
		} else {
			var bar_x = 2740;
		}
	} else {
		if (global.p2_selected_character != soviet_union_object) {
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