// Movement speed
var move_speed = 5;

// Horizontal movement (A and D)
if (keyboard_check(ord("A"))) {
    x -= move_speed;
}
if (keyboard_check(ord("D"))) {
    x += move_speed;
}

// Vertical movement (W and S)
if (keyboard_check(ord("W"))) {
    y -= move_speed;
}
if (keyboard_check(ord("S"))) {
    y += move_speed;
}
