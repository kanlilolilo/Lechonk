// Initialize the objects in an array
characters = [testroom_room_select_object, fryventure_room_select_object];

// Set up selection-related variables
current_index = 0; // Start with the first character (Capy)
normal_scale = 0.5; // Default size for unselected characters
selection_scale = 0.8; // Scale when the character is selected
offset = 560; // The horizontal space between characters
animation_speed = 0.1; // Speed of the smooth transition (adjust as needed)
position_lerp_speed = 0.2; // Speed of smooth position movement (adjust as needed)

// Calculate the total width of the characters to center them
total_width = array_length(characters) * offset;
startX = display_get_width() / 2; // Center the characters
startY = display_get_height() / 2; // Vertical center of the screen

// Set up the positions for smooth movement
lerped_positions = array_create(array_length(characters), 0);
lerped_scales = array_create(array_length(characters), normal_scale);

// Initialize animation state
animation_timer = 0; // Timer for controlling animation state
