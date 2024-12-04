characters = [
	capy_portrait_object, 
	shylily_portrait_object, 
	union_portrait_object,
	mawmaw_portrait_object,
	blank_portrait_object,
	blank_portrait_object,
	blank_portrait_object,
	blank_portrait_object,
	blank_portrait_object,
	blank_portrait_object,
];

current_index = 0;
normal_scale = 2;
selection_scale = 3;
offset = 360;
animation_speed = 0.1;
position_lerp_speed = 0.2;

total_width = array_length(characters) * offset;
startX = display_get_width() / 2;
startY = display_get_height() / 1.8;

lerped_positions = array_create(array_length(characters), 0);
lerped_scales = array_create(array_length(characters), normal_scale);

animation_timer = 0;
