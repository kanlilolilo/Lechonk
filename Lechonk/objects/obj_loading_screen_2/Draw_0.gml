// Set background color
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw loading text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width / 2, room_height / 2 - 50, "Player found");