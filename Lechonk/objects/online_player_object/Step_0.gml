	// Input
	if (!input_disabled) {
	global._input = rollback_get_input();

	global._key_left = global._input.left
	global._key_right = global._input.right
	global._key_jump = global._input.up
	global._key_down = global._input.down
	global._key_throw = global._input.fire
	global._key_throw2 = global._input.fire2
	global._key_rightswitch = global._input.right

	if (global._key_rightswitch && start_timer == false) {
		key_pressed = 1
	}

	if (!global._key_rightswitch && key_pressed == 1) {
		 switch (character) {
		    case 4: // Mawmaw
		        character--
		        key_pressed = 0;
				mawmaw_stats();
		        break;

		    case 3: // Capy
		        character--
		        character_name = "capy";
		        key_pressed = 0;

				capy_stats();
		        break;

		    case 2: // Shylily
		        character--
		        character_name = "shylily";
		        key_pressed = 0;

		        shylily_stats();
		        break;

		    case 1: // Soviet
		        character = 4; //total characters
		        character_name = "soviet";
		        key_pressed = 0;

		        soviet_stats();
		        break;

		    default:
		        // Handle invalid character cases if needed
		        break;
		}

	}

	if (start_timer == true) {
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
