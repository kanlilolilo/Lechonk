// Draw the sprite
draw_self();

// Text to draw
var text = "select resolution";

// Calculate the position for the text
var text_x = x - sprite_width / 2 + 10; // Move to the left of the sprite with 10px spacing
var text_y = y - string_height(text) / 2 + 2; // Vertically center the text relative to the sprite

// Set the text color to black
draw_set_color(c_black);

// Draw the text
draw_text(text_x, text_y, text);
