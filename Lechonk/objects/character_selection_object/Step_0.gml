if (keyboard_check_pressed(vk_space)) {
    var selected_character = characters[current_index];
    
    switch (selected_character) {
        case capy_portret_object:
            audio_play_sound(capy, 0, false);
            break;
        case shylily_portret_object:
            audio_play_sound(shy, 0, false);
            break;
        case union_portret_object:
            audio_play_sound(soviet, 0, false);
            break;
    }

    switch (global.selection_turn) {
        case 1:
            switch (selected_character) {
                case capy_portret_object:
                    global.p1_selected_character = capy_object;
                    break;
                case shylily_portret_object:
                    global.p1_selected_character = shylily_idle_object;
                    break;
                case union_portret_object:
                    global.p1_selected_character = soviet_union_object;
                    break;
            }
            global.selection_turn = 2;
            break;
        
        case 2:
            switch (selected_character) {
                case capy_portret_object:
                    global.p2_selected_character = capy_object;
                    break;
                case shylily_portret_object:
                    global.p2_selected_character = shylily_idle_object;
                    break;
                case union_portret_object:
                    global.p2_selected_character = soviet_union_object;
                    break;
            }
            global.selection_turn = 1;
            break;
    }
}

if (animation_timer <= 0) {
    if (keyboard_check(ord("D"))) {
        current_index += 1;
        if (current_index >= array_length_1d(characters)) {
            current_index = 0;
        }
        animation_timer = 1;
    }

    if (keyboard_check(ord("A"))) {
        current_index -= 1;
        if (current_index < 0) {
            current_index = array_length_1d(characters) - 1;
        }
        animation_timer = 1;
    }
}

for (var i = 0; i < array_length(characters); i++) {
    var target_position = startX + (i - current_index) * offset;
    lerped_positions[i] = lerp(lerped_positions[i], target_position, position_lerp_speed);

    var target_scale = (i == current_index) ? selection_scale : normal_scale;
    lerped_scales[i] = lerp(lerped_scales[i], target_scale, position_lerp_speed);
}

if (animation_timer > 0) {
    animation_timer -= animation_speed;
}