draw_self();

// Text to draw
var text = "360 x 360";

// Calculate the width and height of the text
var text_width = string_width(text);
var text_height = string_height(text);

// Determine the position to center the text
var x_center = x - sprite_width / 2 + 10;
var y_center = y - string_height(text) / 2 + 2;

// Set the text color to black
draw_set_color(c_white);

// Draw the text at the centered position
draw_text(x_center, y_center, text);
