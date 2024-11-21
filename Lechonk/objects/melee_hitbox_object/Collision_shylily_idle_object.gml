// Collision event with obj_player or obj_enemy
var knockback_strength = knockback_power;  // Use the bullet's speed for knockback strength

// Always reapply knockback velocities
other.knockback_x = knockback_strength * cos(direction);  // Horizontal knockback
other.knockback_y = knockback_strength * -0.4;  // Vertical knockback (upward)

// Reset knockback state to ensure it applies again
other.is_knocked_back = true;

// Optionally, reset a knockback timer if you're using one
other.knockback_timer = 0;

if (other.knockback_multiplier > 1.2) {
	other.knockback_multiplier += 0.002;
}
other.knockback_multiplier += 0.004;

// Destroy the bullet after collision
instance_destroy();
