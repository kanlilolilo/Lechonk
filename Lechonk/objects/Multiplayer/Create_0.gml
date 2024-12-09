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