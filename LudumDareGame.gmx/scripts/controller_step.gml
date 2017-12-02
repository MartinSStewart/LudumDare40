///controller_step()
with (ob_controller)
{
    if (LevelStartTimer <= 0 && LevelStarted == false)
    {
        for (var i = 0; i < 10; i++)
        {
            var newZombie = zombie_create(random(room_width), 0);
            ds_list_add(ZombieList, newZombie);
        }
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
            player_throw_pos(id);
            var bomb = bomb_create(x, y, _x, _y);
            ThrowDistance = ThrowDistanceMin;
            ThrowCooldownTimer = ThrowCooldownTimerLength;
            ds_list_add(ob_controller.BombList, bomb);
        }
        
        ThrowCooldownTimer--;
    }
    
    controller_update_bombs();
    controller_update_zombies();
    
    actor_dampen_speed(Player);
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        actor_dampen_speed(ds_list_find_value(ZombieList, i));
    }
    
    controller_move_actors();
    
    LevelStartTimer--;
}
