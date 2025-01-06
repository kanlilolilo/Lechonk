if (room_get_name(TestRoom) == true) {
	instance_create_layer(1440, 800, "Instances", global.p1_selected_character); // Create the selected character for P1
	instance_create_layer(1600, 800, "Instances", global.p2_selected_character); // Create the selected character for P2
} else {
	instance_create_layer(300, 180, "Instances", global.p1_selected_character); // Create the selected character for P1
	instance_create_layer(500, 180, "Instances", global.p2_selected_character); // Create the selected character for P2
}
	