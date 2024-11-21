// Initialize a counter if it doesn't exist
if (!variable_instance_exists(self, "destroy_timer")) {
    destroy_timer = 0; // Start counting at 0
}

// Increment the timer
destroy_timer++;

// Destroy the instance after 10 steps
if (destroy_timer >= 10) {
    instance_destroy(); // Destroy this instance
}
