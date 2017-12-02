///controller_init(first init)
with (ob_controller)
{
    if (argument0 == true)
    {
        globalvar _x, _y;
    }
    Player = player_create(room_width/2, room_height/2);
    LevelStartTimerLength = 50;
    LevelStartTimer = LevelStartTimerLength;
    LevelStarted = true//false;
    ZombieList = ds_list_create();
    BombList = ds_list_create();
    BombInnerRadius = 10;
    BombOuterRadius = 50;
    GameOverTimer = 0;
    GameOverTimerLength = 60;
    LevelCompleteTimer = 600//0;
    LevelCompleteTimerLength = 600;
    LevelComplete = true//false;
    Player.ZombieCount = 30;
    
    LastPlacedZombieX = -100000;
    LastPlacedZombieY = 0;
    
}
