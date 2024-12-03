	// Input 
	var _input = rollback_get_input();

	var _key_left = _input.a
	var _key_right = _input.d 
	var _key_jump = _input.w; 
	var _key_throw = _input.space
	var _key_rightswitch = _input.right

	if (_key_rightswitch && start_timer == false) {
		key_pressed = 1
	}

	if (!_key_rightswitch && key_pressed == 1) {
		 switch (character) {
		    case 4: // Mawmaw
		        character--
		        character_name = "mawmaw";
		        key_pressed = 0;

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
		        break;

		    case 3: // Capy
		        character--
		        character_name = "capy";
		        key_pressed = 0;

		        // Capy stats
		        sprite_index = capy_idle_sprite;
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
		        dash_timer = 10;
		        image_xscale = 1;
		        image_yscale = 1;
		        break;

		    case 2: // Shylily
		        character--
		        character_name = "shylily";
		        key_pressed = 0;

		        // Shylily stats
		        sprite_index = shylily_idle_sprite;
		        hsp = 0;
		        vsp = 0;
		        grv = 0.5;
		        walksp = 2.8;
		        fire_rate = 5;
		        fire_timer = 0;
		        last_direction = 1;
		        knockback_x = 0;
		        knockback_y = 0;
		        is_knocked_back = false;
		        knockback_cooldown = 0;
		        knockback_multiplier = 1;
		        max_knockback_multiplier = 5;
		        minigun_heat = 0;
		        max_heat = 100;
		        heat_per_shot = 2;
		        cool_down_rate = 0.5;
		        image_xscale = 1;
		        image_yscale = 1;
		        break;

		    case 1: // Soviet
		        character = 4; //total characters
		        character_name = "soviet";
		        key_pressed = 0;

		        // Soviet stats
		        sprite_index = soviet_union_sprite;
		        hsp = 0;
		        vsp = 0;
		        grv = 0.5;
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
		        break;

		    default:
		        // Handle invalid character cases if needed
		        break;
		}


	}


	if (start_timer == true) {
		depth = 0

	//----------------------------------------------- last direction update
	
	// Update last_direction based on movement keys
	if (_key_left) {
	    last_direction = -1; // Remember left
	} else if (_key_right) {
	    last_direction = 1; // Remember right
	}
	
	//----------------------------------------------- firetimer--
	
	// Decrease the fire timer every step
	if (fire_timer > 0) {
	    fire_timer--;
	}
	
	//----------------------------------------------- movement
	
	// Detect if stuck inside a collision (can't move horizontally)
	if (place_meeting(x, y, collision_object) && (hsp == 0)) {
	    // If stuck horizontally, try moving up a little to avoid getting stuck in a collision
	    y -= 3; // Apply small upward force (adjust value to suit your game)
	    vsp = 0; // Reset vertical speed to avoid falling back down immediately
	}

	// Movement variables
	var _move = _key_right - _key_left;
	hsp = _move * walksp;
	vsp = vsp + grv;

    // Check if grounded and reset jump abilities
    if (place_meeting(x, y + 1, collision_object)) {
        can_jump = true;
		if (can_double_jump == true) {
			can_jump2 = true; // Reset double jump when grounded
		}
    }
	
	if (!_key_jump) {
		jump_pressed = false; 
	}
    // Jump logic
    if (_key_jump) {
        if (can_jump) {
            vsp = -7; // Perform the first jump
            can_jump = false; // Disable further jumps until grounded
			jump_pressed = true; 
        } else if (can_jump2 && jump_pressed = false) {
            vsp = -7; // Perform the double jump
            can_jump2 = false; // Disable the double jump until grounded
        }
    }
	
	//----------------------

	// Handle horizontal movement and collisions
	if (place_meeting(x+hsp, y, collision_object)) {
	    while (!place_meeting(x+sign(hsp), y, collision_object)) {
	        x = x + sign(hsp);
	    }
	    hsp = 0;
	}
	x = x + hsp;

	// Handle vertical movement and collisions
	if (place_meeting(x, y+vsp, collision_object)) {
	    while (!place_meeting(x, y+sign(vsp), collision_object)) {
	        y = y + sign(vsp);
	    }
	    vsp = 0;
	}
	y = y + vsp;
	
	//------------------------------------------------ knockback

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

	//------------------------------------------------
	
	if (y > room_height + 100) { // If the player falls below the map
	   game_end_online_sequence(); // Call a script to handle the victory
	}		
		
	if (character_name == "shylily") {
	

	// Change sprite to walking sprite when moving, or idle when not
	if (_key_left || _key_right) {
	    sprite_index = shylily_walk_sprite;
	} else {
	    sprite_index = shylily_idle_sprite;
	}

	// Handle sprite flipping based on movement direction
	if (_key_left) {
	    image_xscale = -1; // Mirror sprite when moving left
	} else if (_key_right) {
	    image_xscale = 1; // Reset to original when moving right
	}

	// Fire bullets based on direction and check if the minigun is overheated
	if (_key_throw && minigun_heat < max_heat) { // Fire when F is pressed and not overheated
	    if (fire_timer <= 0) {
	        // Create the bullet
	        var bullet = instance_create_layer(x, y, "Instances", shylily_bullet_object);

			bullet.bullet_id = player_id
	        // Set bullet speed based on last_direction
	        bullet.speed = last_direction * 10;
	        bullet.bullet_direction = last_direction;

	        // Reset fire timer
	        fire_timer = fire_rate;

	        // Increase heat after firing
	        minigun_heat += heat_per_shot;

	        // Ensure the heat doesn't exceed the max limit
	        if (minigun_heat > max_heat) {
	            minigun_heat = max_heat;
	        }
	    }
	}

	// Cool down the minigun if it's not firing
	if (minigun_heat > 0 && !_key_throw) {
	    minigun_heat -= cool_down_rate;
	    if (minigun_heat < 0) {
	        minigun_heat = 0;  // Prevent heat from going below 0
	    }
	}

	// Overheating logic: When heat exceeds max, prevent firing
	if (minigun_heat >= max_heat) {
	    // Prevent firing until cool down
	    fire_timer = fire_rate; // Optional: Prevent firing temporarily even if button is pressed
	}


	}

	//----------------------------------

	if (character_name == "capy") {

	// Change sprite to walking sprite when moving, or idle when not
	if (_key_left || _key_right) {
	    sprite_index = capy_walk_sprite;
	} else {
	    sprite_index = capy_idle_sprite;
	}

	// Handle sprite flipping based on movement direction
	if (_key_left) {
	    image_xscale = -1; // Mirror sprite when moving left
	} else if (_key_right) {
	    image_xscale = 1; // Reset to original when moving right
	}


	if (_key_throw) { // Fire when the attack button is held down
	    if (fire_timer <= 0) {
	        // Create the bullet
	        var bullet = instance_create_layer(x, y, "Instances", melee_hitbox_object);

			bullet.bullet_id = player_id
	        // Set bullet speed and direction based on last_direction
	        bullet.speed = last_direction * 10;
	        bullet.bullet_direction = last_direction; // Use direction, not last_direction * 10

	        // Reset fire timer
	        fire_timer = fire_rate;

	        // Dash when firing
	        var dash_speed = 10; // Set the dash speed
	        var dash_duration = 10; // Set the number of frames the dash lasts
	        hspeed = dash_speed * last_direction; // Horizontal dash speed based on last_direction
	        dash_timer = dash_duration;
	    }
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

	//--------------------------------------------------------------------------

	if (character_name == "soviet") {

	// Change sprite to walking sprite when moving, or idle when not
	if (_key_left || _key_right) {
	    sprite_index = soviet_union_walk_sprite;
	} else {
	    sprite_index = soviet_union_sprite;
	}

	// Handle sprite flipping based on movement direction
	if (_key_left) {
	    image_xscale = -0.2; // Mirror sprite when moving left
	} else if (_key_right) {
	    image_xscale = 0.2; // Reset to original when moving right
	}
	
	// Fire bullets based on direction
	if (_key_throw) { // Fire when Space is held down
	    if (fire_timer <= 0) {
	        // Create the bullet
	        var bullet = instance_create_layer(x, y, "Instances", vork_object);

			bullet.bullet_id = player_id
	        // Set bullet speed based on last_direction
	        bullet.speed = last_direction * 10;
			bullet.bullet_direction = last_direction

	        // Reset fire timer
	        fire_timer = fire_rate;
	    }
	}
	}
	
	if (character_name = "mawmaw") {
		
		// Change sprite to walking sprite when moving, or idle when not
		if (!_key_throw) {
			if (_key_left || _key_right) {
			    sprite_index = mawmaw_walk_sprite;
			} else {
			    sprite_index = mawmaw_idle_sprite;
			}
		} else {
			sprite_index = mawmaw_attack_sprite;
		}

		// Handle sprite flipping based on movement direction
		if (_key_left) {
		    image_xscale = 0.2; // Mirror sprite when moving left
		} else if (_key_right) {
		    image_xscale = -0.2; // Reset to original when moving right
		}


		if (_key_throw) { // Fire when the attack button is held down
			mawmaw_attacking = true;
		} else {
			mawmaw_attacking = false;
		}

		// If the dash timer is active, stop moving after dash duration
		if (dash_timer > 0) {
		    dash_timer -= 1;
		    if (dash_timer <= 0) {
		        hspeed = 0; // Stop horizontal movement after dash
		        vspeed = 0; // Stop vertical movement after dash
		    }
		}
	} //mawmaw end
	
	
	
	
	
	}
	
