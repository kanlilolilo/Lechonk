// Step event: Handle input for character selection and "Enter" press

// Check for the "Enter" key press to select a character
if (keyboard_check_pressed(vk_enter)) {
    // Check which character is currently selected based on the current index
    var selected_character = characters[current_index];
    
    // Play sound based on the selected character
    if (selected_character == capy_portret_object) {
        audio_play_sound(capy, 0, false);  // Play sound for Capy
    } else if (selected_character == shylily_portret_object) {
        audio_play_sound(shy, 0, false);  // Play sound for Shylily
    } else if (selected_character == union_portret_object) {
        audio_play_sound(soviet, 0, false);  // Play sound for Union
    }

    // Handle character selection for Player 1 and Player 2 based on whose turn it is
    if (global.selection_turn == 1) {
        // Player 1 selects their character
        if (selected_character == capy_portret_object) {
            global.p1_selected_character = capy_object;  // Store Capy for Player 1
        } else if (selected_character == shylily_portret_object) {
            global.p1_selected_character = shylily_idle_object;  // Correctly store Shylily for Player 1
        } else if (selected_character == union_portret_object) {
            global.p1_selected_character = soviet_union_object;  // Store Union for Player 1
        }
        global.selection_turn = 2;  // Switch to Player 2's turn
    } else if (global.selection_turn == 2) {
        // Player 2 selects their character
        if (selected_character == capy_portret_object) {
            global.p2_selected_character = capy_object;  // Store Capy for Player 2
        } else if (selected_character == shylily_portret_object) {
            global.p2_selected_character = shylily_idle_object;  // Correctly store Shylily for Player 2
        } else if (selected_character == union_portret_object) {
            global.p2_selected_character = soviet_union_object;  // Store Union for Player 2
        }
        global.selection_turn = 1;  // Switch back to Player 1's turn or end selection process
    }
}

// Step event: Handle smooth character movement and animations
if (animation_timer <= 0) {  // Only allow input if animation is done
    // Handle movement of the selection with arrow keys
    if (keyboard_check(vk_right)) {
        current_index += 1;  // Move to the next character
        if (current_index >= array_length_1d(characters)) {
            current_index = 0;  // Loop back to the first character
        }
        // Reset animation timer when a new selection is made
        animation_timer = 1;  // Start the animation
    }

    if (keyboard_check(vk_left)) {
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
}

// Decrease the animation timer until it finishes
if (animation_timer > 0) {
    animation_timer -= animation_speed;  // Decrease the timer based on the animation speed
}
