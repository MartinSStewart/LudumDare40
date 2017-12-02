///player_create(x, y)
with (instance_create(argument0, argument1, ob_player))
{
    actor_init(3, 0.5, 0.2, 5);
    
    ZombieCount = 0;
    
    ThrowCooldownTimer = 0;
    ThrowCooldownTimerLength = 60;
    DamageTimer = 0;
    DamageTimerLength = 60;
    
    return self.id;
}
