///controller_update_bombs()
with (ob_controller)
{
    for (var i = 0; i < ds_list_size(BombList); i++)
    {
        var bomb = ds_list_find_value(BombList, i); 
        bomb_step(bomb);
        if (bomb.Timer <= 0)
        {
            var collisions = actor_get_collisions(bomb, ZombieList, 0);
            for (var j = 0; j < ds_list_size(collisions); j++)
            {
                var zombie = ds_list_find_value(collisions, j);
                var distance = point_distance(bomb.x, bomb.y, zombie.x, zombie.y) + zombie.Radius;
                if (distance < ob_controller.BombInnerRadius)
                {
                    controller_set_zombie_hp(zombie, -2);
                }
                else
                {
                    controller_set_zombie_hp(zombie, -1);
                }
            }
            
            ds_list_destroy(collisions);
            ds_list_delete(BombList, i);
            with (bomb)
            {
                instance_destroy();
            }
            i--;
        }
    }
}
