// Move the bullet
x += hsp;
y += vsp;

// Apply gravity to vertical speed
vsp += gravity;

// Destroy the bullet if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Adjust the bullet's image scale if speed is less than or equal to 0
if (speed <= 0) {
    image_xscale = -0.2;
}