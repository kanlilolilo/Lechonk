switch (count) {
    case 1:
		draw_sprite(player1overlay_sprite, 0, 288, 96);
        break;
    case 2:
		draw_sprite(player1overlay_sprite, 0, 420, 77);
        break;
    case 3:
        draw_sprite(player1overlay_sprite, 0, 550, 54);
        break;
    default:
        // Handle any other cases if necessary
        break;
}
