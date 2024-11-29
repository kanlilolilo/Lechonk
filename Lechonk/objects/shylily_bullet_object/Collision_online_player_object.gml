if (other.player_id != bullet_id && bullet_id != -1) {
    // Apply knockback
    other.knockback_x = knockback_power * cos(direction);
    other.knockback_y = knockback_power * -0.4;
    other.is_knocked_back = true;
    other.knockback_timer = 0;

    // Adjust knockback multiplier
    if (other.knockback_multiplier > 1.2) {
        other.knockback_multiplier += (knockback_multiplier_increase * 5);
    }
    other.knockback_multiplier += knockback_multiplier_increase;

    // Destroy the bullet
    instance_destroy();
}
