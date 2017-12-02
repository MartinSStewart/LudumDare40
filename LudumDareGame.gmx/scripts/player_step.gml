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
            if (mouse_check_button_pressed(mb_left))
            {
                player_throw_pos(id);
                var bomb = bomb_create(x, y, _x, _y);
                ds_list_add(ob_controller.BombList, bomb);
            }
        }
    }
    
    DamageTimer--;
    ThrowCooldownTimer--;
}
