// Set background color
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw loading text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width / 2, room_height / 2 - 50, "Searching for players...");

// Draw searching animation (rotating circle)
var anim_radius = 20;
var anim_x = room_width / 2;
var anim_y = room_height / 2 + 50;
var angle = (current_time / 100) mod 360;
var angle_rad = angle * pi / 180;
var circle_x = anim_x + anim_radius * cos(angle_rad);
var circle_y = anim_y + anim_radius * sin(angle_rad);

draw_set_color(c_red);
draw_circle(circle_x, circle_y, 5, false);
