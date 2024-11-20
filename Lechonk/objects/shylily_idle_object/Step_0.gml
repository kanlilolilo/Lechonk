// Movement speed
var move_speed = 5;

// Horizontal movement
if (keyboard_check(vk_left)) {
    x -= move_speed;
}
if (keyboard_check(vk_right)) {
    x += move_speed;
}

// Vertical movement
if (keyboard_check(vk_up)) {
    y -= move_speed;
}
if (keyboard_check(vk_down)) {
    y += move_speed;
}
