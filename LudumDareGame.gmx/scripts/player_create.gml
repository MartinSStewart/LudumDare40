///player_create(x, y)
with (instance_create(argument0, argument1, ob_player))
{
    XSpeed = 0;
    YSpeed = 0;
    Accel = 3;
    Damping = 0.5;
    actor_init(3, 3, 0.5);
    
    return self.id;
}
