///controller_update_zombies()
with (ob_controller)
{
    var player = ob_controller.Player;
    var playerList = ds_list_create();
    ds_list_add(playerList, player);
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        var zombie = ds_list_find_value(ZombieList, i);
        
        with (zombie)
        {
            var dir = point_direction(x, y, player.x, player.y);
            if (IsItem == true && IsHeld == false)
            {
                x += lengthdir_x(10, dir);
                y += lengthdir_y(10, dir);
                if (point_distance(x, y, player.x, player.y) < player.Radius)
                {
                    player.ZombieCount++;
                    IsHeld = true;
                }
            }
            if (Hp > 0)
            {
                var totalAccel = 0.3 * (sin(MovementTimer / 10) + 1.3);
                
                if (player.y - 100 > y)
                {
                    dir = point_direction(x, y, (player.x - x)/2 + x, player.y);
                }
    
                XSpeed += lengthdir_x(totalAccel, dir);
                YSpeed += lengthdir_y(totalAccel, dir);
            
                collisions = actor_get_collisions(zombie, playerList, 3);
                for (var j = 0; j < ds_list_size(collisions); j++)
                {
                    var player = ds_list_find_value(collisions, j);
                    controller_set_player_hp(-1);
                }
                
                ds_list_destroy(collisions);
            }
            else if (Hp < -3)
            {
                ds_list_delete(ob_controller.ZombieList, i);
                instance_destroy();
                i--;
            }
            
            MovementTimer++;
        }
    }
    ds_list_destroy(playerList);
}
