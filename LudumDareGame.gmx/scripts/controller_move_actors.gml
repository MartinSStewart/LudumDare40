///controller_move_actors()
with (ob_controller)
{
    var actorList = ds_list_create();
    ds_list_copy(actorList, ZombieList);
    ds_list_add(actorList, Player);
    
    var separateSpeed = 3;
    var iterations = 3;
    for (var i = 0; i < iterations; i++)
    {
        for (var j = 0; j < ds_list_size(actorList); j++)
        {
            var actor = ds_list_find_value(actorList, j);
        
            var collisions = actor_get_collisions(actor, actorList);
            
            var totalXOffset = 0;
            var totalYOffset = 0;
            for (var k = 0; k < ds_list_size(collisions); k++)
            {
                var collidedActor = ds_list_find_value(collisions, k);
                var dir = point_direction(actor.x, actor.y, collidedActor.x, collidedActor.y) + 180;
                totalXOffset += lengthdir_x(separateSpeed / iterations, dir);
                totalYOffset += lengthdir_y(separateSpeed / iterations, dir);
            }
            
            with (actor)
            {
                x += totalXOffset + XSpeed / iterations;
                y += totalYOffset + YSpeed / iterations;
                
                x = clamp(x, Radius, room_width - Radius);
                if (object_index == ob_zombie)
                {
                    y = min(y, room_height - Radius);
                }
                else
                {
                    y = clamp(y, Radius, room_height - Radius);
                }
            }
            
            ds_list_destroy(collisions);
        }
    }
    
    ds_list_destroy(actorList);
}
