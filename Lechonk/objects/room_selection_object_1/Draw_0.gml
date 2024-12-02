// Draw event: Loop through the characters array and draw each character
for (var i = 0; i < array_length(characters); i++) {
    var char_x = lerped_positions[i];  // Use the smooth position

    // Set scale based on whether the character is selected
    var scale = (i == current_index) ? selection_scale : normal_scale;  // Make the selected character bigger
    
    // The current character object (Capy, Shylily, Union)
    var character = characters[i];

    // Use the object’s sprite and draw it manually
    if (character == capy_portret_object) {
        draw_sprite(capy_portret, 0, char_x, startY);  // Replace `capy_portret` with the correct sprite name
    }
    else if (character == shylily_portret_object) {
        draw_sprite(shylily_portret, 0, char_x, startY);  // Replace `shylily_portret` with the correct sprite name
    }
    else if (character == union_portret_object) {
        draw_sprite(union_portret, 0, char_x, startY);  // Replace `union_portret` with the correct sprite name
    }
    
    // Apply the smooth scaling factor for resizing
    draw_sprite_ext(character.sprite_index, 0, char_x, startY, scale, scale, 0, c_white, 1);
}
