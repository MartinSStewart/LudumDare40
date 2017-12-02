///controller_step()
with (ob_controller)
{
    if (LevelStartTimer <= 0 && LevelStarted == false)
    {
        var newZombie = zombie_create(100, 300);
        ds_list_add(ZombieList, newZombie);
        LevelStarted = true;
    }

    with (Player)
    {
        if (keyboard_check(ord("W")) != keyboard_check(ord("S")))
        {
            if (keyboard_check(ord("W")))
            {
                YSpeed -= Accel;
            }
            else
            {
                YSpeed += Accel;
            }
        }
        
        if (keyboard_check(ord("A")) != keyboard_check(ord("D")))
        {
            if (keyboard_check(ord("A")))
            {
                XSpeed -= Accel;
            }
            else
            {
                XSpeed += Accel;
            }
        }
        
        if (mouse_check_button(mb_left))
        {
            ThrowDistance = min(ThrowDistance + 3, ThrowDistanceMax);
        }
        
        if (mouse_check_button_released(mb_left))
        {
            var throwDir = point_direction(x, y, mouse_x, mouse_y);
            var bomb = bomb_create(x, y, x + lengthdir_x(ThrowDistance, throwDir), y + lengthdir_y(ThrowDistance, throwDir));
            ThrowDistance = ThrowDistanceMin;
            ThrowCooldownTimer = ThrowCooldownTimerLength;
            ds_list_add(ob_controller.BombList, bomb);
        }
        
        ThrowCooldownTimer--;
    }
    
    for (var i = 0; i < ds_list_size(BombList); i++)
    {
        bomb_step(ds_list_find_value(BombList, i));
    }
    
    actor_dampen_speed(Player);
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        actor_dampen_speed(ds_list_find_value(ZombieList, i));
    }
    
    controller_move_actors();
    
    LevelStartTimer--;
}
