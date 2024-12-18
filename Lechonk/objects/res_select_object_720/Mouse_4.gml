// Define the new resolution
var new_width = 1280; // Set the desired width
var new_height = 720; // Set the desired height

// Change the game window's size
window_set_size(new_width, new_height);

// Adjust the application surface to match the new resolution
surface_resize(application_surface, new_width, new_height);

// Optionally, center the window on the screen
var screen_width = display_get_width();
var screen_height = display_get_height();
window_set_position((screen_width - new_width) / 2, (screen_height - new_height) / 2);

with (res_select_object_1080) instance_destroy();
with (res_select_object_720) instance_destroy();
with (res_select_object_360) instance_destroy();
