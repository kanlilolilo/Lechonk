var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check(vk_up);

var _move = _key_right - _key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y+1, collision_object)) && (_key_jump) {
	vsp = -7;
}

if (place_meeting(x+hsp, y, collision_object)){
	while (!place_meeting(x+sign(hsp), y, collision_object)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

if (place_meeting(x, y+vsp, collision_object)){
	while (!place_meeting(x, y+sign(vsp), collision_object)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

