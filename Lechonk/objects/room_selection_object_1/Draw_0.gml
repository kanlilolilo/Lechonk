// Draw event: Loop through the characters array and draw each character
for (var i = 0; i < array_length(characters); i++) {
    var char_x = lerped_positions[i];  // Use the smooth position

    // Set scale based on whether the character is selected
   var scale = lerped_scales[i];
    
    // The current character object (Capy, Shylily, Union)
    var character = characters[i];

    // Use the object’s sprite and draw it manually
    if (character == capy_portrait_object) {
        draw_sprite(capy_portrait_sprite, 0, char_x, startY);  // Replace `capy_portret` with the correct sprite name
    }
    else if (character == shylily_portrait_object) {
        draw_sprite(shylily_portrait_sprite, 0, char_x, startY);  // Replace `shylily_portret` with the correct sprite name
    }
    else if (character == union_portrait_object) {
        draw_sprite(union_portrait_sprite, 0, char_x, startY);  // Replace `union_portret` with the correct sprite name
    }
    
    // Apply the smooth scaling factor for resizing
    draw_sprite_ext(character.sprite_index, 0, char_x, startY, scale, scale, 0, c_white, 1);
}
