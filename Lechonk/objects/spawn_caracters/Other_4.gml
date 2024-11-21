// In the game start event or when transitioning to the game scene
instance_create_layer(300, 180, "Instances", global.p1_selected_character); // Create the selected character for P1
instance_create_layer(500, 180, "Instances", global.p2_selected_character); // Create the selected character for P2
audio_play_sound(fight, 0, false);