	// Input
	if (!input_disabled) {
	global._input = rollback_get_input();

	global._key_left = global._input.left
	global._key_right = global._input.right
	global._key_jump = global._input.up
	global._key_down = global._input.down
	global._key_throw = global._input.fire
	global._key_throw_2 = global._input.fire2

// Handle right press
if (global._key_left && global.start_timer == false) {
    key_pressed = 1;
}

if (!global._key_left && key_pressed == 1) {
	if (character != 1) {
		character--;
	} else {
		character = 4
	}
	key_pressed = 0;
	switch_character = true
}

// Handle left press
if (global._key_right && global.start_timer == false) {
    key_pressed2 = 1;
}

if (!global._key_right && key_pressed2 == 1) {
	if (character != 4) {
		character++;
	} else {
		character = 1
	}
	key_pressed2 = 0;
	switch_character = true
}

if (switch_character) {
	switch_character = false
	switch (character) {
	    case 3: // Mawmaw
	        mawmaw_stats();
	        break;

	    case 4: // Capy
	        character_name = "capy";
	        capy_stats();
	        break;

	    case 1: // Shylily
	        character_name = "shylily";
	        shylily_stats();
	        break;

	    case 2: // Soviet
	        character_name = "soviet";
	        soviet_stats();
	        break;

	    default:
	        // Handle invalid character cases if needed
	        break;
	}
}


	if (global.start_timer == true) {
		depth = 0
		
	if (y > room_height + 100) { 
		game_end_online_sequence(); 
	}

	movement_collision();
		
	if (character_name == "shylily") {
		shylily_player();
	}

	if (character_name == "capy") {
		capy_player();
	}

	if (character_name == "soviet") {
		soviet_player();
	}
	
	if (character_name = "mawmaw") {
		mawmaw_player();
	}
}
}
