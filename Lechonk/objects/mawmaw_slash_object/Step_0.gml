// Move the bullet horizontally
x += hsp;

if(speed > 0) {
	image_xscale = -1.2
	image_yscale = image_xscale;
} 

if (speed > 0) {
	x = 20 + target.x
} else {
	x = -20 + target.x
}
y = target.y

// Destroy the bullet if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Increment the counter each step
steps_counter += 1;

// If 10 steps have passed, destroy the object
if (steps_counter >= 18) {
    instance_destroy();
}
