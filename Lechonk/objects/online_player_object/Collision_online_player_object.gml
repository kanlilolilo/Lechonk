if (character_name == "mawmaw" && mawmaw_attacking == true) {
    // Apply knockback
    other.knockback_x = knockback_power * cos(direction);
    other.knockback_y = knockback_power * -0.4;
    other.is_knocked_back = true;
    other.knockback_timer = 0;

    // Adjust knockback multiplier
    other.knockback_multiplier += knockback_multiplier_increase;
}