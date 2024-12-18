var screen_width = display_get_width();
var screen_height = display_get_height();

// Define the main square dimensions
var main_square_width = screen_width * (2 / 3);
var main_square_height = screen_height;
var main_square_x = screen_width - main_square_width; // Positioned 2/3 to the right
var main_square_y = 0;

// Colors and alpha
var square_color = c_black;
var alpha = 0.4;

// Draw the main square
draw_set_alpha(alpha);
draw_set_color(square_color);
draw_rectangle(main_square_x, main_square_y, screen_width, main_square_height, false); // Semi-transparent black

// Draw the black line on the left of the main square
draw_set_alpha(1);
draw_set_color(square_color);
draw_line(main_square_x, main_square_y, main_square_x, main_square_height);

// Reset alpha to default
draw_set_alpha(1);
