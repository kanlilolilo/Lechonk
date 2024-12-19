// List of objects to follow
var object_list = [
    capy_object,
    mawmaw_idle_object,
    shylily_idle_object,
    soviet_union_object,
    online_player_object,
]; // Add all objects to track here

// Initialize variables for bounding box
var min_x = 1000000000; // Large positive number
var max_x = -1000000000; // Large negative number
var min_y = 1000000000; // Large positive number
var max_y = -1000000000; // Large negative number

// Iterate through each object type
for (var i = 0; i < array_length(object_list); i++) {
    var obj = object_list[i];
    with (obj) {
        // Expand the bounding box
        min_x = min(min_x, x);
        max_x = max(max_x, x);
        min_y = min(min_y, y);
        max_y = max(max_y, y);
    }
}

// Calculate bounding box dimensions
var box_width = max_x - min_x;
var box_height = max_y - min_y;

// Add some padding
var padding = 200; // Adjust padding as needed
box_width += padding * 2;
box_height += padding * 2;

// Calculate the center of the bounding box
var target_center_x = (min_x + max_x) / 2;
var target_center_y = (min_y + max_y) / 2;

// Adjust camera size to fit the bounding box
var target_view_width = max(box_width, box_height * (display_get_width() / display_get_height()));
var target_view_height = max(box_height, box_width / (display_get_width() / display_get_height()));

// Ensure the camera does not shrink below a minimum size
var min_width = 480;
var min_height = 270;

target_view_width = max(target_view_width, min_width);
target_view_height = max(target_view_height, min_height);

// Ensure the camera does not exceed the room's size while maintaining aspect ratio
var max_width = room_width;
var max_height = room_height;

if (target_view_width > max_width || target_view_height > max_height) {
    var room_aspect = max_width / max_height;
    var view_aspect = target_view_width / target_view_height;

    if (view_aspect > room_aspect) {
        // Wider than the room, adjust width
        target_view_width = max_width;
        target_view_height = target_view_width / view_aspect;
    } else {
        // Taller than the room, adjust height
        target_view_height = max_height;
        target_view_width = target_view_height * view_aspect;
    }
}

// Calculate the clamped target camera position
var target_camera_x = clamp(target_center_x - target_view_width / 2, 0, room_width - target_view_width);
var target_camera_y = clamp(target_center_y - target_view_height / 2, 0, room_height - target_view_height);

// Smoothly interpolate current camera position and size towards the target
var smooth_factor = 0.015; // Adjust for more or less smoothing (lower = smoother)
var camera_x = lerp(camera_get_view_x(camera), target_camera_x, smooth_factor);
var camera_y = lerp(camera_get_view_y(camera), target_camera_y, smooth_factor);
var view_width = lerp(camera_get_view_width(camera), target_view_width, smooth_factor);
var view_height = lerp(camera_get_view_height(camera), target_view_height, smooth_factor);

// Update the camera position and size
camera_set_view_pos(camera, camera_x, camera_y);
camera_set_view_size(camera, view_width, view_height);
