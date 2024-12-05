// Always reapply knockback velocities
if (other.player_id != bullet_id && bullet_id != -1) {
if(speed < 0) {
	knockback_power = knockback_power * -1
}

other.knockback_x = knockback_power * direction;  // Horizontal knockback
other.knockback_y = knockback_power * -0.2;  // Vertical knockback (upward)

// Reset knockback state to ensure it applies again
other.is_knocked_back = true;

// Optionally, reset a knockback timer if you're using one
other.knockback_timer = 0;

other.knockback_multiplier += knockback_multiplier_increase;

// Destroy the bullet after collision
instance_destroy();
}