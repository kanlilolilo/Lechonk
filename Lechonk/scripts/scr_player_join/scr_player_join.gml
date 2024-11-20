// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_join() {
	
	if player_join () {
	var active_players = 0;
	
	 // Check for active players and assign the next slot
    var my_player_id = -1; // Initialize to -1 (no available slot)
    with (obj_player) {
        active_players++;
        if (player_id == 1 || player_id == 2 || player_id == 3 || player_id == 4) {
            continue; // Skip if already assigned
        }
    }

    // Assign the next available slot
    if (active_players < 4) {
        next_player_id = active_players + 1; // Assign the next available player ID
    } else {
        show_debug_message("Maximum players reached. Cannot add more.");
        return; // Exit function if all slots are full
	}
	
	var new_player = instance_create_layer(100, 100, "PlayerLayer", obj_player); // Adjust spawn position
    new_player.my_player_id = next_player_id; // Assign the player ID (1, 2, 3, or 4)
    new_player.is_active = true; // Mark the player as active

    // Enable character for this player slot
	show_debug_message("Player " + string(next_player_id) + " has joined the game!");
	}
}