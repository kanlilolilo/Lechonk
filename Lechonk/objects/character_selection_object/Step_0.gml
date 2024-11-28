// Move left or right when arrow keys are pressed
if (keyboard_check(vk_right)) {
    current_index += 1; // Move to the next character
    if (current_index >= array_length_1d(characters)) {
        current_index = 0; // Loop back to the first character
    }
}

if (keyboard_check(vk_left)) {
    current_index -= 1; // Move to the previous character
    if (current_index < 0) {
        current_index = array_length_1d(characters) - 1; // Loop to the last character
    }
}