function game_end_sequence() {
    // Get a reference to the online player object
    var player = online_player_object;

    // Move the player to a new position (example: x = 100, y = 200)
    player.x = 2272;
    player.y = 256;

	player.alarm[1] = 300
	player.alarm[0] = 300
	
	player.start_timer = false
	
	 var camera = view_camera[0]; // Assuming you're using the first camera
	camera_set_view_pos(camera, 960, 0);
    alarm[0] = 300
	
	player.knockback_multiplier = 1;
}