// In the Left Pressed (or Left Released) event of a character selection object

audio_play_sound(soviet, 0, false);

if (global.selection_turn == 1) {
    global.p1_selected_character = soviet_union_object; // Store the id of the selected character for Player 1
    global.selection_turn = 2; // Switch to Player 2's turn
} else if (global.selection_turn == 2) {
    global.p2_selected_character = soviet_union_object; // Store the id of the selected character for Player 2
    global.selection_turn = 1; // Switch back to Player 1's turn or end selection process
}
