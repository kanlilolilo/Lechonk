if (other.player_id != bullet_id && bullet_id != -1) {
    // Apply knockback
	if(speed < 0) {
	knockback_power = knockback_power * -1
}
	
    other.knockback_x = knockback_power * cos(direction);
    other.knockback_y = knockback_power * -0.4;
    other.is_knocked_back = true;
    other.knockback_timer = 0;

    other.knockback_multiplier += knockback_multiplier_increase;

    // Destroy the bullet
    instance_destroy();
}
