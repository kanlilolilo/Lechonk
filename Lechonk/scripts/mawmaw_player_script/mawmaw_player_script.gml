function mawmaw_stats(){
	character_name = "mawmaw";
	
	// Mawmaw stats
	knockback_power = 20;
	knockback_multiplier_increase = 0.04;
	sprite_index = mawmaw_walk_sprite;
	mawmaw_attacking = false;
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



	// Attack logic
	if (global._key_throw && attack_cooldown <= 0 && !mawmaw_attacking) {
		mawmaw_attacking = true;          // Start attacking
		attack_duration = 180;           // 3 seconds at 60 FPS
		attack_cooldown = 300;           // Cooldown of 5 seconds after the attack
	}

	if (mawmaw_attacking) {
		sprite_index = mawmaw_attack_sprite;
		attack_duration -= 1;            // Decrease attack duration

		if (attack_duration <= 0) {
		    mawmaw_attacking = false;    // Stop attacking when duration ends
		}
	}

	if (attack_cooldown > 0) {
		attack_cooldown -= 1;            // Decrease cooldown timer
	}

	// If the dash timer is active, stop moving after dash duration
	if (dash_timer > 0) {
		dash_timer -= 1;
		if (dash_timer <= 0) {
		    hspeed = 0; // Stop horizontal movement after dash
		    vspeed = 0; // Stop vertical movement after dash
		}
	}
}

function mawmaw_draw(){

}