function mawmaw_stats(){
	character_name = "mawmaw";
	
	is_following = false;
	input_disabled = false;
	attack_duration = 0;
	
	// Mawmaw stats
	knockback_power = 20;
	knockback_multiplier_increase = 0.2;
	sprite_index = mawmaw_walk_sprite;
	mawmaw_attacking = false;
	mawmaw_full = false;
	attack_cooldown = 0;
	dash_timer = 0;
	can_double_jump = true;
	hsp = 0;
	vsp = 0;
	grv = 0.4;
	walksp = 3.2;
	fire_rate = 60;
	fire_timer = 0;
	last_direction = 1;
	knockback_x = 0;
	knockback_y = 0;
	knockback_cooldown = 0;
	is_knocked_back = false;
	knockback_multiplier = 1;
	max_knockback_multiplier = 5;
	image_xscale = 0.2;
	image_yscale = 0.2;
}
	
function mawmaw_player(){
	// Change sprite to walking sprite when moving, or idle when not{
	if (global._key_left || global._key_right) {
		sprite_index = mawmaw_walk_sprite;
	} else {
		sprite_index = mawmaw_idle_sprite;
	}		
		
	if (mawmaw_full) {
		image_yscale = 0.3
		if (global._key_left) {
			image_xscale = 0.3; // Mirror sprite when moving left
		} else if (global._key_right) {
			image_xscale = -0.3; // Reset to original when moving right
		}
	} else {
		image_yscale = 0.2
		// Handle sprite flipping based on movement direction
		if (global._key_left) {
			image_xscale = 0.2; // Mirror sprite when moving left
		} else if (global._key_right) {
			image_xscale = -0.2; // Reset to original when moving right
		}
	}

	if (mawmaw_full) {
		walksp = 2
	} else {
		walksp = 3.2
	}

	// Attack logic
	if (global._key_throw && attack_cooldown <= 0 && !mawmaw_attacking) {
		mawmaw_attacking = true;          // Start attacking
		attack_duration = 180;           // 3 seconds at 60 FPS
		attack_cooldown = 300;           // Cooldown of 5 seconds after the attack
	}

	if (mawmaw_attacking) {
		sprite_index = mawmaw_attack_sprite;
		walksp = 5;
		attack_duration -= 1;            // Decrease attack duration

		if (attack_duration <= 0) {
		    mawmaw_attacking = false;    // Stop attacking when duration ends
		}
	}

	if (attack_cooldown > 0) {
		attack_cooldown -= 1;            // Decrease cooldown timer
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

function mawmaw_draw(){
	
	draw_self();
	
	if (global.has_created_character) {
		if (player_id == 0) {
			var bar_x = 1940;
		} else {
			var bar_x = 2740;
		}
	} else {
		if (global.p2_selected_character != mawmaw_idle_object) {
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