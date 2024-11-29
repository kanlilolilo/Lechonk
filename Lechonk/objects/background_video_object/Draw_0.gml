// Draw Event
if (video != -1) {
    var _videoData = video_draw();
    var _videoStatus = _videoData[0];
    if (_videoStatus == 0) { // Video is playing
        draw_surface_stretched(_videoData[1], 0, 0, 1920, 1080);
    } else {
        show_debug_message("Video playback issue: " + string(_videoStatus));
    }
} else {
    draw_text(10, 10, "No video loaded.");
}

draw_set_alpha(0.5); // Set transparency to 50% (0 is fully transparent, 1 is fully opaque)
draw_set_color(c_black); // Set the color to black

if room = CharacterSelect {
	draw_rectangle(0, 0, 1920, 1080, false);	
}

if room = StartScreen {
	draw_rectangle(0, 580, 1920, 1080, false);
}

draw_set_alpha(1); // Reset alpha to 1 after drawing to avoid affecting other objects