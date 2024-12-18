// Check if the objects already exist
var obj_1080_exists = instance_exists(res_select_object_1080);
var obj_720_exists = instance_exists(res_select_object_720);

if (obj_1080_exists && obj_720_exists) {
    // If both exist, destroy them
    with (res_select_object_1080) instance_destroy();
    with (res_select_object_720) instance_destroy();
} else {
    // If they don't exist, create both
    var new_x = x; // Keep the same horizontal position
    var new_y_1080 = y + sprite_height; // Position res_select_object_1080 below the button
    var new_y_720 = new_y_1080 + sprite_get_height(sprite_index) * 1.5; // Position res_select_object_720 below res_select_object_1080
    
    // Create res_select_object_1080
    var obj_1080 = instance_create_layer(new_x, new_y_1080, layer, res_select_object_1080);
    obj_1080.image_xscale = 1.5;
    obj_1080.image_yscale = 1.5;
    
    // Create res_select_object_720
    var obj_720 = instance_create_layer(new_x, new_y_720, layer, res_select_object_720);
    obj_720.image_xscale = 1.5;
    obj_720.image_yscale = 1.5;
}
