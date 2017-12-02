///actor_get_collisions(actor instance, actors)
with (argument0)
{
    var collisions = ds_list_create();
    for (var i = 0; i < ds_list_size(argument1); i++)
    {
        var actor = ds_list_find_value(argument1, i);
        if (actor == argument0)
        {
            continue;
        }
        var distance = point_distance(x, y, actor.x, actor.y);
        if (distance < Radius + actor.Radius)
        {
            ds_list_add(collisions, actor);   
        }
    }
    return collisions;
}
