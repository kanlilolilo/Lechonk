speed = 10;
direction = image_xscale == 1 ? 0 : 180;

if (speed < 0) {
    image_xscale = -1; // Flip the sprite horizontally
} else {
    image_xscale = 1;  // Default orientation
}
