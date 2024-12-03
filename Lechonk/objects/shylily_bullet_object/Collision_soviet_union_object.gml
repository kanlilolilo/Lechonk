// Always reapply knockback velocities
other.knockback_x = knockback_power * cos(direction);  // Horizontal knockback
other.knockback_y = knockback_power * -0.4;  // Vertical knockback (upward)

// Reset knockback state to ensure it applies again
other.is_knocked_back = true;

// Optionally, reset a knockback timer if you're using one
other.knockback_timer = 0;

other.knockback_multiplier += knockback_multiplier_increase;

// Destroy the bullet after collision
instance_destroy();
