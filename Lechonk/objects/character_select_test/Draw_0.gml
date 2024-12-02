switch (count) {
    case 1:
		draw_sprite(player1overlay_sprite, 0, 1184, 128);
        break;
    case 2:
		draw_sprite(player1overlay_sprite, 0, 1344, 160);
        break;
    case 3:
        draw_sprite(player1overlay_sprite, 0, 1504, 192);
        break;
    default:
        // Handle any other cases if necessary
        break;
}
