// Create a flag variable to track if the object has been created
if (!global.has_created_character && instance_exists(online_player_object)) {
    // Create the instance only once
    var camera = view_camera[0]; // Assuming you're using the first camera
	camera_set_view_pos(camera, 960, 0);
    alarm[0] = 300
    // Set the flag to true, so it won't run again
    global.has_created_character = true;
}