///zombie_create(x, y)
with (instance_create(argument0, argument1, ob_zombie))
{
    actor_init(2, 4, 0.5, 10);
    MovementTimer = random(200);
    IsHeld = false;
    IsPathfinding = true;
    
    return self.id;
}
