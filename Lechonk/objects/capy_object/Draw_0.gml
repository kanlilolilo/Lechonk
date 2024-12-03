// Draw the character sprite first
draw_self();

// Then draw the knockback multiplier bar
if (global.p2_selected_character != capy_object) {
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
