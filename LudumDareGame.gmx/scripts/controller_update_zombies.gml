///controller_update_zombies()
with (ob_controller)
{
    var player = ob_controller.Player;
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        var zombie = ds_list_find_value(ZombieList, i);
        
        with (zombie)
        {
            var totalAccel = 0.3 * (sin(MovementTimer / 10) + 1.3);
            var dir = point_direction(x, y, player.x, player.y);
            if (player.y - 100 > y)
            {
                dir = point_direction(x, y, (player.x - x)/2 + x, player.y);
            }

            XSpeed += lengthdir_x(totalAccel, dir);
            YSpeed += lengthdir_y(totalAccel, dir);
        
            if (zombie.Hp <= 0)
            {
                ds_list_delete(ob_controller.ZombieList, i);
                instance_destroy();
                i--;
            }
            MovementTimer++;
        }
    }
}
