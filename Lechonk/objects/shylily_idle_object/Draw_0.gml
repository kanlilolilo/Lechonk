// Draw the character sprite first
draw_self();

// Then draw the knockback multiplier bar
var bar_x = 200;
var bar_y = 20;
var bar_width = 20;
var bar_height = 20;
var current_width = knockback_multiplier * bar_width;
var max_display_width = max_knockback_multiplier * bar_width;

// Draw the background of the bar (gray)
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + max_display_width, bar_y + bar_height, false);

// --------------------------------------------

// Get the position of the character
var player_x = x;  // Character's X position
var player_y = y;  // Character's Y position

// Initialize the width and height of the heat bar
var heat_bar_width = 200; // Width of the bar
var heat_bar_height = 20; // Height of the bar

// Calculate the current width of the heat bar based on the minigun's heat
var current_heat_width = (minigun_heat / max_heat) * heat_bar_width;

// Heat bar position relative to the player (above the player's head)
var heat_bar_x = player_x - (heat_bar_width / 2);  // Center the bar above the player
var heat_bar_y = player_y - sprite_height - 10;    // Position the bar slightly above the player's head

// Draw the background of the heat bar (gray)
draw_set_color(c_black);
draw_rectangle(heat_bar_x, heat_bar_y, heat_bar_x + heat_bar_width, heat_bar_y + heat_bar_height, false);

// Draw the current heat bar (color based on heat)
if (minigun_heat >= max_heat) {
    draw_set_color(c_red);  // Red color when overheated
} else {
    draw_set_color(c_green);  // Green color when it's cool
}

// Draw the actual heat bar
draw_rectangle(heat_bar_x, heat_bar_y, heat_bar_x + current_heat_width, heat_bar_y + heat_bar_height, false);

// Optionally, draw text showing the current heat level above the bar
draw_set_color(c_white);
draw_text(heat_bar_x + heat_bar_width + 10, heat_bar_y, string(minigun_heat));

