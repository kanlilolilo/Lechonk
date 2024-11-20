

// Teken een zwarte achtergrond
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0);

// Stel transparantie in
draw_set_alpha(alpha);

draw_sprite(lechonkfanclub_logo_sprite, 0, room_width / 2 - sprite_width / 2, room_height / 2.5 - sprite_height / 2);


// Reset alpha
draw_set_alpha(1);