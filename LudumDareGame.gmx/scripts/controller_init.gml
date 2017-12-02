///controller_init()
with (ob_controller)
{
    globalvar _x, _y;
    Player = player_create(room_width/2, room_height/2);
    LevelStartTimer = 50;
    LevelStarted = false;
    ZombieList = ds_list_create();
    BombList = ds_list_create();
    BombInnerRadius = 10;
    BombOuterRadius = 50;
}
