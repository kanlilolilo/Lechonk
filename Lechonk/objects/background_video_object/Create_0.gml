// Create Event
video = video_open("bgvideo.mp4");

if (video != -1) { // Check if video loaded successfully
    video_enable_loop(true);
} else {
    show_debug_message("Failed to load video: bgvideo.mp4");
}
