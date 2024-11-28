// Step event: Handle input for character selection
if (animation_timer <= 0) {  // Only allow input if animation is done
    if (keyboard_check(vk_right)) {
        current_index += 1; // Move to the next character
        if (current_index >= array_length_1d(characters)) {
            current_index = 0; // Loop back to the first character
        }
        // Reset animation timer when a new selection is made
        animation_timer = 1; // Start the animation
    }

    if (keyboard_check(vk_left)) {
        current_index -= 1; // Move to the previous character
        if (current_index < 0) {
            current_index = array_length_1d(characters) - 1; // Loop to the last character
        }
        // Reset animation timer when a new selection is made
        animation_timer = 1; // Start the animation
    }
}

// Step event: Update smooth position transitions for characters
for (var i = 0; i < array_length(characters); i++) {
    var target_position = startX + (i - current_index) * offset;
    lerped_positions[i] = lerp(lerped_positions[i], target_position, position_lerp_speed); // Smooth position transition
}

// Decrease the animation timer until it finishes
if (animation_timer > 0) {
    animation_timer -= animation_speed; // Decrease the timer based on the animation speed
}
