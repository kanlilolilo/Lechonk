// Draw the character sprite first
draw_self();

// Then draw the knockback multiplier bar
if (global.p2_selected_character != shylily_idle_object) {
var bar_x = 20;
} else {
var bar_x = 820;
}
var bar_y = 20;
var bar_width = 20;
var bar_height = 20;
var current_width = knockback_multiplier * bar_width;
var max_display_width = max_knockback_multiplier * bar_width;

// Draw the background of the bar (gray)
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + max_display_width, bar_y + bar_height, false);

// Draw the current multiplier bar (color based on the multiplier)
if (knockback_multiplier > 3) {
    draw_set_color(c_red);
} else if (knockback_multiplier > 1.2) {
    draw_set_color(c_orange);
} else {
	draw_set_color(c_green);
}

draw_rectangle(bar_x, bar_y, bar_x + current_width, bar_y + bar_height, false);

// Optionally, draw text showing the current multiplier value
draw_set_color(c_white);

// --------------------------------------------

// Get the position of the character
var player_x = x;  // Character's X position
var player_y = y;  // Character's Y position

// Initialize the radius of the heat bar (smaller donut shape)
var outer_radius = 12.5; // Outer radius of the donut
var inner_radius = 7.5;  // Inner radius of the donut

// Calculate the current angle of the heat bar based on the minigun's heat
var current_angle = (minigun_heat / max_heat) * 360;  // In degrees

// Heat bar position relative to the player (above the player's head)
var heat_bar_x = player_x - 10;  // Center the donut above the player
var heat_bar_y = player_y - sprite_height + 5;  // Position the donut slightly above the player's head

// Draw the filled heat bar as a segment of the donut
if (minigun_heat >= max_heat) {
    draw_set_color(c_red);  // Red color when overheated
} else {
    draw_set_color(c_green);  // Green color when it's cool
}

// Draw the actual donut-shaped heat bar
for (var angle = 0; angle <= current_angle; angle++) {
    var x1 = heat_bar_x + outer_radius * cos(degtorad(angle));
    var y1 = heat_bar_y + outer_radius * sin(degtorad(angle));
    var x2 = heat_bar_x + inner_radius * cos(degtorad(angle));
    var y2 = heat_bar_y + inner_radius * sin(degtorad(angle));
    var x3 = heat_bar_x + inner_radius * cos(degtorad(angle + 1));
    var y3 = heat_bar_y + inner_radius * sin(degtorad(angle + 1));
    var x4 = heat_bar_x + outer_radius * cos(degtorad(angle + 1));
    var y4 = heat_bar_y + outer_radius * sin(degtorad(angle + 1));
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x1, y1);
    draw_vertex(x2, y2);
    draw_vertex(x4, y4);
    draw_vertex(x3, y3);
    draw_primitive_end();
}

// Optionally, draw text showing the current multiplier value
draw_set_color(c_white);

if (global.p2_selected_character != shylily_idle_object) {
draw_text(bar_x + max_display_width + -55, bar_y, "P1");
} else {
draw_text(bar_x + max_display_width + -55, bar_y, "P2");
}