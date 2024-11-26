// Room Start event of the gradient_start_object
if (!global.gif_played) {
    global.gif_played = true;
    instance_create_layer(x, y, "Instances", logo_2_object); // Create the GIF object at the desired position
}

audio_play_sound(fff_letsgo, 0, false);