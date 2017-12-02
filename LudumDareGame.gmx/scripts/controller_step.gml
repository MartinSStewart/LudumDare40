///controller_step()
with (ob_controller)
{
    if (LevelStartTimer <= 0 && LevelStarted == false)
    {
        for (var i = 0; i < 30; i++)
        {
            var newZombie = zombie_create(0, 0);
            if (random(1) > 0.5)
            {
                newZombie.x = random(room_width);
                newZombie.y = (random(1) > 0.5) * room_height;
            }
            else
            {
                newZombie.y = random(room_height);
                newZombie.x = (random(1) > 0.5) * room_width;
            }
            
            ds_list_add(ZombieList, newZombie);
        }
        LevelStarted = true;
        LastPlacedZombieX = -1;
    }

    player_step(Player);
    
    controller_update_bombs();
    controller_update_zombies();
    
    actor_dampen_speed(Player);
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        actor_dampen_speed(ds_list_find_value(ZombieList, i));
    }
    
    controller_move_actors();
    
    if (Player.Hp <= 0 && GameOverTimer <= 0 && keyboard_check(vk_anykey))
    {
        with (Player)
        {
            instance_destroy();
        }
        with (ob_zombie)
        {
            instance_destroy();
        }
        with (ob_bomb)
        {
            instance_destroy();
        }
        ds_list_destroy(BombList);
        ds_list_destroy(ZombieList);
        controller_init(false);
    }
    
    if (LevelComplete == true)
    {
        if (LevelCompleteTimer < -100)
        {
            LevelComplete = false;
            LevelStarted = false;
            LevelStartTimer = LevelStartTimerLength;
        }
        var placeX = clamp(mouse_x, 32, room_width - 32);
        var placeY = clamp(mouse_y, 32, room_height - 32);
        if (mouse_check_button_pressed(mb_left))
        {
            controller_place_zombie(placeX, placeY);
        }
        else if (mouse_check_button(mb_left) && LastPlacedZombieX >= 0)
        {
            var distance = 33;
            while (point_distance(LastPlacedZombieX, LastPlacedZombieY, placeX, placeY) >= distance)
            {
                var x0 = LastPlacedZombieX;
                var y0 = LastPlacedZombieY;
                var dir = point_direction(x0, y0, placeX, placeY);
                controller_place_zombie(x0 + lengthdir_x(distance, dir), y0 + lengthdir_y(distance, dir));
            }
        }
    }
    
    LevelStartTimer--;
    GameOverTimer--;
    LevelCompleteTimer--;
}
