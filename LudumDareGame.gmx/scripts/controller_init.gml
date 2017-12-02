///controller_init()
with (ob_controller)
{
    Player = player_create();
    LevelStartTimer = 50;
    LevelStarted = false;
    ZombieList = ds_list_create();
}
