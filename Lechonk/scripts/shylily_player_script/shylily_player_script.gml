function shylily_stats(){
	character_name = "shylily"
	
	is_following = false;
	input_disabled = false;
	
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
	image_xscale = 1;
	image_yscale = 1;
}

function shylily_player(){
	// Handle sprite flipping based on movement direction
	if (global._key_left) {
	    image_xscale = -1; // Mirror sprite when moving left
	} else if (global._key_right) {
	    image_xscale = 1; // Reset to original when moving right
	}
	
	if (global._key_left || global._key_right) {
	    sprite_index = shylily_walk_sprite;
	} else {
	    sprite_index = shylily_idle_sprite;
	}
	
	// Fire bullets based on direction and check if the minigun is overheated
	if (global._key_throw && minigun_heat < max_heat) { // Fire when F is pressed and not overheated
	    if (fire_timer <= 0) {
	        // Create the bullet
	        var bullet = instance_create_layer(x, y, "Instances", shylily_bullet_object);

	        // Set bullet speed based on last_direction
			if (global.has_created_character) {
				bullet.bullet_id = player_id
			}
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

	// Decrease the fire timer every step
	if (fire_timer > 0) {
	    fire_timer--;
	}

	// Cool down the minigun if it's not firing
	if (minigun_heat > 0 && !global._key_throw) {
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

function shylily_draw(){
	
	draw_self();
	
	if (global.has_created_character) {
		if (player_id == 0) {
			var bar_x = 1940;
		} else {
			var bar_x = 2740;
		}
	} else {
		if (global.p2_selected_character != shylily_idle_object) {
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


	// --------------------------------------------

	// Get the position of the character
	var player_x = x;  // Character's X position
	var player_y = y;  // Character's Y position

	// Initialize the radius of the heat bar (smaller donut shape)
	var outer_radius = 12.5; // Outer radius of the donut
	var inner_radius = 7.5;  // Inner radius of the donut

	// Calculate the current angle of the heat bar based on the minigun's heat
	var current_angle = (minigun_heat / max_heat) * 360;  // In degrees

	// Heat bar position relative to the player (above the player's head)
	var heat_bar_x = player_x - 10;  // Center the donut above the player
	var heat_bar_y = player_y - sprite_height + 5;  // Position the donut slightly above the player's head

	// Draw the filled heat bar as a segment of the donut
	if (minigun_heat >= max_heat) {
	    draw_set_color(c_red);  // Red color when overheated
	} else {
	    draw_set_color(c_green);  // Green color when it's cool
	}
	
	if (minigun_heat = 0){
		var outer_radius = 0; // Outer radius of the donut
		var inner_radius = 0;  // Inner radius of the donut
	}

	// Draw the actual donut-shaped heat bar
	for (var angle = 0; angle <= current_angle; angle++) {
	    var x1 = heat_bar_x + outer_radius * cos(degtorad(angle));
	    var y1 = heat_bar_y + outer_radius * sin(degtorad(angle));
	    var x2 = heat_bar_x + inner_radius * cos(degtorad(angle));
	    var y2 = heat_bar_y + inner_radius * sin(degtorad(angle));
	    var x3 = heat_bar_x + inner_radius * cos(degtorad(angle + 1));
	    var y3 = heat_bar_y + inner_radius * sin(degtorad(angle + 1));
	    var x4 = heat_bar_x + outer_radius * cos(degtorad(angle + 1));
	    var y4 = heat_bar_y + outer_radius * sin(degtorad(angle + 1));
	    draw_primitive_begin(pr_trianglestrip);
	    draw_vertex(x1, y1);
	    draw_vertex(x2, y2);
	    draw_vertex(x4, y4);
	    draw_vertex(x3, y3);
	    draw_primitive_end();
	}
}