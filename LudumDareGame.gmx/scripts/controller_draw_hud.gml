///controller_draw_hud()
with (ob_controller)
{
    draw_set_font(fn_default);
    var x0 = 30;
    var y0 = 30;
    for (var i = 0; i < Player.Hp; i++)
    {
        draw_sprite(sp_hp_counter, 0, x0 + i * 40, y0);
    }
    
    if (Player.Hp <= 0 && GameOverTimer <= 0)
    {
        if (GameOverTimer <= 0)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_text(room_width / 2, room_height / 2, "GAME OVER!");
        }
        if (GameOverTimer <= -60)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_text(room_width / 2, room_height / 2 + 60, "Press any key to restart.");
        }    
    }
    else if (LevelComplete)
    {
        if (LevelCompleteTimer < LevelCompleteTimerLength - 30 && LevelCompleteTimer > LevelCompleteTimerLength - 180)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_text(room_width / 2, room_height / 2, "Level Completed!");
        }
        if (LevelCompleteTimer < LevelCompleteTimerLength - 30 && LevelCompleteTimer >= 0)
        {
            var index = (1 - LevelCompleteTimer/LevelCompleteTimerLength) * sprite_get_number(sp_timer);
            draw_sprite(sp_timer, index, room_width - 60, 10);
        }
        
        if (Player.ZombieCount > 0)
        {
            draw_set_halign(fa_right);
            draw_set_valign(fa_center);
            draw_text(room_width - 10, 100, "Zombies: " + string(Player.ZombieCount));
        }
        
        if (LevelCompleteTimer <= 0)
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            draw_text(room_width / 2, room_height / 2, "Next wave incoming...");
        }
    }
}
