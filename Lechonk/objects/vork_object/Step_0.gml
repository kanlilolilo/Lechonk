// Move the bullet
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroy the bullet if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
} 

if (speed <= 0) {
	image_xscale = -0.2;
}