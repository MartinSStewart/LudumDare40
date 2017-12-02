///player_draw(player instance)
with (argument0)
{
    draw_sprite(sprite_index, image_index, x, y);
    player_throw_pos(id);
    draw_circle(_x, _y, ob_controller.BombInnerRadius, true);
    draw_circle(_x, _y, ob_controller.BombOuterRadius, true);
}
