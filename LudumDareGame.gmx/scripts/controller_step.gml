///controller_step()
with (ob_controller)
{
    if (LevelStartTimer <= 0 || LevelStarted == false)
    {
        var newZombie = zombie_create(0, 0);
        ds_list_add(ZombieList, newZombie);
    }

    if (keyboard_check(ord("W")) != keyboard_check(ord("S")))
    {
        if (keyboard_check(ord("W")))
        {
            Player.YSpeed -= Player.Accel;
        }
        else
        {
            Player.YSpeed += Player.Accel;
        }
    }
    
    if (keyboard_check(ord("A")) != keyboard_check(ord("D")))
    {
        if (keyboard_check(ord("A")))
        {
            Player.XSpeed -= Player.Accel;
        }
        else
        {
            Player.XSpeed += Player.Accel;
        }
    }
    
    actor_dampen_speed(Player);
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        actor_dampen_speed(ds_list_find_value(ZombieList, i));
    }
    
    Player.x += Player.XSpeed;
    Player.y += Player.YSpeed;
    if (Player.x > room_width)
    {
        Player.x = room_width;
    }
    if (Player.y > room_height)
    {
        Player.y = room_height;
    }
    if (Player.x < 0)
    {
        Player.x = 0;
    }
    if (Player.y < 0)
    {
        Player.y = 0;
    }
    
    LevelStartTimer--;
}
