// Center-align the text
draw_set_halign(fa_center);

// Start drawing from `credits_y`
var _y = credits_y; 
for (var i = 0; i < array_length(credits); i++) {
    draw_text(room_width / 2, _y, credits[i]); // Draw each line
    _y += 32; // Move down for the next line (line spacing)
}
