rollback_define_player(online_player_object);

rollback_define_input({
    fire:     [mb_left, ord("K"), ord("X")],
    fire2: [mb_right, ord("L"), ord("C")],
    left:     [ord("A"), vk_left],
    right:    [ord("D"), vk_right],
    up:       [ord("W"), vk_up, vk_space, ord("Z")],
    down:     [ord("S"), vk_down]
});

var _joined = rollback_join_game();

if (!_joined)
{
    rollback_create_game(2, true);
}

// Create the left button
global.Left = virtual_key_add(32, 400, 96, 464, vk_left);

// Create the right button
global.Right = virtual_key_add(128, 400, 192, 464, vk_right);

// Create the jump button
global.Jump = virtual_key_add(640, 400, 704, 464, vk_space);
