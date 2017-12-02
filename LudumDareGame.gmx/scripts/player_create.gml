///player_create(x, y)
with (instance_create(argument0, argument1, ob_player))
{
    XSpeed = 0;
    YSpeed = 0;
    Accel = 3;
    Damping = 0.5;
    actor_init(3, 3, 0.5);
    
    
    ThrowDistanceMax = 300;
    ThrowDistanceMin = 50;
    ThrowDistance = ThrowDistanceMin;
    ThrowCooldownTimer = 0;
    ThrowCooldownTimerLength = 60;
    
    return self.id;
}
