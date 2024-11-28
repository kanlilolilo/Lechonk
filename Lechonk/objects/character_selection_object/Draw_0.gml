// Loop through the characters array and draw each character
for (var i = 0; i < array_length(characters); i++) {  // Use array_length() instead of array_length_1d()
    var char_x = startX + (i - current_index) * offset;  // Position each character based on the current index
    var scale = (i == current_index) ? selection_scale : normal_scale;  // Enlarge the selected character
    
    // The current character object (Capy, Shylily, Union)
    var character = characters[i];

    // Use the object’s sprite and draw it manually
    if (character == capy_portret_object) {
        draw_sprite(capy_portret, 0, char_x, startY);  // Replace `spr_capy_portret` with the correct sprite name
    }
    else if (character == shylily_portret_object) {
        draw_sprite(shylily_portret, 0, char_x, startY);  // Replace `spr_shylily_portret` with the correct sprite name
    }
    else if (character == union_portret_object) {
        draw_sprite(union_portret, 0, char_x, startY);  // Replace `spr_union_portret` with the correct sprite name
    }
    
    // Apply the scale factor for resizing
    var char_width = sprite_get_width(character.sprite_index); 
    var char_height = sprite_get_height(character.sprite_index);
    
    // Draw the sprite with scaling
    draw_sprite_ext(character.sprite_index, 0, char_x, startY, scale, scale, 0, c_white, 1);
}
