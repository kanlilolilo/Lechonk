// Initialize the objects in an array
characters = [capy_portret_object, shylily_portret_object, union_portret_object];

// Set up selection-related variables
current_index = 0; // Start with the first character (Capy)
normal_scale = 2; // Default size for unselected characters
selection_scale = 3; // Scale when the character is selected
offset = 360; // The horizontal space between characters

// Calculate the total width of the characters to center them
total_width = array_length(characters) * offset;
startX = display_get_width() / 2; // Center the characters
startY = display_get_height() / 2; // Vertical center of the screen
