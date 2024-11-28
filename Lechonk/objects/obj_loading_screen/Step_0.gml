var player1 = instance_find(online_player_object, 0); // Finds the first instance
var player2 = instance_find(online_player_object, 1); // Finds the second instance

if (player1 && player2) {
    // Code to execute if the player object exists
	room_goto(CharacterSelect)
}