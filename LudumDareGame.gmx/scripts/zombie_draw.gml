///zombie_draw(zombie instance)
with (argument0)
{
    if (IsHeld)
    {
        exit;
    }
    var sprite = sp_zombie;
    if (Hp <= 0)
    {
        sprite = sp_zombie_dead;
    }
    else if (Hp < 2)
    {
        sprite = sp_zombie_hurt;
    }
    draw_sprite(sprite, image_index, x, y);
}
