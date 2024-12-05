if (character_name == "mawmaw" && mawmaw_attacking == true) {
    // Make the other player disappear and follow
	other.input_disabled = true;
    other.visible = false; // Hide the other player
    other.is_following = true; // Add a flag for following
    other.follow_timer = 120; // Set a timer for 2 seconds (assuming 60 FPS)
	mawmaw_attacking = false;
	mawmaw_full = true
}

// In the other player's Step Event
if (is_following) {
    // Follow mawmaw's position
    x = other.x;
    y = other.y;

    // Decrease the follow timer
    follow_timer--;

    // When the timer ends
    if (follow_timer <= 0) {
		input_disabled = false;
        visible = true; // Make the player visible again
		other.mawmaw_full = false
        is_following = false; // Stop following

        // Apply knockback
        knockback_x = knockback_power * cos(direction);
        knockback_y = knockback_power * -0.4;
        is_knocked_back = true;
        knockback_timer = 0;

        // Adjust knockback multiplier
        knockback_multiplier += knockback_multiplier_increase;
    }
}
