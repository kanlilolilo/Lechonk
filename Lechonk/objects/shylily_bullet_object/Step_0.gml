// Move the bullet horizontally
x += hsp;

// Destroy the bullet if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

if (is_destroying) {
    // Keep the instance fixed at the collision point
    x = destroy_x;
    y = destroy_y;

    // Check if the animation has finished
    if (image_index >= image_number - 1) {
        instance_destroy();
    }
}
