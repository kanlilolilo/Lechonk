// Draw the character sprite first
draw_self();

// Then draw the knockback multiplier bar
if (global.p2_selected_character != shylily_idle_object) {
    var bar_x = 80;
} else {
    var bar_x = room_width - 80;
}
var bar_y = 20;

// Determine the frame index for the knockback sprite
var max_frames = 14; // Total number of frames in knockback_bar_sprite
var current_frame;

// Check if the knockback_multiplier exceeds the threshold
if (knockback_multiplier > 5) {
    current_frame = max_frames - 1; // Last frame (index 13)
} else {
    // Adjust the calculation to map `knockback_multiplier = 1` to frame `0`
    current_frame = clamp(floor(((knockback_multiplier - 1) / (max_knockback_multiplier - 1)) * max_frames), 0, max_frames - 1);
}

// Draw the knockback bar sprite at the correct frame
draw_sprite(knockback_bar_sprite, current_frame, bar_x, bar_y);

// Draw the knockback multiplier value next to the bar
draw_set_color(c_white);
draw_text(bar_x + 50, bar_y, string(knockback_multiplier));


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