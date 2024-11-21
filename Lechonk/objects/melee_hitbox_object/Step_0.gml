// Move the bullet horizontally
x += hsp;

// Destroy the bullet if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Increment the counter each step
steps_counter += 1;

// If 10 steps have passed, destroy the object
if (steps_counter >= 10) {
    instance_destroy();
}
