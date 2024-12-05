rollback_define_player(online_player_object);

var _joined = rollback_join_game();

if (!_joined)
{
    rollback_create_game(2, false);
}