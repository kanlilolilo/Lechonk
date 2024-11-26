// Check if the animation has reached the last frame
if (image_index >= image_number - 1) {
    image_speed = 0; // Stop the animation
    image_index = image_number - 1; // Ensure it's on the last frame
} else {
    image_speed = 1; // Ensure the animation plays at normal speed
}
