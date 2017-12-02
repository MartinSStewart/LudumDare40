///player_step(player instance)
with (Player)
{
    if (Hp > 0)
    {
        if (keyboard_check(ord("W")) != keyboard_check(ord("S")))
        {
            if (keyboard_check(ord("W")))
            {
                YSpeed -= Accel;
            }
            else
            {
                YSpeed += Accel;
            }
        }
        
        if (keyboard_check(ord("A")) != keyboard_check(ord("D")))
        {
            if (keyboard_check(ord("A")))
            {
                XSpeed -= Accel;
            }
            else
            {
                XSpeed += Accel;
            }
        }
        
        if (ob_controller.LevelComplete == false)
        {
            if (mouse_check_button(mb_left))
            {
                ThrowDistance = min(ThrowDistance + 3, ThrowDistanceMax);
            }
            
            if (mouse_check_button_released(mb_left))
            {
                player_throw_pos(id);
                var bomb = bomb_create(x, y, _x, _y);
                ThrowDistance = ThrowDistanceMin;
                ThrowCooldownTimer = ThrowCooldownTimerLength;
                ds_list_add(ob_controller.BombList, bomb);
            }
        }
    }
    
    DamageTimer--;
    ThrowCooldownTimer--;
}
