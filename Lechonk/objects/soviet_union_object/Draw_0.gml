// Draw the character sprite first
draw_self();

// Then draw the knockback multiplier bar
if (global.p2_selected_character != soviet_union_object) {
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

if (global.p2_selected_character != soviet_union_object) {
draw_text(bar_x + max_display_width + -55, bar_y, "P1");
} else {
draw_text(bar_x + max_display_width + -55, bar_y, "P2");
}