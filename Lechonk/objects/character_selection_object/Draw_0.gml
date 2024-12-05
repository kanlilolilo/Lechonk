for (var i = 0; i < array_length(characters); i++) {
    var char_x = lerped_positions[i];
    var scale = lerped_scales[i];
    var character = characters[i];

    if (character == capy_portrait_object) {
        draw_sprite(capy_portrait_sprite, 0, char_x, startY);
    }
    else if (character == shylily_portrait_object) {
        draw_sprite(shylily_portrait_sprite, 0, char_x, startY);
    }
    else if (character == union_portrait_object) {
        draw_sprite(union_portrait_sprite, 0, char_x, startY);
    }
	else if (character == mawmaw_portrait_object) {
		draw_sprite(mawmaw_portrait_sprite, 0, char_x, startY);
	}
    
    draw_sprite_ext(character.sprite_index, 0, char_x, startY, scale, scale, 0, c_white, 1);
}