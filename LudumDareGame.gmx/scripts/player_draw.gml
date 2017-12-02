///player_draw(player instance)
with (argument0)
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, (DamageTimer % 15) < 7 || DamageTimer <= 0);
    if (ob_controller.LevelComplete == false)
    {
        player_throw_pos(id);
        draw_circle(_x, _y, ob_controller.BombInnerRadius, true);
        draw_circle(_x, _y, ob_controller.BombOuterRadius, true);
    }
}
