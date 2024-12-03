// Step event: Handle input for character selection and "Enter" press

// Check for the "Enter" key press to select a character
if (keyboard_check_pressed(vk_space)) {
    // Check which character is currently selected based on the current index
    var selected_character = characters[current_index];

    // Handle character selection for Player 1 and Player 2 based on whose turn it is
    switch (global.selection_turn) {
        case 1:
        // Player 1 selects their character
        switch (selected_character) {
            case testroom_room_select_object:
                TransitionStart(TestRoom, sq_fade_out, sq_fade_in);
                break;
            case fryventure_room_select_object:
                TransitionStart(FryVentureRoom, sq_fade_out, sq_fade_in);
                break;
        }
	}
}

// Step event: Handle smooth character movement and animations
if (animation_timer <= 0) {  // Only allow input if animation is done
    // Handle movement of the selection with arrow keys
    if (keyboard_check(ord("D"))) {
        current_index += 1;  // Move to the next character
        if (current_index >= array_length_1d(characters)) {
            current_index = 0;  // Loop back to the first character
        }
        // Reset animation timer when a new selection is made
        animation_timer = 1;  // Start the animation
    }

    if (keyboard_check(ord("A"))) {
        current_index -= 1;  // Move to the previous character
        if (current_index < 0) {
            current_index = array_length_1d(characters) - 1;  // Loop to the last character
        }
        // Reset animation timer when a new selection is made
        animation_timer = 1;  // Start the animation
    }
}

// Step event: Update smooth position transitions for characters
for (var i = 0; i < array_length(characters); i++) {
    var target_position = startX + (i - current_index) * offset;
    lerped_positions[i] = lerp(lerped_positions[i], target_position, position_lerp_speed); // Smooth position transition
	
	var target_scale = (i == current_index) ? selection_scale : normal_scale;
    lerped_scales[i] = lerp(lerped_scales[i], target_scale, position_lerp_speed);
}

// Decrease the animation timer until it finishes
if (animation_timer > 0) {
    animation_timer -= animation_speed;  // Decrease the timer based on the animation speed
}
