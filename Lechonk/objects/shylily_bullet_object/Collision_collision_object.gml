if (!is_destroying) {
    // Start the destruction process
    is_destroying = true;

    // Save the current position
    destroy_x = x;
    destroy_y = y;

    // Change to the GIF sprite
    sprite_index = explosion_sprite;

    // Reset animation to start from the first frame
    image_index = 0;
    image_speed = 1; // Adjust speed as necessary
}
