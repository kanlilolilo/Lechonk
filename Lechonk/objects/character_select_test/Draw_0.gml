// Get the base coordinates from capy_portrait_sprite
var base_x = 1120
var base_y = 160
var player = online_player_object;

// Adjust the x and y offsets based on the count
switch (count) {
    case 1:
        draw_sprite(player1overlay_sprite, 0, base_x, base_y);
        break;
    case 2:
        draw_sprite(player1overlay_sprite, 0, base_x + 160, base_y);
        break;
    case 3:
        draw_sprite(player1overlay_sprite, 0, base_x + 320, base_y);
        break;
    case 4:
        draw_sprite(player1overlay_sprite, 0, base_x + 480, base_y);
        break;
    default:
        // Handle any other cases if necessary
        break;
}
